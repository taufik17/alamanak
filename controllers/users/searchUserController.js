const model = require('../../model/users/searchUserModel')

const getUsers = async (req, res) => {
    try {
        const getData = await model.getAllUser()
        res.send({ data: getData.rows, jumlahData: getData.rowCount })
    } catch (error) {
        res.status(400).send("ada yang error")
    }
}

const findUsersName = async (req, res) => {
    try {
        const { name } = req.body
        const getData = await model.getByName(name)

        res.send({
            data: getData.rows,
            jumlahData: getData.rowCount
        })
    } catch (error) {
        console.log(error)
        res.status(400).send("ada yang error")
    }


}

module.exports = { getUsers, findUsersName }