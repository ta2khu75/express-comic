const db = require("../../models/index");
const insert_chapter = async (name, views, id_comic) => {
  const result = await db.Chapter.create({ name, views, ComicId: id_comic });
  return result;
};
const find_chapter_comic = async (chapterId) => {
  const result = await db.Chapter.findOne({
    where: { id: chapterId },
    include: db.Comic,
    raw: true,
    nest: true,
  });
  return result;
};
const select_chapter_by_comic = async (id) => {
  const result = await db.Chapter.findAll(
    {
      where: {
        ComicId: id,
      },
      order: [["id", "DESC"]],
      include: db.Comic,
      raw: true,
      nest: true,
    }
    //     {
    //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
    // }
  );
  console.log(result);
  return result;
};
const total_views_chapter_with_comic = async (comicId) => {
  const result = await db.Chapter.findOne(
    {
      where: {
        ComicId: comicId,
      },
      attributes: [
        [db.sequelize.fn("SUM", db.sequelize.col("views")), "total_views"],
      ],
      group:["ComicId"],
      raw: true,
    }
  );
  return result;
};

const select_chapter = async () => {
  const result = await db.Chapter
    .findAll
    //     {
    //     attributes: ['id', 'name', 'id_author', 'summary', 'poster', 'status', 'createdAt', 'updatedAt', 'id_author'], // Change 'AuthorId' to 'id_author'
    // }
    ();
  return result;
};
const find_chapter = async (id) => {
  const result = await db.Chapter.findOne({
    where: {
      id: id,
    },
    include: db.Comic,
    raw: true,
    nest: true,
  });
  return result;
};
const update_chapter = async (id, name, views, id_comic) => {
  const result = await db.Chapter.update(
    { name, views, ComicId: id_comic },
    {
      where: {
        id: id,
      },
    }
  );
  return result;
};
const delete_chapter = async (id) => {
  const result = await db.Chapter.destroy({
    where: {
      id: id,
    },
  });
  return result;
};
module.exports = {
  find_chapter_comic,
  insert_chapter,
  select_chapter,
  update_chapter,
  delete_chapter,
  find_chapter,
  select_chapter_by_comic,
  total_views_chapter_with_comic
};
