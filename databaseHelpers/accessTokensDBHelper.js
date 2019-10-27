let pgSqlConnection;

module.exports = injectedPgSqlConnection => {
  pgSqlConnection = injectedPgSqlConnection;
  return {
    saveAccessToken: saveAccessToken,
    getUserIDFromBearerToken: getUserIDFromBearerToken
  };
};

function saveAccessToken(accessToken, userID, callback) {
  const getUserQuery = `INSERT INTO access_tokens (access_token, user_id) VALUES ('${accessToken}', ${userID}) ON CONFLICT (id) DO UPDATE SET access_token = '${accessToken}';`;
  pgSqlConnection.query(getUserQuery, dataResponseObject => {
    callback(dataResponseObject.error);
  });
}

function getUserIDFromBearerToken(bearerToken, callback) {
  const getUserIDQuery = `SELECT * FROM access_tokens WHERE access_token = '${bearerToken}';`;

  pgSqlConnection.query(getUserIDQuery, dataResponseObject => {
    const userID =
      dataResponseObject.results != null &&
      dataResponseObject.results.rows.length == 1
        ? dataResponseObject.results.rows[0].user_id
        : null;
    callback(userID);
  });
}
