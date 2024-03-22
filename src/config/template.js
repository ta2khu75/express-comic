const path=require("path")
const template_config=(app)=>{
    app.set("view engine","ejs")
    app.set("views", [path.join("./src","views")])
}
module.exports=template_config