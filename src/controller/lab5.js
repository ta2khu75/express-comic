const { insertUser, selectUser, deleteUser, findUser, updateUser} = require("../services/user.sequelize")
const sequelize = require("../config/sequelize")
const bai1get = async (req, res) => {
    let { user, message } = req.query
    user = user == undefined ? {} : JSON.parse(user);
    console.log("user>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    console.log(user);
    const users = await selectUser()
    res.render("lab5/bai1", { users, user, message })
}
const bai1edit = async (req, res) => {
    const { id } = req.params
    let message = "";
    let user = {}
    if (id * 1 <= 0) {
        message = "Cann't edit User id:" + id;
    } else {
        user = await findUser(id);
        console.log(user);
    }
    res.redirect("/lab5/bai1?message=" + encodeURIComponent(message) + "&user=" + encodeURIComponent(JSON.stringify(user)))

    //    res.redirect("/lab5/bai1?user=" + encodeURIComponent(JSON.stringify(user && user.length > 0 ? user[0] : {})))
}
const bai1delete = async (req, res) => {
    const { id } = req.params
    let message = ""
    try {
        const results = await deleteUser(id);
        console.log("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        console.log(results);
        message = "Delete successfully"
    } catch (error) {
        message = "Delete failed"
    }
    res.redirect("/lab5/bai1?message=" + encodeURIComponent(message))
}

const bai1update = async (req, res) => {
    const { id, name, email, city } = req.body
    console.log("update>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    let message = ""
    let results = {};
    if (id * 1 <= 0) {
        message = "Couldn't find id User"
    } else {
        try {
            const user = { id, name, email, city };
            results = await updateUser(user);
            console.log("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            console.log(results);
            message = "Update successfully"
        } catch (error) {
            console.log("Error>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            console.log(error);
            message = "Update failed"
        }
    }
    res.redirect("/lab5/bai1?message=" + encodeURIComponent(message))
}
const bai1insert = async (req, res) => {
    const { name, email, city } = req.body
    const user = { name, email, city };
    let message = ""
    try {
        const results = await insertUser(user);
        console.log("result>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        console.log(results);
        message = "Insert successfully"
    } catch (error) {
        console.log("Error>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        console.log(error);
        message = "Insert failed";
    } finally {
        res.redirect("/lab5/bai1?message=" + encodeURIComponent(message))
    }

}
const bai2 = async (req, res) => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}
module.exports = { bai1get, bai1delete, bai1edit, bai1update, bai1insert, bai2 }