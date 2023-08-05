import { relations } from 'drizzle-orm';

import { bankcards } from './bankCards';
import { questionsAnswers } from './questionsAnswers';
import { users } from './users';

export const usersRelations = relations(users, ({ one }) => ({
  bankcards: one(bankcards, {
    fields: [users.id],
    references: [bankcards.userId]
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
