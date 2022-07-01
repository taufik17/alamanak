/* eslint-disable linebreak-style */
const searchRecipeModel = require('../model/recipe/searchRecipeModel');

const checkParamAdd = async (req, res, next) => {
  try {
    const {
      recipeName, ingredients,
    } = req.body;
    const isValid = recipeName && ingredients;
    if (isValid) {
      next();
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

const checkParamEdit = async (req, res, next) => {
  try {
    const {
      idRecipe,
    } = req.body;
    const idUser = req.res.locals;
    const isValid = idRecipe && idUser;
    if (isValid) {
      const checkRecipe = await searchRecipeModel.getByUser(idUser);
      if (checkRecipe.rowCount > 0) {
        next();
      } else {
        res.status(400).send('Recipe was not found');
      }
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

const checkParamDelete = async (req, res, next) => {
  try {
    const {
      idRecipe,
    } = req.body;
    const idUser = req.res.locals;
    const isValid = idRecipe && idUser;
    if (isValid) {
      const checkRecipe = await searchRecipeModel.getByUser(idUser);
      if (checkRecipe.rowCount > 0) {
        next();
      } else {
        res.status(400).send('Recipe was not found');
      }
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

module.exports = { checkParamAdd, checkParamEdit, checkParamDelete };
