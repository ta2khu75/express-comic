const cookie = require("cookie")
const { select_chapter_by_comic, total_views_chapter_with_comic } = require("../../services/web_comic/chapter")
const { find_comic } = require("../../services/web_comic/comic");
const { find_follow_by_user_comic } = require("../../services/web_comic/follow");

const comic_details = async (req, res) => {
    
    const comic_id = req.params.id;
    console.log(comic_id);
    const cookies = cookie.parse(req.headers.cookie || "");
    let { email } = cookies
    const follow=email==undefined?undefined:await find_follow_by_user_comic(email, comic_id);
    const comic = await find_comic(comic_id);
    const chapters = await select_chapter_by_comic(comic_id)
    let total_views=await total_views_chapter_with_comic(comic_id);
    total_views=total_views==null?total_views:total_views.total_views;
    console.log(total_views);
    res.render("web_comic/home", { comic, chapters, follow, url:"comic", total_views })
}
module.exports = { comic_details }