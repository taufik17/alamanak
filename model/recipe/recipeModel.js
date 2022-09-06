const db = require('../../db');

const addRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO recipe (recipe_name, recipe_image, ingredients, id_user, id_category, taste) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
    [props.recipeName, props.image, props.ingredients, props.idUser, props.category, props.taste],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const addLikeRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO like_recipe (id_recipe, id_user) VALUES ($1, $2) RETURNING *',
    [props.idRecipe, props.idUser],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const unLikeRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'DELETE FROM like_recipe WHERE id_recipe = $1 AND id_user = $2',
    [props.idRecipe, props.idUser],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const addSaveRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO save_recipe (id_recipe, id_user) VALUES ($1, $2) RETURNING *',
    [props.idRecipe, props.idUser],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const unSaveRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'DELETE FROM save_recipe WHERE id_recipe = $1 AND id_user = $2',
    [props.idRecipe, props.idUser],
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
const doEditRecipe = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE recipe SET recipe_name = $1, ingredients = $2 WHERE id_recipe = $3',
    [props.recipeName, props.ingredients, props.idRecipe],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// delete recipe
const doDeleteRecipe = (id) => new Promise((resolve, reject) => {
  db.query(
    'DELETE FROM recipe WHERE id_recipe = $1',
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

const addVideo = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO video (video_name, id_recipe) VALUES ($1, $2) RETURNING *',
    [props.video_name, props.id_recipe],
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
  doEditRecipe,
  doDeleteRecipe,
  addLikeRecipe,
  unLikeRecipe,
  addSaveRecipe,
  unSaveRecipe,
};
