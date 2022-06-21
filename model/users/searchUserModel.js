const db = require('../../db')

const getAllUser = () => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT * FROM profile ORDER BY profile.id_profile ASC`,
            (error, results) => {
                if (error) {
                    reject(error)
                } else {
                    resolve(results)
                }
            })
    })
}

const getByName = (name) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT * FROM profile WHERE name LIKE $1`, ['%' + name + '%'], (error, results) => {
            if (error) {
                reject(error)
            } else {
                resolve(results)
            }
        })
    })
}

module.exports = { getAllUser, getByName }