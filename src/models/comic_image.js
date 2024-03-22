'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Comic_Image extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Comic_Image.belongsTo(models.Chapter)
    }
  }
  Comic_Image.init({
    url: DataTypes.STRING,
    ChapterId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Comic_Image',
  });
  return Comic_Image;
};