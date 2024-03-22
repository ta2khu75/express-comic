const cookie = require("cookie")
const  {mailOptions, sendMail}= require("../config/mail")
const bai1upload = (req, res) => {
    res.render("lab3/bai1upload");
}
const bai1result = (req, res) => {
    const photo = req.files['photo'][0];
    const doc = req.files['doc'][0];
    res.render("lab3/bai1result", { photo, doc });
}
const bai2Form = (req, res) => {
    res.render("lab3/bai2Form")
}
const bai2Result = (req, res) => {
    console.log("hahahahaha");
    const { name, password, gender, married, country, hobbies, note } = req.body;
    res.render("lab3/bai2Result", { name: name, password: password, gender: gender, married: married, country: country, note: note, hobbies: hobbies })
}
const bai4get = (req, res) => {
    const cookies = cookie.parse(req.headers.cookie || "");
    const { username, password } = cookies
    console.log("username" + username + "   password" + password);
    const message = "";
    res.render("lab3/bai4", { message, username, password })
}
const bai4post = (req, res) => {
    let { username, password, remember } = req.body;
    if (username === "minh" && password === "247") {
        res.cookie("username", username);
        res.cookie("password", password);
        console.log(remember);
        if (remember == undefined) {
            res.cookie("username", "", {
                expires: new Date(0)
            });
            res.cookie("password", "", { expires: new Date(0) });
        }
        res.redirect("/lab3/bai4");
    } else {
        res.render("lab3/bai4", { message: "Invalid username or password", username: "", password: "" })
    }
}

const bai5get=(req, res)=>{
    res.render("lab3/bai5",{message:"", from:"boomkings474@gmail.com"})
}
const bai5send=(req, res)=>{
    const {to, subject, body}=req.body;
    sendMail(mailOptions(to, subject,body),res)
}
module.exports = { bai1upload, bai1result, bai2Form, bai2Result, bai4get, bai4post, bai5get, bai5send };