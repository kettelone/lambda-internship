import { DataTypes } from 'sequelize'; // с помощью DataTypes описываются типы поля(String, Int,  Array ect.)
import sequelize from '../db';

const Coin = sequelize.define('coin', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING, unique: true },
  price: { type: DataTypes.STRING },
});

export default Coin;
