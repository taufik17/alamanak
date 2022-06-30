const db = require('../../db');

const getAllUser = (props) => new Promise((resolve, reject) => {
  db.query(
    `SELECT * FROM profile ORDER BY profile.id_profile ${props.validOrder} LIMIT $1 OFFSET $2`,
    [props.perPage, props.offSet],
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
  db.query(
    'SELECT * FROM profile WHERE LOWER(name) LIKE LOWER($1)',
    [`%${name}%`],
    (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    },
  );
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

const getProfileMail = (email) => new Promise((resolve, reject) => {
  db.query(`SELECT username, email, password, users.id_user AS id_user
            FROM users 
            INNER JOIN profile 
            ON users.id_user = profile.id_user 
            WHERE email = $1`, [email], (error, results) => {
    if (error) {
      reject(error);
    } else {
      resolve(results);
    }
  });
});

const getProfileUsername = (username) => new Promise((resolve, reject) => {
  db.query(`SELECT username, email 
            FROM users 
            INNER JOIN profile 
            ON users.id_user = profile.id_user 
            WHERE username = $1`, [username], (error, results) => {
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
  getAllUser,
  getByName,
  getByID,
  getProfileID,
  getProfileMail,
  getProfileUsername,
};
