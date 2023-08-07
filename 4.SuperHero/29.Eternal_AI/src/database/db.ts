import 'dotenv/config';
// import { drizzle } from 'drizzle-orm/node-postgres';
// import { migrate } from 'drizzle-orm/node-postgres/migrator';
// import { Client } from 'pg';

// const client = new Client({
//   host: process.env.DB_HOST,
//   port: +process.env.PORT!,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME
// });

// const db = drizzle(client);
// const connectDB = async () => {
//   await client.connect();
// };

// connectDB();
// export default db;

/*NEON*/

import { neon, neonConfig } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';
import { migrate } from 'drizzle-orm/neon-http/migrator';

neonConfig.fetchConnectionCache = true;

const sql = neon(process.env.DB_CONNECTION_STRING!);
const db = drizzle(sql);
const runMigration = async () => {
  await migrate(db, { migrationsFolder: './drizzle' });
};
runMigration();

export default db;
