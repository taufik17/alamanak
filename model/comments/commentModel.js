const db = require('../../db');

// insert comment
const doAddComment = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO comment (text_comment, id_user, id_recipe) VALUES ($1, $2, $3)',
    [props.textComment, props.idUser, props.idRecipe],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// edit comment
const doEditComment = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE comment SET text_comment = $1 WHERE id_comment = $2',
    [props.textComment, props.idComment],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// edit delete
const doDeleteComment = (id) => new Promise((resolve, reject) => {
  db.query(
    'DELETE FROM comment WHERE id_comment = $1',
    [id],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

module.exports = {
  doAddComment, doEditComment, doDeleteComment,
};
