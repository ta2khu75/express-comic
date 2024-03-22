const express=require("express");
const {bai2, bai3, bai4, bai5Form, bai5Sout, bai6Form, bai6Result} =require("../controller/lab1")
const router=express.Router();
router.get("/bai2",bai2)
router.get("/bai3",bai3)
router.get("/bai4",bai4)
router.get("/bai5",bai5Form)
router.post("/bai5",bai5Sout)
router.get("/bai6", bai6Form);
router.post("/bai6", bai6Result);
module.exports=router