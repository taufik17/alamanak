const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const modelSearch = require('../../model/users/searchUserModel');
require('dotenv').config();

const getLogin = async (req, res) => {
  try {
    const { email, password } = req.body;

    const getUserByEmail = await modelSearch.getProfileMail(email);

    if (getUserByEmail?.rowCount) {
      const checkPassword = bcrypt.compareSync(password, getUserByEmail?.rows[0]?.password);

      if (checkPassword) {
        const token = jwt.sign(getUserByEmail?.rows[0], process.env.SECRET_KEY, { expiresIn: '24h' });
        res.status(200).send({
          message: 'Login Success',
          token,
        });
      } else {
        res.status(401).send({
          message: 'Login Failed, Invalid Password',
        });
      }
    } else {
      res.status(400).send({
        message: 'Login Failed, Email not registered',
      });
    }
  } catch (error) {
    res.status(400).send('Something error');
  }
};

module.exports = { getLogin };
