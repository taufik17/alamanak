const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const model = require('../../model/users/userModel');
const modelSearch = require('../../model/users/searchUserModel');
require('dotenv').config();

const myProfile = async (req, res) => {
  try {
    const token = req.headers?.authorization;
    const decoded = jwt.verify(token?.substring(7, token?.length), process.env.SECRET_KEY);
    res.send(decoded);
  } catch (error) {
    res.status(400).send('Error Found');
  }
};

const registerUser = async (req, res) => {
  try {
    const {
      username, password, name, email, phone,
    } = req.body;

    const salt = bcrypt.genSaltSync(15);
    const hash = bcrypt.hashSync(password, salt);

    const userImage = `images/${req.file?.filename}` || 'default.jpg';
    const addUser = await model.addUser({ username, password: hash });
    const userId = addUser.rows[0]?.id_user;
    const addProfile = await model.addProfile({
      name, email, phone, userImage, userId,
    });

    if (addProfile) {
      res.send('data berhasil ditambah');
    } else {
      res.status(400).send('data gagal ditambah');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const editUser = async (req, res) => {
  try {
    const {
      id, username, password, name, email, phone, userImage,
    } = req.body;
    if (id) {
      const getData = await modelSearch.getByID(id);
      const getDataProfile = await modelSearch.getProfileID(id);
      if (getData.rowCount > 0) {
        const inputUsername = username || getDataProfile?.rows[0].username;
        const inputPassword = password || getDataProfile?.rows[0].password;
        const inputName = name || getDataProfile?.rows[0].name;
        const inputEmail = email || getDataProfile?.rows[0].email;
        const inputPhone = phone || getDataProfile?.rows[0].phone;
        const inputUserImage = userImage || getDataProfile?.rows[0].userImage;
        let messageSuccess = '';
        let messageError = '';
        if (username) messageSuccess += 'username, ';
        if (password) messageSuccess += 'password, ';
        if (name) messageSuccess += 'name, ';
        if (phone) messageSuccess += 'phone, ';
        if (userImage) messageSuccess += 'userImage, ';

        const checkUsername = await modelSearch.getProfileUsername(username);
        const checkUserEmail = await modelSearch.getProfileMail(email);

        if (checkUsername.rowCount > 0) messageError += 'username, ';
        if (checkUserEmail.rowCount > 0) messageError += 'email, ';
        if ((checkUsername.rowCount || checkUserEmail.rowCount) > 0) {
          res.status(400).send(`Cannot change: ${messageError}is already registered`);
        } else {
          const doEditUser = await model.doEditUser({ inputUsername, inputPassword, id_user: id });
          const doEditProfil = await model.doEditProfil({
            inputName, inputEmail, inputPhone, inputUserImage, id_user: id,
          });
          if (doEditUser && doEditProfil) {
            res.send(`${messageSuccess}berhasil diubah`);
          } else {
            res.status(400).send('ada yang error saat merubah data');
          }
        }
      } else {
        res.status(400).send('data tidak ditemukan');
      }
    } else {
      res.status(400).send('id ubah harus dikirim');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const deleteUser = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await modelSearch.getByID(id);

    if (getData.rowCount > 0) {
      const doDeleteUser = await model.doDeleteUser(id);
      if (doDeleteUser) {
        res.send(`data dengan id: ${id} berhasil dihapus`);
      } else {
        res.status(400).send('data gagal dihapus');
      }
    } else {
      res.status(400).send('data tidak ditemukan');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = {
  registerUser, editUser, deleteUser, myProfile,
};
