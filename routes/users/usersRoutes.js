const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/users/userController');
// const midUser = require('../../middleware/user');

// My Profile
Router.post('/users/myprofile', verifyToken.checkToken, controller.myProfile);

// edit users
Router.patch('/users/edit', verifyToken.checkToken, controller.editUser);

// delete user
Router.delete('/users/delete', verifyToken.checkToken, controller.deleteUser);

module.exports = Router;
