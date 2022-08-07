const bcrypt = require('bcrypt');
const model = require('../../model/users/userModel');

const registerUser = async (req, res) => {
  try {
    const {
      email, password, name, phone,
    } = req.body;
    const userImage = 'http://localhost:8000/images/profile/default.svg';

    const salt = bcrypt.genSaltSync(15);
    const hash = bcrypt.hashSync(password, salt);

    const addUser = await model.addUser({ email: email.trim(), password: hash });
    const userId = addUser.rows[0]?.id_user;
    const addProfile = await model.addProfile({
      name: name.trim(), phone: phone.trim(), userImage, userId,
    });

    if (addProfile) {
      res.send('Register Successfully');
    } else {
      res.status(400).send('Register Failed');
    }
  } catch (error) {
    console.log(error);
    res.status(400).send('ada yang error');
  }
};

module.exports = { registerUser };
