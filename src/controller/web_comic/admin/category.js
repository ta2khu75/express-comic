const { insert_category, delete_category, update_category, find_category, select_category } = require("../../../services/web_comic/category")
const ctr_insert_category = async (req, res) => {
    const { name } = req.body
    const result = await insert_category(name);
    console.log(result.id);
    res.redirect("/admin/category")
}
const ctr_select_category = async (req, res) => {
    let category = req.query.category
    category = category == undefined ? {} : JSON.parse(category);
    const categories = await select_category();
    res.render("web_comic/admin/admin", { categories, category:category, url:"category" });
}
const ctr_delete_category = async (req, res) => {
    const id = req.params.id
    const result = await delete_category(id);
    console.log(result);
    res.redirect("/admin/category")
}
const ctr_update_category = async (req, res) => {
    const { id, name } = req.body;
    const result = await update_category(id, name);
    console.log(result);
    res.redirect("/admin/category")
}
const ctr_find_category = async (req, res) => {
    const { id } = req.params;
    const result = await find_category(id);
    console.log(result);
    res.redirect("/admin/category?category=" + JSON.stringify(result));
}
module.exports = { ctr_delete_category, ctr_find_category, ctr_insert_category, ctr_update_category, ctr_select_category }