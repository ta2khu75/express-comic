const { DataTypes } = require("sequelize")
const sequelize=require("./sequelize")
const { all } = require("../routers/lab1")
const User=sequelize.define("User",{
    id:{
        autoIncrementIdentity:true,
        type:DataTypes.INTEGER,
        allowNull:false
    },
    name:{
        type:DataTypes.STRING,
        allowNull:false
    },
    email:{
        type: DataTypes.STRING,
        allowNull:false
    },
    city:{
        type:DataTypes.STRING,
        allowNull:true
    }
})
console.log(User===sequelize.model.User);