/* eslint-disable linebreak-style */
const Router = require('express').Router();
const verifyToken = require('../../middleware/verifyToken');
const controller = require('../../controllers/recipe/recipeController');
const midRecipe = require('../../middleware/recipe');
const upload = require('../../middleware/upload');
// const upload = require('../../middleware/upload');

// add recipe
Router.post(
  '/recipe/add',
  verifyToken.checkToken,
  upload.uploadSingle,
  midRecipe.checkParamAdd,
  controller.getAddRecipe,
);

// add like recipe
Router.post(
  '/recipe/addLikeRecipe',
  // verifyToken.checkToken,
  midRecipe.checkParamLikeRecipe,
  controller.getAddLikeRecipe,
);

// un like recipe
Router.post(
  '/recipe/addUnlikeRecipe',
  // verifyToken.checkToken,
  midRecipe.checkParamLikeRecipe,
  controller.getUnlikeRecipe,
);

// add save recipe
Router.post(
  '/recipe/addSaveRecipe',
  // verifyToken.checkToken,
  midRecipe.checkParamLikeRecipe,
  controller.getAddSaveRecipe,
);

// un save recipe
Router.post(
  '/recipe/addUnsaveRecipe',
  // verifyToken.checkToken,
  midRecipe.checkParamLikeRecipe,
  controller.getUnsaveRecipe,
);

// Upload Single Image
Router.post('/image', upload.uploadSingle, (req, res) => {
  const { testing, testing2 } = req.body;
  console.log(req.file);
  console.log(testing, testing2);
  res.send('sukses');
});

// edit recipe
Router.patch('/recipe/edit', verifyToken.checkToken, midRecipe.checkParamEdit, controller.getEditRecipe);

// edit delete
Router.delete('/recipe/delete', verifyToken.checkToken, midRecipe.checkParamDelete, controller.getDeleteRecipe);

module.exports = Router;
