import { InferModel } from 'drizzle-orm';
import { integer, pgTable, serial, varchar } from 'drizzle-orm/pg-core';

import { users } from './users';

export const bankCards = pgTable('bankCards', {
  id: serial('id').primaryKey(),
  cardNumber: integer('card_number'),
  expiryDate: varchar('expiry_date', { length: 5 }),
  cvc: integer('cvc'),
  userId: integer('user_id').references(() => users.id)
});

export type BankCard = InferModel<typeof bankCards>; // return type when queried
export type NewBankCard = InferModel<typeof bankCards, 'insert'>; // insert type
