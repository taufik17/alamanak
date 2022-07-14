const express = require('express');
require('dotenv').config();
const cors = require('cors');

const app = express();
const port = process.env.EXPRESS_PORT;
const bodyParser = require('body-parser');
const helmet = require('helmet');
const path = require('path');
const searchUserRoutes = require('./routes/users/searchUsersRoutes');
const userRoutes = require('./routes/users/usersRoutes');
const recipeRoutes = require('./routes/recipe/recipeRoutes');
const searchRecipeRoutes = require('./routes/recipe/searchRecipeRoutes');
const commentRoutes = require('./routes/comment/commentRoutes');
const searchCommentRoutes = require('./routes/comment/searchCommentRoutes');
const authRoutes = require('./routes/auth/auth');
// testing multer routes
// const upload = require('./routes/upload/image');

app.use(bodyParser.json());
// app.use(forms.array());
app.use(bodyParser.urlencoded({ extended: true }));

// app.use((req, res, next) => {
//   res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
//   res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH');
//   next();
// });

const allowlist = [
  'http://localhost:3000',
];
const corsOptionsDelegate = function (req, callback) {
  let corsOption;
  if (allowlist.indexOf(req.header('Origin')) !== -1) {
    corsOption = { origin: true };
  } else {
    corsOption = { origin: false };
  }
  callback(null, corsOption);
};

app.use('/images', express.static(path.join(__dirname, 'images')));
app.use(helmet());

app.use('/', cors(corsOptionsDelegate), searchUserRoutes);
app.use('/', cors(corsOptionsDelegate), userRoutes);
app.use('/', cors(corsOptionsDelegate), recipeRoutes);
app.use('/', cors(corsOptionsDelegate), searchRecipeRoutes);
app.use('/', cors(corsOptionsDelegate), commentRoutes);
app.use('/', cors(corsOptionsDelegate), searchCommentRoutes);
app.use('/', cors(corsOptionsDelegate), authRoutes);

app.use('*', (req, res) => {
  res.send('Sukses');
});

// app.use('/', upload);

// app.use('/testing', forms.single('hello'), (req, res) => {
//   console.log(req.body);
//   console.log(req.file);
// });

// end of bottom code
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
