import { Sequelize } from 'sequelize';
// connection to the local postgres
const sequelize = new Sequelize('crypto-db', 'postgres', 'guest@dxb2021', {
  host: 'localhost',
  dialect: 'postgres',
});

// const sequelize = new Sequelize({
//   database: process.env.DB_NAME,
//   username: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   host: process.env.DB_HOST,
//   port: 5432,
//   dialect: 'postgres',
//   dialectOptions: {
//     ssl: {
//       require: true,
//       rejectUnauthorized: false, // <<<<<<< YOU NEED THIS
//     },
//   },
// });

export default sequelize;
