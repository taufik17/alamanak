const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/recipe/searchRecipeController');

// get recipe
Router.get('/recipe', controller.getAllRecipe);

// get category recipe
Router.get('/category_recipe', controller.getAllCategory);

// get recipe by category
Router.post('/recipe/find/category', controller.getRecipeCategory);

// find recipe by popular
Router.get('/recipe/find/popular', controller.findRecipePopular);

// find like by
Router.get('/recipe/find/like', controller.findRecipeLiked);

// find recipe by name
Router.get('/recipe/find/name', controller.findRecipeName);

// find recipe by id
Router.post('/recipe/find/id', controller.findRecipeID);

// find recipe by user
Router.post('/recipe/find/id_user', controller.findRecipeUser);

// find saved recipe by user
Router.post('/recipe/findSave/id_user', controller.findSavedRecipeUser);

// find like recipe by user
Router.post('/recipe/findLike/id_user', controller.findLikeRecipeUser);

// is like recpie?
Router.post('/recipe/find/isLike', controller.findIslikeRecipe);

// is saved recpie?
Router.post('/recipe/find/isSaved', controller.findIsSavedRecipe);

// get step video
Router.get('/recipe/video/id_recipe', controller.getStepVideo);

// get latest recipe
Router.get('/recipe/find/latest', controller.getLatestRecipe);

// get my recip
Router.get('/recipe/find/myrecipe', verifyToken.checkToken, controller.findMyRecipe);

// find recipe by ingredients and name recipe
Router.post('/recipe/searchRecipe', controller.getSearchRecipe);
module.exports = Router;
