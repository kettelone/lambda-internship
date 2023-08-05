import { InferModel } from 'drizzle-orm';
import { integer, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';

import { users } from './users';

export const bankcards = pgTable('bankCards', {
  id: uuid('uuid').defaultRandom().notNull(),
  cardNumber: integer('card_number'),
  expiryDate: varchar('expiry_date', { length: 5 }),
  cvc: integer('cvc'),
  userId: uuid('user_id').references(() => users.id)
});

export type BankCard = InferModel<typeof bankcards>; // return type when queried
export type NewBankCard = InferModel<typeof bankcards, 'insert'>; // insert type
