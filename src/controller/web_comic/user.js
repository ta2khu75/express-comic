const { find_user_email, insert_user } = require("../../services/web_comic/user");
const cookie = require("cookie")
const getLogin = (req, res) => {
    res.render("web_comic/home", {url:"login", message: "" })
}
const postLogin = async (req, res) => {
    const { email, password } = req.body;
    const result = await find_user_email(email);
    console.log(result);
    console.log(password);
    console.log(result.password === password);
    if (result.password === password) {
        res.cookie("email", email);
        res.cookie("password", password);
        res.redirect("/");
    }
    res.render("web_comic/home", {url:"login",  message: "Login Failed!" })
}


const getRegister = (req, res) => {
    res.render("web_comic/home", {url:"register", message: "" })
}
const postRegister = (req, res) => {
    const { email, password, confirm } = req.body;
    const existingUser = find_user_email(email);
    if (existingUser !== null) {
        if (password === confirm) {
            const user = insert_user(email, password);
            if (user != undefined) {
                res.render("web_comic/home", {url:"register", message: "Register Success" })
                return;
            }
            res.render("web_comic/home", {url:"register", message: "Register Failed" })
            return;

        }
        res.render("web_comic/home", {url:"register", message: "Password and confirm must match" })
        return;
    }
    res.render("web_comic/home", {url:"register", message: "Existing user" })
}

const logout = async (req, res) => {
    res.cookie("email", "", {
        expires: new Date(0)
    });
    res.cookie("password", "", { expires: new Date(0) });
    res.redirect("/login")
}

module.exports = { getRegister, postRegister, getLogin, postLogin , logout}