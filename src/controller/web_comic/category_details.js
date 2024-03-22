const { select_comic_by_category } = require("../../services/web_comic/comic")
const cookie = require("cookie")

const {select_category} = require("../../services/web_comic/category");
const { find_chapter } = require("../../services/web_comic/chapter");
const { find_follow_by_user } = require("../../services/web_comic/follow");
const category_details = async (req, res) => {
    const category_id = req.params.id;
    const category = await select_comic_by_category(category_id)
    const categories=await select_category();
    const cookies = cookie.parse(req.headers.cookie || "");
    const { email } = cookies

    let comic = cookies.comics;
    // Khởi tạo mảng các promise cho việc tìm các chapter của từng comic
    const promises = [];

    if (comic !== undefined) {
        comic = new Map(JSON.parse(comic));
        comic.forEach((value, key) => {
            // Thêm mỗi promise vào mảng
            promises.push(find_chapter(value));
        });
    }
    let follows=[];
    if(email!=undefined){
        follows = await find_follow_by_user(email);
    }
    // Chờ tất cả các promise hoàn thành
    const stories = await Promise.all(promises);
    res.render("web_comic/home",{comics:category.Comics, stories, follows, categories, url:undefined})
}
module.exports = { category_details }