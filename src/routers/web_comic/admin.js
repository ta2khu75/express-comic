const express = require("express");
const cookie = require("cookie");
const { ctr_insert_comic_image, ctr_delete_comic_image, ctr_find_comic_image, ctr_select_comic_image, ctr_update_comic_image, ctr_select_comic_image_by_chapter } = require("../../controller/web_comic/admin/comic_image")
const { ctr_insert_chapter, ctr_delete_chapter, ctr_find_chapter, ctr_select_chapter, ctr_update_chapter, ctr_select_chapter_by_comic } = require("../../controller/web_comic/admin/chapter")
const { ctr_insert_comic, ctr_delete_comic, ctr_find_comic, ctr_select_comic, ctr_update_comic, ctr_select_comic_by_author } = require("../../controller/web_comic/admin/comic")
const { ctr_delete_author, ctr_find_author, ctr_insert_author, ctr_select_author, ctr_update_author } = require("../../controller/web_comic/admin/author")
const { ctr_delete_category, ctr_find_category, ctr_select_category, ctr_update_category, ctr_insert_category } = require("../../controller/web_comic/admin/category");
const { ctr_delete_user, ctr_find_user, ctr_insert_user, ctr_select_user, ctr_update_user } = require("../../controller/web_comic/admin/user");
const { find_user_email } = require("../../services/web_comic/user");
const { manager } = require("../../controller/web_comic/admin/manager")
const authenticate = async (req, res, next) => {
    // Kiểm tra xem người dùng đã đăng nhập chưa
    const cookies = cookie.parse(req.headers.cookie || "");
    const { email } = cookies
    if (email == undefined) {
        res.redirect("/login");
        return
    }
    const user = await find_user_email(email);
    console.log(user);
    if (user != undefined) {
        if (user.role == 1) {
            next()
            return;
        }
    }
    res.redirect("/login");
}
const router = express.Router();
router.use(authenticate);
router.get("/", manager)
//comic
router.get("/comic", ctr_select_comic)
router.post("/comic/insert", ctr_insert_comic)
router.get("/comic/edit", ctr_find_comic)
router.post("/comic/delete/:id", ctr_delete_comic)
router.post("/comic/update", ctr_update_comic)
router.get("/author/comic/:id", ctr_select_comic_by_author)


//chapter
router.get("/chapter", ctr_select_chapter)
router.post("/chapter/insert", ctr_insert_chapter)
router.get("/chapter/edit/:id", ctr_find_chapter)
router.post("/chapter/delete/:id", ctr_delete_chapter)
router.post("/chapter/update", ctr_update_chapter)
router.get("/comic/chapter/:id", ctr_select_chapter_by_comic)


//comic_image
router.get("/comic_image", ctr_select_comic_image)
router.post("/comic_image/insert", ctr_insert_comic_image)
router.get("/comic_image/edit/:id", ctr_find_comic_image)
router.post("/comic_image/delete/:id", ctr_delete_comic_image)
router.post("/comic_image/update", ctr_update_comic_image)
router.get("/chapter/comic_image/:id", ctr_select_comic_image_by_chapter)


//category
router.get("/category", ctr_select_category)
router.post("/category/insert", ctr_insert_category)
router.get("/category/edit/:id", ctr_find_category)
router.post("/category/delete/:id", ctr_delete_category)
router.post("/category/update", ctr_update_category)

//author
router.get("/author", ctr_select_author)
router.post("/author/insert", ctr_insert_author)
router.get("/author/edit/:id", ctr_find_author)
router.post("/author/delete/:id", ctr_delete_author)
router.post("/author/update", ctr_update_author)

//user
router.get("/user", ctr_select_user)
router.post("/user/insert", ctr_insert_user)
router.get("/user/edit/:id", ctr_find_user)
router.post("/user/delete/:id", ctr_delete_user)
router.post("/user/update", ctr_update_user)
module.exports = router