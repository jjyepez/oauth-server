
require("dotenv").config();

const port = process.env.SERVER_PORT || 8001;
const host = process.env.SERVER_HOST || "localhost";

const pgSqlConnection = require("./databaseHelpers/pgSqlWrapper");

const accessTokenDBHelper = require("./databaseHelpers/accessTokensDBHelper")(
  pgSqlConnection
);

const userDBHelper = require("./databaseHelpers/userDBHelper")(pgSqlConnection);

const oAuthModel = require("./authorisation/accessTokenModel")(
  userDBHelper,
  accessTokenDBHelper
);

const oAuth2Server = require("node-oauth2-server");
const express = require("express");
const expressApp = express();

expressApp.oauth = oAuth2Server({
  model: oAuthModel,
  grants: ["password"],
  debug: true
});

const restrictedAreaRoutesMethods = require("./restrictedArea/restrictedAreaRoutesMethods.js");

const restrictedAreaRoutes = require("./restrictedArea/restrictedAreaRoutes.js")(
  express.Router(),
  expressApp,
  restrictedAreaRoutesMethods
);

const authRoutesMethods = require("./authorisation/authRoutesMethods")(
  userDBHelper
);

const authRoutes = require("./authorisation/authRoutes")(
  express.Router(),
  expressApp,
  authRoutesMethods
);

const bodyParser = require("body-parser");
const cors = require('cors');

expressApp.use(bodyParser.urlencoded({ extended: true }));
expressApp.use(cors());
expressApp.use(require("morgan")("dev"));

expressApp.use(expressApp.oauth.errorHandler());

expressApp.use((req, res, next)=>{
  // custom middleware ---
  if(Object.keys(req.body).length > 0 ){ // solo si llega algo en el body
    if(Object.keys(req.body).length <= 1 ){ // solo si el body tiene una sola linea con todos los datos (MAL FORMATEADO)
      const k = Object.keys(req.body)[0];
      req.body = JSON.parse(k);
    }
  }
  next();
})

expressApp.get("/", (req, res, next) => {
  res.send("it works!");
});

expressApp.use("/auth", authRoutes);

expressApp.use("/restrictedArea", restrictedAreaRoutes);

/* expressApp.use("/restrictedArea/enter", expressApp.oauth.authorise(), (req, res, next) => {
  res
  .status(200)
  .send('Access granted!');
  next();
})
 */

expressApp.use((req, res, next) => {
  console.log(404);
  res.status(404).json({
    error: "Not found"
  });
});

expressApp.listen(port, () => {
  console.log(`Server listening: http://${host}:${port}`);
});
