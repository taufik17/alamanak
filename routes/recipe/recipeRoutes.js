const Router = require('express').Router();

const controller = require('../../controllers/recipe/recipeController');

// add recipe
Router.post('/recipe/add', controller.getAddRecipe);

module.exports = Router;
