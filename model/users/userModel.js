const db = require('../../db');

const addUser = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO users (username, password) VALUES ($1, $2) RETURNING *',
    [props.username, props.password],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const addProfile = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO profile (name, email, phone, user_image, id_user) VALUES ($1, $2, $3, $4, $5)',
    [props.name, props.email, props.phone, props.user_image, props.user_id],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const editUser = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE users SET username = $1, password = $2 WHERE id_user = $3',
    [props.inputUsername, props.inputPassword, props.id_user],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const editProfil = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE profile SET name = $1, email = $2, phone = $3, user_image = $4 WHERE id_user = $5',
    [props.inputName, props.inputEmail, props.inputPhone, props.inputUserImage, props.id_user],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const deleteUser = (id) => new Promise((resolve, reject) => {
  db.query(
    'DELETE FROM users WHERE id_user = $1',
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
  addUser, addProfile, editUser, editProfil, deleteUser,
};
