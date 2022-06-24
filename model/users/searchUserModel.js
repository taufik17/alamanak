const db = require('../../db');

const getAllUser = () => new Promise((resolve, reject) => {
  db.query(
    'SELECT * FROM profile ORDER BY profile.id_profile ASC',
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const getByName = (name) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM profile WHERE name LIKE $1', [`%${name}%`], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

const getByID = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM users WHERE id_user = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

const getProfileID = (id) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM profile WHERE id_user = $1', [id], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

module.exports = {
  getAllUser, getByName, getByID, getProfileID,
};