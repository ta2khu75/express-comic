const express = require("express");
const router = express.Router();
const upload = require("../config/upload")
const { bai1upload, bai1result, bai2Form, bai2Result, bai4get, bai4post, bai5get, bai5send } = require("../controller/lab3")
router.get("/bai1", bai1upload)
router.post("/bai1", upload.fields([
    { name: 'photo', maxCount: 1 },
    { name: 'doc', maxCount: 1 }
]), bai1result)
router.get("/bai2", bai2Form)
router.post("/bai2", bai2Result)
router.get("/bai4", bai4get)
router.post("/bai4", bai4post)
router.get("/bai5", bai5get)
router.post("/bai5", bai5send)
module.exports = router