const model = require('../../model/users/userModel');
const modelSearch = require('../../model/users/searchUserModel');

const registerUser = async (req, res) => {
  try {
    const {
      username, password, name, email, phone, userImage = 'default.jpg',
    } = req.body;
    let message = '';
    const checkUsername = await modelSearch.getProfileUsername(username);
    const checkUserEmail = await modelSearch.getProfileMail(email);
    if (checkUsername.rowCount > 0) message += 'username, ';
    if (checkUserEmail.rowCount > 0) message += 'email, ';
    if ((checkUsername.rowCount || checkUserEmail.rowCount) > 0) {
      res.status(400).send(`${message}is already registred`);
    } else {
      const addUser = await model.addUser({ username, password });
      const userId = addUser.rows[0]?.id_user;
      const addProfile = await model.addProfile({
        name, email, phone, userImage, userId,
      });

      if (addProfile) {
        res.send('data berhasil ditambah');
      } else {
        res.status(400).send('data gagal ditambah');
      }
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const editUser = async (req, res) => {
  try {
    const {
      id, username, password, name, email, phone, user_image,
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
        const inputUserImage = user_image || getDataProfile?.rows[0].user_image;
        let message = '';
        if (username) message += 'username, ';
        if (password) message += 'password, ';
        if (name) message += 'name, ';
        if (phone) message += 'phone, ';
        if (user_image) message += 'user_image, ';

        const editUser = await model.editUser({ inputUsername, inputPassword, id_user: id });
        const editProfil = await model.editProfil({
          inputName, inputEmail, inputPhone, inputUserImage, id_user: id,
        });

        if (editUser && editProfil) {
          res.send(`${message}berhasil diubah`);
        } else {
          res.status(400).send('ada yang error saat merubah data');
        }
      } else {
        res.status(400).send('data tidak ditemukan');
      }
    } else {
      res.status(400).send('id ubah harus dikirim');
    }
  } catch (error) {
    console.log('error', error);
    res.status(400).send('ada yang error');
  }
};

const deleteUser = async (req, res) => {
  try {
    const { id } = req.body;
    const getData = await modelSearch.getByID(id);

    if (getData.rowCount > 0) {
      const deleteUser = await model.deleteUser(id);
      if (deleteUser) {
        res.send(`data dengan id: ${id} berhasil dihapus`);
      } else {
        res.status(400).send('data gagal dihapus');
      }
    } else {
      res.status(400).send('data tidak ditemukan');
    }
  } catch (error) {
    console.log(error);
    res.status(400).send('ada yang error');
  }
};

module.exports = { registerUser, editUser, deleteUser };
