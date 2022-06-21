const Postgre = require("pg").Pool
const connection = new Postgre({
    user: "taufi",
    host: "localhost",
    database: "alamanak",
    password: "admin",
    port: 5432
})

module.exports = connection