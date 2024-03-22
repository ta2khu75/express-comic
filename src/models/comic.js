'use strict';
const {
  Model
} = require('sequelize');
const comic_image = require('./comic_image');
module.exports = (sequelize, DataTypes) => {
  class Comic extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Comic.belongsTo(models.Author)
      Comic.hasMany(models.Chapter)
      Comic.hasMany(models.Follow)
      Comic.belongsToMany(models.Category,{through:models.CategoryComic})
    }
  }
  Comic.init({
    name: DataTypes.STRING,
    AuthorId: DataTypes.INTEGER,
    summary: DataTypes.STRING,
    poster: DataTypes.STRING,
    status: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Comic',
  });
  return Comic;
};