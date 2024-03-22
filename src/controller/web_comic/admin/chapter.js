const { select_comic, find_comic } = require("../../../services/web_comic/comic");
const { insert_chapter, select_chapter, find_chapter, delete_chapter, update_chapter, select_chapter_by_comic } = require("../../../services/web_comic/chapter")
const ctr_insert_chapter = async (req, res) => {
    const { name, views, comic_id } = req.body
    const result = await insert_chapter(name, views, comic_id);
    console.log(result.id);
    res.redirect(`/admin/comic/chapter/${comic_id}`)
}

const ctr_select_chapter_by_comic = async (req, res) => {
    let chapter = req.query.chapter
    let comic=await find_comic(req.params.id);
    chapter = chapter == undefined ? {} : JSON.parse(chapter);
    const chapters = await select_chapter_by_comic(comic.id);
    //const comics = await select_comic();
    res.render("web_comic/admin/admin", { chapters, chapter, comic, url:"chapter" })
}

const ctr_select_chapter = async (req, res) => {
    let chapter = req.query.chapter
    chapter = chapter == undefined ? {} : JSON.parse(chapter);
    const chapters = await select_chapter();
    const comics = await select_comic();
    res.render("web_comic/admin/chapter", { chapters, chapter, comics })
}
const ctr_find_chapter = async (req, res) => {
    const comic = req.params.id;
    const chapter=req.query.chapter;
    const result = await find_chapter(chapter);
    res.redirect(`/admin/comic/chapter/${comic}?chapter=${JSON.stringify(result)}`);
}
const ctr_delete_chapter = async (req, res) => {
    const id = req.params.id;
    const chapter=req.query.chapter;
    const result = await delete_chapter(chapter);
    console.log(result);
    res.redirect(`/admin/comic/chapter/${id}`)
}
const ctr_update_chapter = async (req, res) => {
    const { id, name, views, id_comic } = req.body;
    const result = await update_chapter(id, name, views, id_comic);
    console.log(result);
    res.redirect(`/admin/comic/chapter/${id_comic}`)
}
module.exports = { ctr_insert_chapter, ctr_delete_chapter, ctr_update_chapter, ctr_find_chapter, ctr_select_chapter, ctr_select_chapter_by_comic }