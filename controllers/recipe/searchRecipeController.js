/* eslint-disable linebreak-style */
const model = require('../../model/recipe/searchRecipeModel');

const getAllRecipe = async (req, res) => {
  try {
    const getData = await model.getAllRecipe();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getAllCategory = async (req, res) => {
  try {
    const getData = await model.getAllCategory();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipePopular = async (req, res) => {
  try {
    const getData = await model.getPopularRecipe();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipePopularAsc = async (req, res) => {
  try {
    const getData = await model.getPopularRecipeAsc();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipePopularDesc = async (req, res) => {
  try {
    const getData = await model.getPopularRecipeDesc();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipeLiked = async (req, res) => {
  try {
    const getData = await model.getLikedRecipe();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findIslikeRecipe = async (req, res) => {
  try {
    const { idUser, idRecipe } = req.body;
    const getData = await model.getIsLikeRecipe(idUser, idRecipe);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findIsSavedRecipe = async (req, res) => {
  try {
    const { idUser, idRecipe } = req.body;
    const getData = await model.getIsSavedRecipe(idUser, idRecipe);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipeName = async (req, res) => {
  try {
    const { name } = req.body;
    const getData = await model.getByName(name);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipeID = async (req, res) => {
  try {
    const { idRecipe } = req.body;
    const getData = await model.getByIdRecipe(idRecipe);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findMyRecipe = async (req, res) => {
  try {
    const idUser = req.res.locals;
    const getData = await model.getByUser(idUser);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findRecipeUser = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await model.geMyRecipe(id);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findLikeRecipeUser = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await model.getLikeByUser(id);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findSavedRecipeUser = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await model.getSavedByUser(id);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getSearchRecipe = async (req, res) => {
  try {
    const { keyword } = req.body;
    const getData = await model.getSearchByKeyword(keyword);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getRecipeSearch = async (req, res) => {
  try {
    const { keyword } = req.query;
    const getData = await model.getSearchByKeyword(keyword);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

// By param
const getRecipeById = async (req, res) => {
  try {
    const { idRecipe } = req.params;
    console.log(idRecipe);
    const getData = await model.getByIdRecipe(idRecipe);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getRecipeCategory = async (req, res) => {
  try {
    const { idCategory } = req.body;
    const getData = await model.getRecipeBycategory(idCategory);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getLatestRecipe = async (req, res) => {
  try {
    const getData = await model.getLatestRecipe();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getStepVideo = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await model.getStepVideo(id);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  getAllRecipe,
  findRecipeName,
  getStepVideo,
  findRecipeUser,
  getLatestRecipe,
  findMyRecipe,
  getAllCategory,
  findRecipePopular,
  findRecipeLiked,
  findIslikeRecipe,
  findIsSavedRecipe,
  findRecipeID,
  findLikeRecipeUser,
  findSavedRecipeUser,
  getSearchRecipe,
  getRecipeCategory,
  getRecipeById,
  getRecipeSearch,
  findRecipePopularAsc,
  findRecipePopularDesc,
};
