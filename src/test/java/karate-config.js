function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'http://localhost:8080/',
    auth: {},// Objeto para credenciales
    headers: {// Headers globales
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }
  if (env == 'dev') {
    config.auth = {
      email: 'rlfernando7@gmail.dev',
      password: '12345'
    };
  } else if (env == 'qa') {
    config.auth = {
      email: 'rlfernando7@gmail.com',
      password: '12345'
    };
  }
  return config;
}