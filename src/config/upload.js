const fs=require("fs")
const path = require("path")
const multer = require("multer");
const createUploadsFolderIfNeeded = (folderPath) => {
    if (!fs.existsSync(folderPath)) {
        fs.mkdirSync(folderPath, { recursive: true });
    }
}
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        const uploadFolder = path.join("./src/public", 'uploads');
        createUploadsFolderIfNeeded(uploadFolder);
        cb(null, uploadFolder)
    },
    filename: (req, file, cb) => cb(null, file.fieldname + " " + Date.now() + path.extname(file.originalname))
})
const upload = multer({ storage: storage })
module.exports = upload;
