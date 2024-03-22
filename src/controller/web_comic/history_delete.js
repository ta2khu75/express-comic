const cookie = require("cookie")
const history_delete=(req, res)=>{
    const cookies = cookie.parse(req.headers.cookie || "");
    let comics = cookies.comics ? new Map(JSON.parse(cookies.comics)) : new Map();
    const {id}=req.params;
    comics.delete(id);
    res.cookie("comics", JSON.stringify(Array.from(comics)));
    res.redirect("/")
}
module.exports={history_delete}