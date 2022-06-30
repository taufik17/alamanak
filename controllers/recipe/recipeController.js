const model = require('../../model/recipe/recipeModel');

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
      recipeName,
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

module.exports = {
  getAddRecipe,
};
