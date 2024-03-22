const bai1 = (req, res) => {
    res.render("lab4/bai1layout", { img: "https://cdn.tgdd.vn/Products/Images/44/308490/acer-aspire-3-a314-35-c3ks-n5100-nxa7ssv009-thumb-600x600.jpg", name: "Laptop Acer Aspire 3 A314 35 C3KS N5100/4GB/256GB/Win11 (NX.A7SSV.009)" })
}
const users = [
    { name: "Username 1", password: "Password 1", remember: true },
    { name: "Username 2", password: "Password 2", remember: false },
    { name: "Username 3", password: "Password 3", remember: true }
]
const bai2get = (req, res) => {
    res.render("lab4/bai2layout",{users:users, form:users[1]})
}
const bai2add=(req, res)=>{
    const {name,password,remember}=req.body;
    const user={name,password,remember:Boolean(remember)};
    console.log(user);
    users.push(user);
    console.log(users);
    res.render("lab4/bai2layout",{users:users, form:users[1]})
}
const bai3=(req,res)=>{
    const item = {img:"https://cdn.tgdd.vn/Products/Images/44/308490/acer-aspire-3-a314-35-c3ks-n5100-nxa7ssv009-thumb-600x600.jpg", name: "Laptop Acer Aspire 3 A314 35 C3KS N5100/4GB/256GB/Win11 (NX.A7SSV.009)", price:500, discount:0.1};
    res.render("lab4/bai3", {item})
}
const bai4=(req,res)=>{

    res.render("lab4/bai4",{img: "https://cdn.tgdd.vn/Products/Images/44/308490/acer-aspire-3-a314-35-c3ks-n5100-nxa7ssv009-thumb-600x600.jpg", name: "Laptop Acer Aspire 3 A314 35 C3KS N5100/4GB/256GB/Win11 (NX.A7SSV.009)" } )
}
module.exports = { bai1, bai2get, bai2add, bai3, bai4}