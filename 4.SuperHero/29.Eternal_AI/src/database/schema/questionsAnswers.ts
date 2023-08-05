import { pgTable, text, timestamp, uuid } from 'drizzle-orm/pg-core';

import { users } from './users';

export const questionsAnswers = pgTable('questionsAnswers', {
  id: uuid('uuid').defaultRandom().notNull(),
  question: text('question'),
  answer: text('answer'),
  timestamp: timestamp('timestamp', { precision: 6, withTimezone: true }),
  userId: uuid('user_id').references(() => users.id)
});
