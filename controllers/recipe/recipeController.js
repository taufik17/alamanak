const model = require('../../model/recipe/recipeModel');
const searchRecipeModel = require('../../model/recipe/searchRecipeModel');

const getAddRecipe = async (req, res) => {
  try {
    const {
      recipeName,
      recipeImage,
      ingredients,
      // video,
    } = req.body;
    const idUser = req.res.locals;
    const addRecipe = await model.addRecipe({
      idUser,
      recipeName: recipeName.trim(),
      recipeImage,
      ingredients,
    });
    // disini upload video
    if (addRecipe) {
      res.send('Add Recipe Successfully');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getEditRecipe = async (req, res) => {
  try {
    const {
      idRecipe, recipeName, ingredients,
    } = req.body;
    const idUser = req.res.locals;
    const checkRecipe = await searchRecipeModel.getByID(idRecipe);
    if (checkRecipe.rows[0].id_user === idUser) {
      const doEditRecipe = await model.doEditRecipe({ idRecipe, recipeName, ingredients });
      if (doEditRecipe) {
        res.send('Edit Successfully');
      } else {
        res.status(400).send('Failed edit');
      }
    } else {
      res.status(401).send('Failed, permission denied');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getDeleteRecipe = async (req, res) => {
  try {
    const {
      idRecipe,
    } = req.body;
    const idUser = req.res.locals;
    const checkRecipe = await searchRecipeModel.getByID(idRecipe);
    if (checkRecipe.rows[0].id_user === idUser) {
      const doDeleteRecipe = await model.doDeleteRecipe(idRecipe);
      if (doDeleteRecipe) {
        res.send('Delete Successfully');
      } else {
        res.status(400).send('Failed delete');
      }
    } else {
      res.status(401).send('Failed, permission denied');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  getAddRecipe, getEditRecipe, getDeleteRecipe,
};
