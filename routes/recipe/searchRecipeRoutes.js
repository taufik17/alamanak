const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/recipe/searchRecipeController');

// get recipe
Router.get('/recipe', controller.getAllRecipe);

// get category recipe
Router.get('/category_recipe', controller.getAllCategory);

// find recipe by name
Router.get('/recipe/find/name', controller.findRecipeName);

// find recipe by user
Router.post('/recipe/find/id_user', controller.findRecipeUser);

// get step video
Router.get('/recipe/video/id_recipe', controller.getStepVideo);

// get latest recipe
Router.get('/recipe/find/latest', controller.getLatestRecipe);

// get my recip
Router.get('/recipe/find/myrecipe', verifyToken.checkToken, controller.findMyRecipe);

module.exports = Router;
