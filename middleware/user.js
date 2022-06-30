/* eslint-disable linebreak-style */
const modelSearch = require('../model/users/searchUserModel');

const checkUser = async (req, res, next) => {
  try {
    const {
      email, password, name, phone,
    } = req.body;
    const isValid = password && name && email && phone;
    if (isValid) {
      const checkUserEmail = await modelSearch.getProfileMail(email);
      if (checkUserEmail.rowCount > 0) {
        res.status(400).send('email is already registred');
        return;
      }
      next();
    } else {
      res.status(400).send('Error params');
      return;
    }
  } catch (error) {
    res.status(500).send('Found Error');
  }
};

module.exports = { checkUser };
