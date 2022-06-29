const Router = require('express').Router();
const authController = require('../../controllers/auth/authLoginController');

Router.post('/login', authController.getLogin);

module.exports = Router;
