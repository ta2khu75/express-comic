const express=require("express");
const { insert, update, remove, find, select } = require("../../controller/web_comic/admin/api/comic_image");
const router=express.Router();
router.get("/select/:chapter_id",select);
router.post("/insert",insert);
router.put("/update",update);
router.delete("/delete/:id",remove)
router.get("/find/:id",find)
module.exports=router