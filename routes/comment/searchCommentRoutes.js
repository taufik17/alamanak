const Router = require('express').Router();

const controller = require('../../controllers/comment/searchCommentController');

// get all comment
Router.get('/comment', controller.getAllComment);

// find comment by recipe
Router.get('/comment/find/id_recipe', controller.findCommentRecipe);

module.exports = Router;
