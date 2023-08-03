import { integer, pgTable, serial, text, timestamp } from 'drizzle-orm/pg-core';

import { users } from './users';

export const questionsAnswers = pgTable('questionsAnswers', {
  id: serial('id').primaryKey(),
  question: text('question'),
  answer: text('answer'),
  timestamp: timestamp('timestamp', { precision: 6, withTimezone: true }),
  userId: integer('user_id').references(() => users.id)
});
