const db = require("../../models/index")
const insert_category = async (name) => {
    const result = await db.Category.create({ name })
    return result;
}

const update_category = async (id, name) => {
    const result= await db.Category.update({ name }, {
        where: {
            id: id
        }
    })
    return result;
}
const delete_category= async (id)=>{
    const result = await db.Category.destroy({
        where:{
            id:id
        }
    })
    return result;
}

const find_category= async (id)=>{
    const result = await db.Category.findOne({
        where:{
            id:id
        }
    })
    return result.get({plain:true});
}
const select_category=async ()=>{
    const result = await db.Category.findAll();
    return result;
}
module.exports={insert_category, update_category, find_category, delete_category, select_category}