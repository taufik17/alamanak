/* eslint-disable linebreak-style */
const modelSearch = require('../model/users/searchUserModel');

const checkUser = async (req, res, next) => {
  try {
    const {
      username, email, password, name, phone,
    } = req.body;
    let message = '';
    const isValid = username && password && name && email && phone;
    if (isValid) {
      const checkUsername = await modelSearch.getProfileUsername(username);
      const checkUserEmail = await modelSearch.getProfileMail(email);
      if (checkUsername.rowCount > 0) message += 'username, ';
      if (checkUserEmail.rowCount > 0) message += 'email, ';
      if ((checkUsername.rowCount || checkUserEmail.rowCount) > 0) {
        res.status(400).send(`${message}is already registred`);
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
