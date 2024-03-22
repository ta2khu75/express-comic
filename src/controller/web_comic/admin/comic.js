const { insert_category_comic, find_category_comic, select_category_comic_by_category, select_category_comic_by_comic, delete_category_comic_by_comic } = require("../../../services/web_comic/CategoryComic");
const { select_author } = require("../../../services/web_comic/author");
const { select_category } = require("../../../services/web_comic/category")
const { insert_comic, select_comic, find_comic, delete_comic, update_comic, select_comic_by_author, find_comic_details} = require("../../../services/web_comic/comic");
const ctr_select_comic_by_author = async (req, res) => {
    const { id } = req.params;
    const categories = await select_category();
    const comics = await select_comic_by_author(id);
    const authors = await select_author();
    res.render("web_comic/admin/admin", { comics, url:"comic", comic_categories:[] , comic: {}, authors, categories })
}

const ctr_insert_comic = async (req, res) => {
    const { name, poster, summary, status, id_author, categories } = req.body
    const result = await insert_comic(name, poster, summary, status, id_author);
    console.log(categories);
    if (categories != undefined) {
        categories.forEach(async c => {
            await insert_category_comic(result.id, c);
        })
    }
    res.render("web_comic/admin/admin", { comics, url:"comic", comic_categories:[] , comic: {}, authors, categories })
  //  res.redirect("/admin/comic")
}
const select_comic_redirect = async () => {
    const categories = await select_category();
    const comics = await select_comic();
    const authors = await select_author();
    return { categories, comics, authors };
}
const ctr_select_comic = async (req, res) => {
    const { categories, comics, authors } = await select_comic_redirect()
    res.render("web_comic/admin/admin", { comics, url:"comic", comic_categories:[] , comic: {}, authors, categories })
}
const ctr_find_comic = async (req, res) => {
    const id = req.query.id;
    const comic = await find_comic_details(id);
   // const comic_categories = await select_category_comic_by_comic(comic.id);
//    console.log(comic_categories);
    const { categories, authors, comics } = await select_comic_redirect();
    res.render("web_comic/admin/admin", { comics, comic, authors, categories })
}
const ctr_delete_comic = async (req, res) => {
    const id = req.params.id;
    const result = await delete_comic(id);
    console.log("delete>>" + result);
    const { categories, authors, comics } = await select_comic_redirect()
    res.render("web_comic/admin/admin", { comics, url:"comic", comic_categories:[] , comic: {}, authors, categories })
}
const ctr_update_comic = async (req, res) => {
    const { id, name, poster, summary, status, id_author } = req.body;
    const categoriess=req.body.categories;
    console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    console.log(categoriess);
    await delete_category_comic_by_comic(id);
    const result = await update_comic(id, name, poster, summary, status, id_author);
    if(categoriess!=undefined){
        categoriess.forEach(async e=> await insert_category_comic(id,e))
    }
    console.log("update>>>>" + result);
    const { categories, authors, comics } = await select_comic_redirect()
    res.render("web_comic/admin/admin", { comics, url:"comic", comic_categories:[] , comic: {}, authors, categories })
}
module.exports = { ctr_insert_comic, ctr_delete_comic, ctr_update_comic, ctr_find_comic, ctr_select_comic, ctr_select_comic_by_author }