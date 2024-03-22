const db = require("../../models/index");
const insert_user = async (email,password) => {
    const result = await db.User.create({ email, password });
    return result;
}
const insert_user_with_role =async (email, password, role)=>{
    const result = await db.User.create({ email, password, role });
    return result;
}
const select_user = async () => {
    const result = await db.User.findAll(
        //     {
        //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
        // }
    );
    return result
}
const find_user_id = async (id) => {
    const result = await db.User.findOne({
        where: {
            id: id
        }
    })
    return result.get({ plain: true })
}
const find_user_email=async (email)=>{
    const result=await db.User.findOne({
        where:{
            email:email
        }
    })
    return result?result.get({plain:true}):{};
}

const update_user = async (id, email, password, role) => {
    const result = await db.User.update({password, role}, {
        where: {
            email:email,
            id: id
        }
    })
    return result;
}
const delete_user = async (id) => {
    const result = await db.User.destroy({
        where: {
            id: id
        }
    })
    return result;
}
module.exports={insert_user_with_role,delete_user, find_user_id, update_user, find_user_email, select_user, insert_user  }