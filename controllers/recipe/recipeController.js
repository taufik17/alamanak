/* eslint-disable linebreak-style */
/* eslint-disable array-callback-return */
/* eslint-disable operator-linebreak */
/* eslint-disable no-unused-vars */
/* eslint-disable quotes */
require("dotenv").config();
const model = require("../../model/recipe/recipeModel");
const searchRecipeModel = require("../../model/recipe/searchRecipeModel");

const getAddRecipe = async (req, res) => {
  try {
    // eslint-disable-next-line object-curly-newline
    const { recipeName, recipeImage, ingredients, category, taste, video } =
      req.body;
    const videoarr = JSON.parse(video);
    const idUser = req.res.locals;
    const { image } = req.res;
    const urlImage = image;
    const addRecipe = await model.addRecipe({
      idUser,
      recipeName: recipeName.trim(),
      recipeImage,
      ingredients,
      category,
      taste,
      image: urlImage,
    });

    const addVideo = await model.addVideo({
      video_name: recipeName.trim(),
      id_recipe: addRecipe.rows[0].id_recipe,
      link: videoarr,
    });

    if (addRecipe && addVideo) {
      res.send("Add Recipe Successfully");
    }
  } catch (error) {
    console.log(error);
    res.status(400).send("ada yang error");
  }
};

const getAddLikeRecipe = async (req, res) => {
  try {
    const { idRecipe, idUser } = req.body;
    const addLikeRecipe = await model.addLikeRecipe({
      idRecipe,
      idUser,
    });
    if (addLikeRecipe) {
      res.send("Like Recipe Successfully");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

const getUnlikeRecipe = async (req, res) => {
  try {
    const { idRecipe, idUser } = req.body;
    const unLikeRecipe = await model.unLikeRecipe({
      idRecipe,
      idUser,
    });
    if (unLikeRecipe) {
      res.send("Unlike Recipe Successfully");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

const getAddSaveRecipe = async (req, res) => {
  try {
    const { idRecipe, idUser } = req.body;
    const addSaveRecipe = await model.addSaveRecipe({
      idRecipe,
      idUser,
    });
    if (addSaveRecipe) {
      res.send("Save Recipe Successfully");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

const getUnsaveRecipe = async (req, res) => {
  try {
    const { idRecipe, idUser } = req.body;
    const unSaveRecipe = await model.unSaveRecipe({
      idRecipe,
      idUser,
    });
    if (unSaveRecipe) {
      res.send("Unsave Recipe Successfully");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

const getEditRecipe = async (req, res) => {
  try {
    const { idRecipe, recipeName, ingredients } = req.body;
    const idUser = req.res.locals;
    const checkRecipe = await searchRecipeModel.getByID(idRecipe);
    if (checkRecipe.rows[0].id_user === idUser) {
      const doEditRecipe = await model.doEditRecipe({
        idRecipe,
        recipeName: recipeName.trim(),
        ingredients,
      });
      if (doEditRecipe) {
        res.send("Edit Successfully");
      } else {
        res.status(400).send("Failed edit");
      }
    } else {
      res.status(401).send("Failed, permission denied");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

const getDeleteRecipe = async (req, res) => {
  try {
    const { idRecipe } = req.body;
    const idUser = req.res.locals;
    const checkRecipe = await searchRecipeModel.getByID(idRecipe);
    if (checkRecipe.rows[0].id_user === idUser) {
      const doDeleteRecipe = await model.doDeleteRecipe(idRecipe);
      if (doDeleteRecipe) {
        res.send("Delete Successfully");
      } else {
        res.status(400).send("Failed delete");
      }
    } else {
      res.status(401).send("Failed, permission denied");
    }
  } catch (error) {
    res.status(400).send("ada yang error");
  }
};

module.exports = {
  getAddRecipe,
  getEditRecipe,
  getDeleteRecipe,
  getAddLikeRecipe,
  getUnlikeRecipe,
  getAddSaveRecipe,
  getUnsaveRecipe,
};
