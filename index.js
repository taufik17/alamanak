const express = require('express');

const app = express();
const port = 8000;
const bodyParser = require('body-parser');
const helmet = require('helmet');
const searchUserRoutes = require('./routes/users/searchUsersRoutes');
const userRoutes = require('./routes/users/usersRoutes');
const recipeRoutes = require('./routes/recipe/recipeRoutes');
const searchRecipeRoutes = require('./routes/recipe/searchRecipeRoutes');
const searchCommentRoutes = require('./routes/comment/searchCommentRoutes');

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH');
  next();
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(helmet());

app.use('/', searchUserRoutes);
app.use('/', userRoutes);
app.use('/', recipeRoutes);
app.use('/', searchRecipeRoutes);
app.use('/', searchCommentRoutes);

// end of bottom code
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
