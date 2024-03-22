const cookie = require("cookie")
const authenticate = (req, res, next) => {
    // Kiểm tra xem người dùng đã đăng nhập chưa
    const cookies = cookie.parse(req.headers.cookie || "");
    const { email } = cookies
    if (email == undefined) {
        res.redirect("/login");
    } else next()
}
module.exports={authenticate}