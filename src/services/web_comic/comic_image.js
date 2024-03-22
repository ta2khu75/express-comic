const db = require("../../models/index");
const insert_comic_image = async (url,chapter_id) => {
    const result = await db.Comic_Image.create({ url, ChapterId:chapter_id });
    return result;
}
const select_comic_image = async () => {
    const result = await db.Comic_Image.findAll(
        //     {
        //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
        // }
    );
    return result
}
const select_comic_image_by_chapter = async (id) => {
    const result = await db.Comic_Image.findAll(
        {   
            where:{
                ChapterId:id
            },
            include: db.Chapter,
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
const find_comic_image = async (id) => {
    const result = await db.Comic_Image.findOne({
        where: {
            id: id
        }
    })
    return result.get({ plain: true })
}
const update_comic_image = async (id, url, chapter_id) => {
    const result = await db.Comic_Image.update({ url, ChapterId:chapter_id }, {
        where: {
            id: id
        }
    })
    return result;
}
const delete_comic_image = async (id) => {
    const result = await db.Comic_Image.destroy({
        where: {
            id: id
        }
    })
    return result;
}
module.exports = { insert_comic_image, select_comic_image, update_comic_image, delete_comic_image, find_comic_image, select_comic_image_by_chapter }