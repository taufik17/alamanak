const express = require('express')
const app = express()
const port = 8000
var bodyParser = require('body-parser')
const helmet = require("helmet");
const searchUserRoutes = require('./routes/users/searchUsersRoutes')
const searchRecipeRoutes = require('./routes/recipe/searchRecipeRoutes')
const searchCommentRoutes = require('./routes/comment/searchCommentRoutes')

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(helmet());

app.use("/", searchUserRoutes)
app.use("/", searchRecipeRoutes)
app.use("/", searchCommentRoutes)

// end of bottom code
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})