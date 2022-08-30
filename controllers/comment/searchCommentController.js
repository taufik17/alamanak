const model = require('../../model/comments/searchCommentModel');

const getAllComment = async (req, res) => {
  try {
    const getData = await model.getAllComment();
    res.send({ data: getData.rows, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findCommentRecipe = async (req, res) => {
  try {
    const { idRecipe } = req.body;
    const getData = await model.getCommentRecipe(idRecipe);

    res.send({
      data: getData.rows,
      jumlahData: getData.rowCount,
    });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  getAllComment,
  findCommentRecipe,
};
