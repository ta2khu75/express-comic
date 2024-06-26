require("dotenv").config()
const { Sequelize } = require('sequelize');
//const sequelize = new Sequelize(`mysql://${}:pass@example.com:5432/dbname`) // Example for postgres
const sequelize=new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD,{
    host:process.env.DB_HOST,
    dialect:"mysql",
    port:process.env.DB_PORT
})
module.exports=sequelize;