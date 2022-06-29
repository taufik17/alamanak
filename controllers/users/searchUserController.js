const jwt = require('jsonwebtoken');
const model = require('../../model/users/searchUserModel');
require('dotenv').config();

const validatePage = (num) => {
  if (num) {
    if (parseInt(num, 10) / num === 1 && parseInt(num, 10) > 0) {
      return num;
    }
    return false;
  }
  return false;
};

const validateData = (num1, num2) => {
  if (num2) {
    if (parseInt(num2, 10) / num2 === 1 && parseInt(num2, 10) > 0) {
      return ((num1 - 1) * (num2));
    }
    return 5;
  }
  return 5;
};

const validateOrder = (order) => {
  if (order.toLowerCase() === 'asc' || order.toLowerCase() === 'desc') {
    return order;
  }
  return 'asc';
};

const getUsers = async (req, res) => {
  try {
    const { page, data, order } = req.query;
    const currPage = validatePage(page) || 1;
    const perPage = validatePage(data) || 5;
    const offSet = validateData(currPage, perPage);
    const checkOrder = order || 'ASC';
    const validOrder = validateOrder(checkOrder);
    const getData = await model.getAllUser({ perPage, offSet, validOrder });
    res.send({ data: getData.rows, page: currPage, jumlahData: getData.rowCount });
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const findUsersName = async (req, res) => {
  try {
    const { name } = req.body;
    if (name) {
      const getData = await model.getByName(name);

      res.send({
        data: getData.rows,
        jumlahData: getData.rowCount,
      });
    } else {
      res.status(400).send('nothing param send');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

const getUserId = async (req, res) => {
  try {
    const { id } = req.body;
    if (id) {
      const getData = await model.getByID(id);

      const token = jwt.sign(JSON.stringify(getData), process.env.SECRET_KEY);
      console.log(token);

      res.send({
        data: getData.rows,
        jumlahData: getData.rowCount,
      });
    } else {
      res.status(400).send('nothing id send');
    }
  } catch (error) {
    res.status(400).send('ada yang error');
  }
};

module.exports = { getUsers, findUsersName, getUserId };
