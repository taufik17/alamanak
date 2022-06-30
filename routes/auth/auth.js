const Router = require('express').Router();
const regController = require('../../controllers/auth/registerController');
const loginController = require('../../controllers/auth/loginController');
const midUser = require('../../middleware/user');

// create / register user
Router.post('/register', midUser.checkUser, regController.registerUser);

// login user
Router.post('/login', loginController.getLogin);

module.exports = Router;
