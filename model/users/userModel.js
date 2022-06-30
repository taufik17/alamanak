const db = require('../../db');

const addUser = (props) => new Promise((resolve, reject) => {
  db.query(
    'INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *',
    [props.email, props.password],
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
    'INSERT INTO profile (name, phone, user_image, id_user) VALUES ($1, $2, $3, $4)',
    [props.name, props.phone, props.userImage, props.userId],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const doEditUser = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE users SET password = $1 WHERE id_user = $2',
    [props.inputPassword, props.id_user],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const doEditProfil = (props) => new Promise((resolve, reject) => {
  db.query(
    'UPDATE profile SET name = $1, phone = $2 WHERE id_user = $3',
    [props.inputName, props.inputPhone, props.id_user],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
});

const doDeleteUser = (id) => new Promise((resolve, reject) => {
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
  addUser, addProfile, doEditUser, doEditProfil, doDeleteUser,
};
