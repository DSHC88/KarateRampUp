function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }
  var config = {
    t: 1000,
    uiUrl: "https://demoqa.com",
    bankUrl: "https://parabank.parasoft.com",
    bankAPI: "http://parabank.parasoft.com/parabank/services/bank/",
    uiUrl2: "https://the-internet.herokuapp.com/",
  };
  karate.configure("driver", {
    type: "chromedriver",
    executable: "src\\test\\java\\drivers\\chrome\\chromedriver.exe"
  });
  return config;
}
