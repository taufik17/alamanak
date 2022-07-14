const Router = require('express').Router();

const controller = require('../../controllers/users/searchUserController');
const verifyToken = require('../../middleware/verifyToken');

// get users profile
Router.get('/users', verifyToken.checkToken, verifyToken.checkRole, controller.getUsers);

// find users
Router.get('/users/find/name', verifyToken.checkRole, controller.findUsersName);

module.exports = Router;
