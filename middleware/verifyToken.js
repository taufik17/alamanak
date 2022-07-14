const jwt = require('jsonwebtoken');
require('dotenv').config();

const checkToken = async (req, res, next) => {
  try {
    const token = req.headers?.authorization;
    const decoded = jwt.verify(token?.substring(7, token?.length), process.env.SECRET_KEY);
    if (decoded) {
      res.locals = decoded.id_user;
      res.role = decoded.role;
      next();
    }
  } catch (error) {
    res.status(401).send('Invalid Token');
  }
};

const checkRole = async (req, res, next) => {
  try {
    const { role } = req.res;
    if (role === true) {
      next();
    } else {
      res.status(401).send('Not Have Premission');
    }
  } catch (error) {
    res.status(400).send("Error's Happen");
  }
};

module.exports = { checkToken, checkRole };
