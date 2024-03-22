const cookie = require("cookie")
const { select_comic } = require("../../services/web_comic/comic")
const { select_category } = require("../../services/web_comic/category");
const { find_chapter } = require("../../services/web_comic/chapter");
const { find_follow_by_user } = require("../../services/web_comic/follow");
const home = async (req, res) => {
    const comics = await select_comic();
    const categories = await select_category();

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


    res.render("web_comic/home", { comics, categories, stories, follows, url:undefined });

    // const cookies = cookie.parse(req.headers.cookie || "");
    // let comic=cookies.comics;
    // const stories=[];
    // const comics = await select_comic()
    // const categories=await select_category();
    // if(comic!=undefined){
    //     comic=new Map(JSON.parse(comic))
    //     comic.forEach(async (value, key) => {
    //         stories.push(await find_chapter_comic(value));
    //     });
    // }
    // console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // console.log(stories);

    // res.render("web_comic/home",{comics, categories, stories})
}
module.exports = { home }