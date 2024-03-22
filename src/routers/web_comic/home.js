const express=require("express");
const {authenticate}=require("../../middleware/user")
const {home} =require("../../controller/web_comic/home")
const {comic_details} =require("../../controller/web_comic/comic_details")
const {chapter_details} =require("../../controller/web_comic/chapter_details");
const { category_details } = require("../../controller/web_comic/category_details");
const { getLogin, postLogin, getRegister, postRegister, logout } = require("../../controller/web_comic/user");
const { follow, unfollow, comic_follow } = require("../../controller/web_comic/admin/follow");
const { history_delete } = require("../../controller/web_comic/history_delete");

const router=express.Router();
router.get("/",home)
router.get("/comic/details/:id",comic_details)
router.get("/category/details/:id",category_details)
router.get("/chapter/details/:id",chapter_details)
router.get("/logout",logout)
router.get("/login",getLogin)
router.post("/login",postLogin)
router.get("/register",getRegister)
router.post("/register",postRegister)
router.get("/history/delete/:id",history_delete)
router.get("/follow/:id",authenticate,follow)
router.get("/unfollow/:id",authenticate,unfollow)
router.get("/comic/follow",authenticate,comic_follow)
module.exports=router