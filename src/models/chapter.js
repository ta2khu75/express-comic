'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Chapter extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Chapter.belongsTo(models.Comic)
    }
  }
  Chapter.init({
    name:DataTypes.STRING,
    views: DataTypes.NUMBER,
    ComicId: DataTypes.NUMBER
  }, {
    sequelize,
    modelName: 'Chapter',
  });
  return Chapter;
};