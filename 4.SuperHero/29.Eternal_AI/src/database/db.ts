import 'dotenv/config';
import { drizzle } from 'drizzle-orm/node-postgres';
import { migrate } from 'drizzle-orm/node-postgres/migrator';
import { Client } from 'pg';

//Production DB connection

const client = new Client({
  connectionString: process.env.DB_CONNECTION_STRING
});

//Dev DB connection

// const client = new Client({
//   host: process.env.DB_HOST,
//   port: +process.env.PORT!,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME
// });

const db = drizzle(client);
const connectDB = async () => {
  await client.connect();
};
// const runMigrations = async () => {
//   await migrate(db, {
//     migrationsFolder: 'src/database/migrations'
//   });
// };

connectDB();
// runMigrations();
export default db;
