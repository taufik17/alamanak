const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const midUser = require('../../middleware/user');
const controller = require('../../controllers/users/userController');

// create / register user
Router.post('/users/add', midUser.checkUser, verifyToken.checkToken, controller.registerUser);

// edit users
Router.patch('/users/edit', verifyToken.checkToken, controller.editUser);

// delete user
Router.delete('/users/delete', verifyToken.checkToken, controller.deleteUser);

module.exports = Router;
