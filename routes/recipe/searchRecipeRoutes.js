const Router = require('express').Router();

const controller = require('../../controllers/recipe/searchRecipeController');

// get recipe
Router.get('/recipe', controller.getAllRecipe);

// find recipe by name
Router.get('/recipe/find/name', controller.findRecipeName);

// find recipe by user
Router.get('/recipe/find/id_user', controller.findRecipeUser);

// get step video
Router.get('/recipe/video/id_recipe', controller.getStepVideo);

// get latest recipe
Router.get('/recipe/find/latest', controller.getLatestRecipe);

module.exports = Router;
