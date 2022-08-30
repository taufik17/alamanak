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
  db.query(`SELECT id_comment, text_comment, name, user_image FROM comment 
  INNER JOIN users ON users.id_user = comment.id_user
  INNER JOIN profile ON profile.id_user = users.id_user
  WHERE comment.id_recipe = $1
  ORDER BY id_comment DESC`, [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

// get comment by id comment
const getCommentById = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM comment WHERE id_comment = $1', [id], (error, results) => {
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
  getCommentById,
};
