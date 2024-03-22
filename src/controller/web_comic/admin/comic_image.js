const { select_chapter, find_chapter } = require("../../../services/web_comic/chapter");
const { insert_comic_image, select_comic_image, find_comic_image, delete_comic_image, update_comic_image, select_comic_image_by_chapter } = require("../../../services/web_comic/comic_image")
const ctr_insert_comic_image = async (req, res) => {
    let { url, chapter_id } = req.body
    url = url.trim().split("\n");
    console.log(url);
    url.forEach(async element => {
        let result = await insert_comic_image(element, chapter_id);
        console.log(result);
    });
    // const result = await insert_comic_image(url, chapter_id);
    // console.log(result.id);
    res.redirect(`/admin/chapter/comic_image/${chapter_id}`)
}
const ctr_select_comic_image = async (req, res) => {
    let comic_image = req.query.comic_image
    comic_image = comic_image == undefined ? {} : JSON.parse(comic_image);
    const chapter_id=req.params.id;
    console.log(chapter_id);
    const comic_images = await select_comic_image();
    const chapter = await find_chapter(chapter_id);
    res.render("web_comic/admin/admin", { comic_images, comic_image, chapter, url:undefined })
}
const ctr_select_comic_image_by_chapter = async (req, res) => {
    let id = req.params.id
    console.log("id chapter>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    console.log(id);
    let comic_image = req.query.comic_image
    comic_image = comic_image == undefined ? {} : JSON.parse(comic_image);
    const comic_images = await select_comic_image_by_chapter(id);
    const chapter = await find_chapter(id);
    res.render("web_comic/admin/admin", { comic_images, comic_image, chapter, url:undefined })
}
const ctr_find_comic_image = async (req, res) => {
    const comic_image = req.query.comic_image;
    const chapter_id = req.params.id;
    console.log("chapter_id>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+comic_image);
    const result = await find_comic_image(comic_image);
    res.redirect(`/admin/chapter/comic_image/${chapter_id}?comic_image=${JSON.stringify(result)}`);
}
const ctr_delete_comic_image = async (req, res) => {
    const id = req.params.id;
    const comic_image=req.query.comic_image;
    const result = await delete_comic_image(comic_image);
    console.log(result);
    console.log(id);
    console.log("chapter_id>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+id);
    res.redirect(`/admin/chapter/comic_image/${id}`)
}
const ctr_update_comic_image = async (req, res) => {
    let { id, url, chapter_id } = req.body;
    url=url.trim();
    const result = await update_comic_image(id, url, chapter_id);
    console.log(result);
    res.redirect(`/admin/chapter/comic_image`)
}
module.exports = { ctr_insert_comic_image, ctr_delete_comic_image, ctr_update_comic_image, ctr_find_comic_image, ctr_select_comic_image, ctr_select_comic_image_by_chapter }