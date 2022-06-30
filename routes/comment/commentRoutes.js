const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/comment/commentController');
const middleComment = require('../../middleware/comment');

// add comment
Router.post('/comment/add', verifyToken.checkToken, controller.addComment);

// update comment
Router.patch('/comment/edit', verifyToken.checkToken, middleComment.checkParamEdit, controller.editComment);

// delete comment
Router.delete('/comment/delete', verifyToken.checkToken, middleComment.checkParamDelete, controller.deleteComment);

module.exports = Router;
