let pgSqlConnection;

module.exports = injectedPgSqlConnection => {

  pgSqlConnection = injectedPgSqlConnection;

  return {
    registerUserInDB: registerUserInDB,
    getUserFromCrentials: getUserFromCrentials,
    doesUserExist: doesUserExist
  };
};

function registerUserInDB(username, password, registrationCallback) {
  const registerUserQuery = `INSERT INTO users (username, user_password) VALUES ('${username}', MD5('${password}'))`;

  pgSqlConnection.query(registerUserQuery, registrationCallback);
}

function getUserFromCrentials(username, password, callback) {
  const getUserQuery = `SELECT * FROM users WHERE username = '${username}' AND user_password = MD5('${password}')`;
  
  console.log("getUserFromCrentials query is: ", getUserQuery);

  callback(true, null); // CREDENCIALES INVALIDAS
  return;

  pgSqlConnection.query(getUserQuery, dataResponseObject => {
    callback(
      false,
      dataResponseObject.results !== null &&
        dataResponseObject.results.rows.length === 1
        ? dataResponseObject.results.rows[0]
        : null
    );
  });
}

function doesUserExist(username, callback) {
  const doesUserExistQuery = `SELECT * FROM users WHERE username = '${username}'`;

  const sqlCallback = dataResponseObject => {
    const doesUserExist =
      dataResponseObject.results !== null
        ? dataResponseObject.results.rows.length > 0
          ? true
          : false
        : null;

    callback(dataResponseObject.error, doesUserExist);
  };

  pgSqlConnection.query(doesUserExistQuery, sqlCallback);
}
