const model = require('../../model/recipe/searchRecipeModel');

const getAddRecipe = async (req, res) => {
  try {
    const { username, password } = req.body;
    console.log(username, password);
    const getData = await model.getAllRecipe();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  getAddRecipe,
};
