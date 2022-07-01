const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const model = require('../../model/users/userModel');
const modelSearch = require('../../model/users/searchUserModel');
require('dotenv').config();

const myProfile = async (req, res) => {
  try {
    const token = req.headers?.authorization;
    const decoded = jwt.verify(token?.substring(7, token?.length), process.env.SECRET_KEY);
    const myData = await modelSearch.getProfileUser(decoded.email);
    res.send(myData.rows[0]);
  } catch (error) {
    res.status(400).send('Error Found');
  }
};

const editUser = async (req, res) => {
  try {
    const {
      password, name, phone,
    } = req.body;
    const idUser = req.res.locals;
    const getData = await modelSearch.getByID(idUser);
    const getDataProfile = await modelSearch.getProfileID(idUser);
    if (getData.rowCount > 0) {
      const inputPassword = password || getData?.rows[0].password;
      const inputName = name || getDataProfile?.rows[0].name;
      const inputPhone = phone || getDataProfile?.rows[0].phone;
      let message = '';
      if (password) message += 'password, ';
      if (name) message += 'name, ';
      if (phone) message += 'phone, ';

      const salt = bcrypt.genSaltSync(15);
      const hash = bcrypt.hashSync(inputPassword, salt);

      const doEditUser = await model.doEditUser({ inputPassword: hash, id_user: idUser });
      const doEditProfil = await model.doEditProfil({
        inputName: inputName.trim(), inputPhone: inputPhone.trim(), id_user: idUser,
      });
      if (doEditUser && doEditProfil) {
        res.send(`${message}Succesfully Changed`);
      } else {
        res.status(400).send('Something error');
      }
    } else {
      res.status(400).send('data tidak ditemukan');
    }
  } catch (error) {
    res.status(500).send('Found Error');
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
  editUser, deleteUser, myProfile,
};
