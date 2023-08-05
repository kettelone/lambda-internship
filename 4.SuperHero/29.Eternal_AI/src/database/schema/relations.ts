import { relations } from 'drizzle-orm';

import { bankcards } from './bankCards';
import { questionsAnswers } from './questionsAnswers';
import { users } from './users';

export const cardRelations = relations(bankcards, ({ one }) => ({
  users: one(users, {
    fields: [bankcards.userId],
    references: [users.id]
  })
}));

export const questionsAnswersUsersRelations = relations(users, ({ many }) => ({
  questionsAnswers: many(questionsAnswers)
}));

export const questionsAnswersRelations = relations(
  questionsAnswers,
  ({ one }) => ({
    user: one(users, {
      fields: [questionsAnswers.userId],
      references: [users.id]
    })
  })
);
