const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/recipe/recipeController');

// add recipe
Router.post('/recipe/add', verifyToken.checkToken, controller.getAddRecipe);

module.exports = Router;
