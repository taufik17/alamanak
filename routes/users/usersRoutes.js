const Router = require('express').Router();

const controller = require('../../controllers/users/userController');

// create / register user
Router.post('/users/add', controller.registerUser);

// edit users
Router.patch('/users/edit', controller.editUser);

// delete user
Router.delete('/users/delete', controller.deleteUser);

module.exports = Router;
