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

// get all category recipe
const getAllCategory = () => new Promise((resolve, reject) => {
  db.query(
    `SELECT categories.id_category, categories.name_category, categories.image, COUNT(categories.id_category) AS jumlah
    FROM categories 
    INNER JOIN recipe 
    ON categories.id_category = recipe.id_category 
    GROUP BY categories.id_category`,
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get popular recipe
const getPopularRecipe = () => new Promise((resolve, reject) => {
  db.query(
    `SELECT recipe.id_recipe, recipe.id_user, recipe.recipe_name, recipe.taste, recipe.recipe_image, categories.name_category, COUNT(like_recipe.id_recipe) AS jumlah FROM recipe
    LEFT JOIN like_recipe ON recipe.id_recipe = like_recipe.id_recipe
    INNER JOIN categories ON categories.id_category = recipe.id_category
    GROUP BY recipe.id_recipe, categories.name_category 
    ORDER BY jumlah DESC`,
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get liked recipe
const getLikedRecipe = () => new Promise((resolve, reject) => {
  db.query(
    `SELECT users.id_user, profile.name, recipe.id_recipe, recipe.recipe_name, like_recipe.id_like AS like FROM users 
    INNER JOIN profile ON users.id_user = profile.id_user
    LEFT JOIN like_recipe ON like_recipe.id_user = users.id_user
    LEFT JOIN recipe ON recipe.id_recipe = like_recipe.id_recipe`,
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

// get isLike Recipe
const getIsLikeRecipe = (idUser, idRecipe) => new Promise((resolve, reject) => {
  db.query(`SELECT users.id_user, profile.name, recipe.id_recipe, recipe.recipe_name, like_recipe.id_like FROM users 
    INNER JOIN profile ON users.id_user = profile.id_user
    LEFT JOIN like_recipe ON like_recipe.id_user = users.id_user
    LEFT JOIN recipe ON recipe.id_recipe = like_recipe.id_recipe
    WHERE users.id_user = $1 AND recipe.id_recipe = $2`, [idUser, idRecipe], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

// get isSaved Recipe
const getIsSavedRecipe = (idUser, idRecipe) => new Promise((resolve, reject) => {
  db.query(`SELECT users.id_user, profile.name, recipe.id_recipe, recipe.recipe_name, save_recipe.id_save FROM users 
  INNER JOIN profile ON users.id_user = profile.id_user
  LEFT JOIN save_recipe ON save_recipe.id_user = users.id_user
  LEFT JOIN recipe ON recipe.id_recipe = save_recipe.id_recipe
  WHERE users.id_user = $1 AND recipe.id_recipe = $2`, [idUser, idRecipe], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
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
  db.query(`SELECT * FROM recipe 
  INNER JOIN categories
  ON categories.id_category = recipe.id_category
  WHERE id_user =  $1`, [id], (error, results) => {
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
  getAllCategory,
  getPopularRecipe,
  getLikedRecipe,
  getIsLikeRecipe,
  getIsSavedRecipe,
};
