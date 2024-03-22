const { insert_user, delete_user, update_user, find_user_id, select_user, insert_user_with_role } = require("../../../services/web_comic/user")
const ctr_insert_user = async (req, res) => {
    const { email, password, confirm, role } = req.body;
    if (password.trim() !== "" && password === confirm) {
        const result = await insert_user_with_role(email, password, role);
    }
    res.redirect("/admin/user")
}
const ctr_select_user = async (req, res) => {
    let user = req.query.user
    user = user == undefined ? {} : JSON.parse(user);
    const users = await select_user();
    res.render("web_comic/admin/admin", { users, user, url: "user" });
}
const ctr_delete_user = async (req, res) => {
    const id = req.params.id
    const result = await delete_user(id);
    console.log(result);
    res.redirect("/admin/user")
}
const ctr_update_user = async (req, res) => {
    const { id, email, password, confirm, role } = req.body;
    console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.");
    console.log((password.trim() !== "" && password === confirm));
    if (password.trim() !== "" && password === confirm) {
        const result = await update_user(id, email, password, role);
        console.log(result);
    }
    res.redirect("/admin/user")
}
const ctr_find_user = async (req, res) => {
    const { id } = req.params;
    const result = await find_user_id(id);
    console.log(result);
    res.redirect("/admin/user?user=" + JSON.stringify(result));
}
module.exports = { ctr_delete_user, ctr_find_user, ctr_insert_user, ctr_update_user, ctr_select_user }