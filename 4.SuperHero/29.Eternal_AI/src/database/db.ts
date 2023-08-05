import 'dotenv/config';
import { drizzle } from 'drizzle-orm/node-postgres';
import { migrate } from 'drizzle-orm/node-postgres/migrator';
import { Client } from 'pg';

const client = new Client({
  host: process.env.DB_HOST,
  port: 5432,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

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
