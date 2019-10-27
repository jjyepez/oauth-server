require('dotenv').config();

let userDBHelper;
let accessTokensDBHelper;

module.exports = (injectedUserDBHelper, injectedAccessTokensDBHelper) => {
  userDBHelper = injectedUserDBHelper;
  accessTokensDBHelper = injectedAccessTokensDBHelper;
  return {
    getClient: getClient,
    saveAccessToken: saveAccessToken,
    getUser: getUser,
    grantTypeAllowed: grantTypeAllowed,
    getAccessToken: getAccessToken
  };
};

function getClient(clientID, clientSecret, callback) {
  let rslt = false;
  const allowedClientID = process.env.OAUTH_CLIENT_ID;
  const allowedClientSecret = process.env.OAUTH_CLIENT_SECRET;
  const allowedScope = process.env.OAUTH_SCOPE;
  // -- se debe revisar y completar esta lógica
  let client = null;
  if(
    clientID === process.env.OAUTH_CLIENT_ID
    && clientSecret === process.env.OAUTH_CLIENT_SECRET
  ){
    client = {
      clientID,
      clientSecret,
      grants: null,
      redirectUris: null
    };
  }
  callback(false, client);
}

function grantTypeAllowed(clientID, grantType, callback) {
  let rslt = false;
  const allowedGrantType = process.env.OAUTH_GRANT_TYPE;
  // -- se debe revisar y completar esta lógica
  if(
    grantType === allowedGrantType
  ){
    rslt = true;
  }
  console.log(
    "grantTypeAllowed called and clientID is: ",
    clientID,
    " and grantType is: ",
    grantType
  );
  callback(false, rslt);
}

function getUser(username, password, callback) {
  console.log(
    "getUser() called and username is: ",
    username,
    " and password is: ",
    password,
    " and callback is: ",
    callback,
    " and is userDBHelper null is: ",
    userDBHelper
  );

  userDBHelper.getUserFromCrentials(username, password, callback);
}

function saveAccessToken(accessToken, clientID, expires, user, callback) {
  console.log(
    "saveAccessToken() called and accessToken is: ",
    accessToken,
    " and clientID is: ",
    clientID,
    " and user is: ",
    user,
    " and accessTokensDBhelper is: ",
    accessTokensDBHelper
  );

  accessTokensDBHelper.saveAccessToken(accessToken, user.id, callback);
}

function getAccessToken(bearerToken, callback) {
  accessTokensDBHelper.getUserIDFromBearerToken(bearerToken, userID => {
    const accessToken = {
      user: {
        id: userID
      },
      expires: null
    };

    callback(
      userID == null ? true : false,
      userID == null ? null : accessToken
    );
  });
}
