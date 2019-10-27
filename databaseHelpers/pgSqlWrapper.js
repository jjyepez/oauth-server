module.exports = {
  query: query
};

const { Pool, Client } = require("pg");

require("dotenv").config();

let connection = null;

function initConnection() {

  const connectionString = process.env.CONNECTION_STRING
    .replace("${DB_DIALECT}" , process.env.DB_DIALECT)
    .replace("${DB_USER}"    , process.env.DB_USER)
    .replace("${DB_PASSWORD}", process.env.DB_PASSWORD)
    .replace("${DB_HOST}"    , process.env.DB_HOST)
    .replace("${DB_PORT}"    , process.env.DB_PORT)
    .replace("${DB_NAME}"    , process.env.DB_NAME);

  connection = new Client({
    connectionString
  });
}

function query(queryString, callback) {
  initConnection();

  connection.connect();

  connection.query(queryString, function(error, results, fields) {
    connection.end();

    callback(createDataResponseObject(error, results));
  });
}

function createDataResponseObject(error, results) {
  return {
    error: error,
    results: results === undefined ? null : results === null ? null : results
  };
}
