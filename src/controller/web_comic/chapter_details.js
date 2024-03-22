const { select_comic_image_by_chapter } = require("../../services/web_comic/comic_image")
const { select_chapter_by_comic, find_chapter, update_chapter } = require("../../services/web_comic/chapter")
const cookie = require("cookie")
const chapter_details = async (req, res) => {
    const cookies = cookie.parse(req.headers.cookie || "");
    let comics = cookies.comics ? new Map(JSON.parse(cookies.comics)) : new Map();
    
    const chapter_id = req.params.id;
    const comic_id = req.query.id;
    
    comics.set(comic_id, chapter_id);
    res.cookie("comics", JSON.stringify(Array.from(comics)));
    
    const comic_images = await select_comic_image_by_chapter(chapter_id);
    const chapters = await select_chapter_by_comic(comic_id)
    const chapter=await find_chapter(chapter_id);
    chapter.views=chapter.views*1+1;
    await update_chapter(chapter.id, chapter.name, chapter.views, chapter.ComicId);
    console.log(comics);
    res.render("web_comic/home", { comic_images, chapters, url:"chapter", chapter })
}
module.exports = { chapter_details }