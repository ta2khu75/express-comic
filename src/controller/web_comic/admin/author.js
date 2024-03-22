const { insert_author, delete_author, update_author, find_author, select_author } = require("../../../services/web_comic/author")
const ctr_insert_author = async (req, res) => {
    const { name } = req.body
    const result = await insert_author(name);
    console.log(result.id);
    res.redirect("/admin/author")
}
const ctr_select_author = async (req, res)=>{
    let author=req.query.author
    author=author==undefined?{}:JSON.parse(author);
    const authors= await select_author();
    res.render("web_comic/admin/admin",{authors, author,url:"author"});
}
const ctr_delete_author= async (req, res)=>{
    const id=req.params.id
    const result= await delete_author(id);
    console.log(result);
    res.redirect("/admin/author")
}
const ctr_update_author= async (req, res)=>{
    const {id, name}=req.body;
    const result= await update_author(id, name);
    console.log(result);
    res.redirect("/admin/author")
}
const ctr_find_author= async (req, res)=>{
    const {id}=req.params;
    const result= await find_author(id);
    console.log(result);
    res.redirect("/admin/author?author="+JSON.stringify(result));
}
module.exports = { ctr_delete_author, ctr_find_author, ctr_insert_author, ctr_update_author, ctr_select_author }