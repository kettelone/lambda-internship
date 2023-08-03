import { InferModel } from 'drizzle-orm';
import { boolean, integer, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
  id: uuid('uuid4').defaultRandom(),
  phoneNumber: varchar('phone_number', { length: 256 }),
  email: varchar('email', { length: 256 }).notNull(),
  password: varchar('password', { length: 256 }).notNull(),
  name: varchar('name', { length: 256 }),
  isSubscribed: boolean('is_subscribed').default(false),
  freeQuestions: integer('free_questions').default(5)
});

export type NewUser = InferModel<typeof users, 'insert'>; // insert type
export type User = InferModel<typeof users>; // return type when queried
