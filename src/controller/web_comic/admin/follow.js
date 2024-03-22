const cookie = require("cookie")
const { find_chapter_comic } = require("../../../services/web_comic/chapter");
const { insert_follow, find_follow, delete_follow, find_follow_by_user } = require("../../../services/web_comic/follow");
const { select_category } = require("../../../services/web_comic/category");
const follow= async(req, res)=>{
    const cookies = cookie.parse(req.headers.cookie || "");
    const { email } = cookies
    const {id}=req.params
    const result= await insert_follow(email,id);
    console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    console.log(email);
    console.log(id);
    console.log(result);
    res.redirect(`/comic/details/${id}`)
}

const unfollow= async (req, res)=>{
    const {id}=req.params
    const follow=await find_follow(id);
    const result= await delete_follow(id);
    console.log(result);
    res.redirect(`/comic/details/${follow.ComicId}`)
}
const comic_follow=async(req, res)=>{
    const cookies = cookie.parse(req.headers.cookie || "");
    const { email } = cookies
    let comic = cookies.comics;
    // Khởi tạo mảng các promise cho việc tìm các chapter của từng comic
    const promises = [];

    if (comic !== undefined) {
        comic = new Map(JSON.parse(comic));
        comic.forEach((value, key) => {
            // Thêm mỗi promise vào mảng
            promises.push(find_chapter_comic(value));
        });
    }

    // Chờ tất cả các promise hoàn thành
    const stories = await Promise.all(promises);
    const comics = await find_follow_by_user(email);
    const categories=await select_category();
    res.render("web_comic/home",{comics, categories, stories, follows:comics, url:undefined})
}

module.exports={follow, unfollow, comic_follow}