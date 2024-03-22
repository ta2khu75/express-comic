const db = require("../../models/index");
const insert_comic = async (name, poster, summary, status, id_author) => {
    const result = await db.Comic.create({ name, poster, summary, status, AuthorId: id_author });
    return result;
}
const select_comic = async () => {
    const result = await db.Comic.findAll(
        {
            include: [db.Author],
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

const select_comic_by_category = async (id) => {
    const result = await db.Category.findAll(
        {
            where: {
                id: id
            },
            include: {model:db.Comic, attributes:["id","poster","name","summary"],through: { attributes: [] }},
            raw: true,
            nest: true
        }
        //     {
        //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
        // }
    ).then(el => {
        const comics = [];
        el.forEach(element => {
            comics.push(element.Comics);
            //categories.add(element.Categories) 
        });
        el[0].Comics = comics;
        return el[0];
    });
    console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    console.log(result);
    return result
}
const select_comic_by_author = async (id) => {
    const result = await db.Comic.findAll(
        {
            where: {
                AuthorId: id
            },
            include: { model: db.Author},//, through: { attributes: [] } },
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
const find_comic = async (id) => {
    let result = await db.Comic.findAll({
        include: [{ model: db.Author, attributes: ["id", "name"] }, {
            model: db.Category, through: { attributes: [] }
        }], // Loại bỏ các thuộc tính không cần thiết từ bảng trung gian},
        where: {
            id: id
        },
        nest: true,
        raw: true
    }).then(el => {
        const categories = new Set();
        el.forEach(element => {
            categories.add(JSON.stringify(element.Categories));
            //categories.add(element.Categories) 
        });
        el[0].Categories = categories;
        return el[0];
    })
    console.log(result);
    return result;
}
const find_comic_details = async (id) => {
    let result = await db.Comic.findAll({
        include: [{ model: db.Author, attributes: ["id", "name"] }, { model: db.Chapter, attributes: ["id", "name", "views"] }, {
            model: db.Category, through: { attributes: [] }
        }], // Loại bỏ các thuộc tính không cần thiết từ bảng trung gian},
        where: {
            id: id
        },
        nest: true,
        raw: true
    }).then(el => {
        const categories = new Set();
        const chapters = new Map();
        el.forEach(element => {

            chapters.set(element.Chapters.id, element.Chapters);
            categories.add(JSON.stringify(element.Categories));
            //categories.add(element.Categories) 
        });
        el[0].Chapter = chapters;
        el[0].Categories = categories;
        return el[0];
    })
    console.log("el>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    console.log(result);
    return result;
}
const update_comic = async (id, name, poster, summary, status, id_author) => {
    console.log(id_author);
    const result = await db.Comic.update({ name, poster, summary, status, AuthorId: id_author }, {
        where: {
            id: id
        }
    })
    return result;
}
const delete_comic = async (id) => {
    const result = await db.Comic.destroy({
        where: {
            id: id
        }
    })
    return result;
}
module.exports = { select_comic_by_category, find_comic_details, insert_comic, select_comic, update_comic, delete_comic, find_comic, select_comic_by_author }