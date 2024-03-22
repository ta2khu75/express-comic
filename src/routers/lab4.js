const express = require("express")
const router = express.Router();
const { bai1, bai2get, bai2add, bai3, bai4 } = require("../controller/lab4");
router.get("/bai1", bai1)
router.get("/bai2", bai2get)
router.post("/bai2", bai2add)
router.get("/bai3", bai3)
router.get("/bai4", bai4)


module.exports = router