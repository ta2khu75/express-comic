const {insert_comic_image, update_comic_image, find_comic_image, delete_comic_image, select_comic_image_by_chapter}= require("../../../../services/web_comic/comic_image")
const insert=async (req, res)=>{
    console.log(req);
    const {url, chapter_id}=req.body;
    const data=req.body
    console.log(data);
    console.log(req.body.url, chapter_id);
    //const result =await insert_comic_image(url, chapter_id);
    res.json({result:req.body.url})
}

const update=async (req, res)=>{
    const {id, url, chapter_id}=req.body;
    const result =await update_comic_image(id,url, chapter_id);
    res.json({result})
}
const find=async (req, res)=>{
    const {id}=req.params;
    const result =await find_comic_image(id);
    res.json({result})
}

const remove=async (req, res)=>{
    const {id}=req.params
    const result =await delete_comic_image(id);
    res.json({result})
}

const select=async (req, res)=>{
    const { chapter_id}=req.params;
    const result =await select_comic_image_by_chapter(chapter_id);
    res.json({result})
}
module.exports={update,insert, remove, select, find}