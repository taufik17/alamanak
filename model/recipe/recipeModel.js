const db = require('../../db');

const addRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO recipe (recipe_name, recipe_image, ingredients, id_user) VALUES ($1, $2, $3, $4) RETURNING *',
    [props.recipeName, props.recipeImage, props.ingredients, props.idUser],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const addVideo = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO recipe (recipe_name, recipe_image, ingredients, id_user) VALUES ($1, $2, $3, $4) RETURNING *',
    [props.recipeName, props.recipeImage, props.ingredients, props.idUser],
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
  addRecipe,
  addVideo,
};
