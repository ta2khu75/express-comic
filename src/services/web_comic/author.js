const db = require("../../models/index")
const insert_author = async (name) => {
    const result = await db.Author.create({ name })
    return result;
}

const update_author = async (id, name) => {
    const result= await db.Author.update({ name }, {
        where: {
            id: id
        }
    })
    return result;
}
const delete_author= async (id)=>{
    const result = await db.Author.destroy({
        where:{
            id:id
        }
    })
    return result;
}

const find_author= async (id)=>{
    const result = await db.Author.findOne({
        where:{
            id:id
        }
    })
    return result.get({plain:true});
}
const select_author=async ()=>{
    const result = await db.Author.findAll();
    return result;
}
module.exports={find_author, update_author, insert_author, delete_author, select_author}