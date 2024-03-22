const nodemailer = require("nodemailer")
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: "boomkings474@gmail.com",
        pass: "plvy vcph ixtr fxec"
    }
})
const mailOptions = (to, subject, body) => {
    let content = {
        from: 'boomkings474@gmail.com', // Địa chỉ email người gửi
        to: to, // Địa chỉ email người nhận
        subject: subject, // Tiêu đề email
        text: body // Nội dung email
    }
    return content
}
const sendMail = (mailOptions, res) => {
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            res.render("lab3/bai5", { message: "Gui email that bai", from: "boomkings474@gmail.com" })
        } else {
            res.render("lab3/bai5", { message: "Gui email thanh cong", from: "boomkings474@gmail.com" })
        }
    })
}

module.exports = { sendMail, mailOptions };