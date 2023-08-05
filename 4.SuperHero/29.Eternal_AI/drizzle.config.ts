import 'dotenv/config';

import type { Config } from 'drizzle-kit';

export default {
  schema: './src/database/schema/*',
  driver: 'pg',
  out: './src/database/migrations',
  dbCredentials: {
    connectionString: `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`
  }
} satisfies Config;
