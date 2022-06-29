const model = require('../../model/recipe/recipeModel');
const modelSearchUser = require('../../model/users/searchUserModel');

const getAddRecipe = async (req, res) => {
  try {
    const {
      idUser,
      recipeName,
      recipeImage,
      ingredients,
      video,
    } = req.body;
    const getDataUser = await modelSearchUser.getByID(idUser);
    if (getDataUser.rows[0]?.id_user) {
      const addRecipe = await model.addRecipe({
        idUser,
        recipeName,
        recipeImage,
        ingredients,
      });
      const idRecipe = addRecipe.rows[0]?.id_recipe;
      const addVideo = await

      res.send('sukses');
    } else {
      res.status(400).send('Failed to add recipe, need users valid auth');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  getAddRecipe,
};
