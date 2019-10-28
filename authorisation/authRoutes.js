module.exports = (router, expressApp, authRoutesMethods) => {
  
  router.post("/registerUser", expressApp.oauth.authorise(), authRoutesMethods.registerUser);
  
  router.post("/login", expressApp.oauth.grant(), authRoutesMethods.login);
  
  return router;
};
