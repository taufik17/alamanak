const express = require('express');
require('dotenv').config();

const app = express();
const port = process.env.EXPRESS_PORT;
const bodyParser = require('body-parser');
const helmet = require('helmet');
const path = require('path');
const multer = require('multer');
const searchUserRoutes = require('./routes/users/searchUsersRoutes');
const userRoutes = require('./routes/users/usersRoutes');
const recipeRoutes = require('./routes/recipe/recipeRoutes');
const searchRecipeRoutes = require('./routes/recipe/searchRecipeRoutes');
const searchCommentRoutes = require('./routes/comment/searchCommentRoutes');
const authRoutes = require('./routes/auth/authLoginRoutes');

const forms = multer();

app.use(bodyParser.json());
// app.use(forms.array());
app.use(bodyParser.urlencoded({ extended: true }));

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH');
  next();
});

app.use('/images', express.static(path.join(__dirname, 'images')));
app.use(helmet());

app.use('/', searchUserRoutes);
app.use('/', forms.single('image'), userRoutes);
app.use('/', recipeRoutes);
app.use('/', searchRecipeRoutes);
app.use('/', searchCommentRoutes);
app.use('/', authRoutes);

// app.use('/testing', forms.single('hello'), (req, res) => {
//   console.log(req.body);
//   console.log(req.file);
// });

// end of bottom code
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
