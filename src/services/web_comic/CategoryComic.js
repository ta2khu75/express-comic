const db = require("../../models/index")
const insert_category_comic = async (comic_id,category_id ) => {
    const result = await db.CategoryComic.create({ CategoryId:category_id, ComicId:comic_id })
    return result;
}

const update_category_comic = async (id, comic_id,  category_id) => {
    const result= await db.CategoryComic.update({ CategoryId:category_id, ComicId:comic_id }, {
        where: {
            id: id
        }
    })
    return result;
}
const delete_category_comic= async (id)=>{
    const result = await db.CategoryComic.destroy({
        where:{
            id:id
        }
    })
    return result;
}

const find_category_comic= async (id)=>{
    const result = await db.CategoryComic.findOne({
        where:{
            id:id
        }
    })
    return result.get({plain:true});
}
const select_category_comic=async ()=>{
    const result = await db.CategoryComic.findAll();
    return result;
}

const select_category_comic_by_comic = async (id) => {
    const result = await db.CategoryComic.findAll(
        {   
            where:{
                ComicId:id
            },
            attributes:[],
            include: db.Category,
            raw: true,
            nest: true
        }
    );
    console.log(result);
    return result
}
const delete_category_comic_by_comic=async (id)=>{
    const result =await db.CategoryComic.destroy({
        where:{
            ComicId:id
        }
    })
    console.log(result);
    return result
}
const select_category_comic_by_category = async (id) => {
    const result = await db.Chapter.findAll(
        {   
            where:{
                ComicId:id
            },
            include: db.Comic,
            raw: true,
            nest: true
        }
        //     {
        //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
        // }
    );
    console.log(result);
    return result
}

module.exports={delete_category_comic_by_comic ,find_category_comic, update_category_comic, insert_category_comic, delete_category_comic, select_category_comic, select_category_comic_by_category, select_category_comic_by_comic}