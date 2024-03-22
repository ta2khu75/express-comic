const bai2=(req,res)=>{
    res.send("<h1>hello</h1>")
}
const bai3=(req,res)=>{
    res.render("lab1/bai3")
}
const bai4=(req,res)=>{
    res.render("lab1/bai4", {message:"Helloworld"})
}
const bai5Form=(req, res)=>{
    res.render("lab1/bai5Form")
}
const bai5Sout=(req,res)=>{
    res.render("lab1/bai5Sout",{name:req.body.name})
}

const bai6Form=(req,res)=>{
    res.render("lab1/bai6Form")
}
const bai6Result=(req, res)=>{
    let dai=req.body.dai*1;
    let rong=Number(req.body.rong);
    console.log("dai"+dai);
    console.log("rong"+rong);
    const dientich=dai*rong;
    const chuvi=(dai+rong)/2
    res.render("lab1/bai6Result",{dientich:dientich,chuvi:chuvi})
}
module.exports={bai2, bai3, bai4, bai5Form,bai5Sout, bai6Form, bai6Result}