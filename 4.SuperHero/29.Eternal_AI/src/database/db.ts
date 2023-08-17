import 'dotenv/config';
import { neon } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';

import * as schema1 from './schema/bankCards';
import * as schema2 from './schema/questionsAnswers';
import * as schema4 from './schema/relations';
import * as schema3 from './schema/users';

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

// import { migrate } from 'drizzle-orm/neon-http/migrator';

const sql = neon(process.env.DB_CONNECTION_STRING!);
const db = drizzle(sql, {
  schema: { ...schema1, ...schema2, ...schema3, ...schema4 }
});

// const runMigration = async (): Promise<void> => {
//   await migrate(db, { migrationsFolder: './drizzle' });
// };
// export { runMigration };
export default db;
