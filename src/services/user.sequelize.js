const db = require("../models/index")
const { fields } = require("../config/upload");
const selectUser = async () => {
    const results= await db.User.findAll();
    return results;
}
const findUser = async (id) => {
    let results=await db.User.findOne({
        where:{
            id
        }
    })
    console.log(results);

    return results.get({plain:true});
}
const deleteUser = async (userId) => {
    const results=await db.User.destroy({
        where:{
            id:userId
        }
    })
    return results;
}
const updateUser = async (user) => {
    const results=await db.User.update({email:user.email,  name:user.name, city:user.city},{
        where:{
            id:user.id
        }
    })
   // const { results, fields } = await connection.execute("update Users set name=?, email=?, city=? where id=?", [user.name, user.email, user.city, user.id])
    return results;
}
const insertUser = async (user) => {
    const jane = await db.User.create(user)
    //console.log(jane instanceof User); // true
    //console.log(jane.name); // "Jane"
    //  const { results, fields } = await connection.execute("insert into Users (name, email, city) values (?, ?, ?)", [user.name, user.email, user.city])
    //  console.log(results);
    return jane;
}
module.exports = { insertUser, selectUser, deleteUser, findUser, updateUser }