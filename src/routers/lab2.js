const express=require("express")
const router=express.Router();
const {bai1get, bai1port, bai2Form, bai2Result, bai3Form, bai3Result} =require("../controller/lab2")
router.get("/bai1",bai1get)
router.post("/bai1/*",bai1port)
router.get("/bai2", bai2Form)
router.post("/bai2", bai2Result)

router.get("/bai3", bai3Form)
router.post("/bai3", bai3Result)
module.exports=router;