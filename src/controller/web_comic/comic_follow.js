const { select_comic } = require("../../services/web_comic/comic")

const {select_category} = require("../../services/web_comic/category")
const home = async (req, res) => {
    const comics = await select_comic()
    const categories=await select_category();
    res.render("web_comic/home",{comics, categories})
}
module.exports = { home }