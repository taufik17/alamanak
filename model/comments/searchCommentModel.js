const db = require('../../db');

// get all comment
const getAllComment = () => new Promise((resolve, reject) => {
  db.query(
    'SELECT * FROM comment ORDER BY comment.id_comment ASC',
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get comment by id recipe
const getCommentRecipe = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM comment WHERE id_recipe = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

module.exports = {
  getAllComment,
  getCommentRecipe,
};
