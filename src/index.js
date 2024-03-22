const express = require('express')
const path=require("path")
const morgan = require('morgan')
const bodyParser=require("body-parser")
const template_config=require("./config/template")
const body_config=require("./config/body")
const sequelize=require("./config/sequelize")
const lab1=require("./routers/lab1")
const lab2=require("./routers/lab2")
const lab3=require("./routers/lab3")
const lab4=require("./routers/lab4")
const lab5=require("./routers/lab5")
const home=require("./routers/web_comic/home")
const admin=require("./routers/web_comic/admin")
const api=require("./routers/web_comic/api")
const app = express()
const port = 8083

template_config(app);
body_config(app)


//app.use(morgan("combined"))
//app.use(bodyParser.json())
app.use(express.static(path.join(__dirname, 'public')))
app.use("/",home)
app.use("/lab1",lab1)
app.use("/lab2",lab2)
app.use("/lab3",lab3)
app.use("/lab4",lab4)
app.use("/lab5",lab5)
app.use("/admin",admin)
app.use("/api",api)
app.use(bodyParser.urlencoded({ extended: true }));

// Parse JSON bodies (as sent by API clients)
app.use(bodyParser.json());
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
