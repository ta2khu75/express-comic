const bai1get=(req,res)=>{
    res.render("lab2/bai1",{message:""})
}
const bai1port=(req, res)=>{
    const body=req.body;
    const a=body.a*1;
    const b=body.b*1;
    const c=body.c*1;
    let message="";
    if( (a + b > c) && (a + c > b) && (b + c > a) ) {
        const uri = req.originalUrl;
        const chu_vi = (a+b+c);
        if(uri.includes("dientich")){
            let dien_tich = Math.sqrt(chu_vi * (a + b - c) * (a + c - b) * (b + c - a))/4;
            message=dien_tich
        }else{
            message=chu_vi
        }
    }else{
        message="Không thỏa mãn các cạnh của một tam giác!";
    }
    res.render("lab2/bai1",{message:message})
}

const bai2Form=(req, res)=>{
    res.render("lab2/bai2Form")
}
const bai2Result=(req, res)=>{
    let name=req.body.name;
    let password=req.body.password;
    let gender=req.body.gender;
    let married=req.body.married;
    let country=req.body.country;
    let note=req.body.note;
    res.render("lab2/bai2Result",{name:name, password:password, gender:gender, married:married,country:country, note:note})
}

const bai3Form=(req, res)=>{
    res.render("lab2/bai3Form")
}
const bai3Result=(req, res)=>{
    let name=req.body.name;
    let password=req.body.password;
    let gender=req.body.gender;
    let married=req.body.married;
    let country=req.body.country;
    let note=req.body.note;
    let hobbies=req.body.hobbies;
    res.render("lab2/bai3Result",{name:name, password:password, gender:gender, married:married,country:country, note:note, hobbies:hobbies})
}
module.exports={bai1get, bai1port, bai2Form, bai2Result, bai3Form, bai3Result}