const {find_user_email}=require("../../services/web_comic/user")
const db = require("../../models/index");
const insert_follow = async (email, comic_id) => {
    const user = await find_user_email(email);
    console.log(user);
    if (user != undefined) {
        const result = await db.Follow.create({ UserId: user.id, ComicId: comic_id });
        return result;
    } return undefined;
}

const find_follow_by_user_comic = async (email, comic_id) => {
    const user = await find_user_email(email);
    if (user != undefined) {
        const result = await db.Follow.findOne({
            where: {
                UserId:user.id,
                ComicId:comic_id
            }
        })
        return result===null?undefined:result.get({plain:true});
    }
    return undefined;
}
const find_follow = async (id) => {
    const result= await db.Follow.findOne({
        where:{
            id:id
        }
    })
    return result.get({plain:true});
}

const find_follow_by_user = async (email) => {
    const user = await find_user_email(email);
    if (user != undefined) {
        const result = await db.Follow.findAll({
            where: {
                UserId: user.id
            },
            nest:true,
            include: db.Comic,
            raw:true
        }).then(follows=>{
            const comics=[]
            follows.forEach(element => {
                comics.push(element.Comic)
            });
            return comics
        })
        console.log(result);
        return result;
    }
    return undefined;
}

const delete_follow = async (id) => {
    const result = await db.Follow.destroy({
        where: {
            id: id
        }
    })
    return result;
}
module.exports = { insert_follow, delete_follow, find_follow_by_user, find_follow_by_user_comic, find_follow }