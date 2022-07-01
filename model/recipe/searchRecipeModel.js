const db = require('../../db');

// get all recipe
const getAllRecipe = () => new Promise((resolve, reject) => {
  db.query(
    'SELECT * FROM recipe ORDER BY recipe.id_recipe ASC',
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get 5 latest recipe
const getLatestRecipe = () => new Promise((resolve, reject) => {
  db.query(
    'SELECT * FROM recipe ORDER BY recipe.id_recipe DESC LIMIT 5 ',
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get recipe by name recipe
const getByName = (name) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM recipe WHERE LOWER(recipe_name) LIKE LOWER($1)', [`%${name}%`], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

// get recipe by who user post recipe
const getByUser = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM recipe WHERE id_user = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

const getByID = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM recipe WHERE id_recipe = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

const getStepVideo = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM video WHERE id_recipe = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

module.exports = {
  getAllRecipe,
  getByName,
  getStepVideo,
  getByUser,
  getLatestRecipe,
  getByID,
};
