const Router = require('express').Router();

const controller = require('../../controllers/users/searchUserController');

// get users
Router.get('/users', controller.getUsers);

// find users
Router.get('/users/find/name', controller.findUsersName);

module.exports = Router;
