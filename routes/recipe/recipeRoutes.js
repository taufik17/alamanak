const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/recipe/recipeController');
const midRecipe = require('../../middleware/recipe');

// add recipe
Router.post('/recipe/add', verifyToken.checkToken, midRecipe.checkParamAdd, controller.getAddRecipe);

// edit recipe
Router.patch('/recipe/edit', verifyToken.checkToken, midRecipe.checkParamEdit, controller.getEditRecipe);

// edit delete
Router.delete('/recipe/delete', verifyToken.checkToken, midRecipe.checkParamDelete, controller.getDeleteRecipe);

module.exports = Router;
