const express= require("express")
const body_config=(app)=>{
    app.use(express.json())
    app.use(express.urlencoded({extended:true}))
}
module.exports=body_config;