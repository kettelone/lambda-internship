import { sql } from 'drizzle-orm';

import { authRepositoryInterface } from './interface';
import db from '../../database/db';
import { users } from '../../database/schema/users';
class AuthRepository implements authRepositoryInterface {
  async signUpUser(email: string, password: string) {
    const user = await db.insert(users).values({ email, password }).returning({
      id: users.id,
      phoneNumber: users.phoneNumber,
      email: users.email,
      name: users.name,
      isSubscribed: users.isSubscribed,
      freeQuestions: users.freeQuestions
    });
    return user[0];
  }

  async signUpGoogle(email: string, googleId: string) {
    const user = await db.insert(users).values({ email, googleId }).returning({
      id: users.id,
      phoneNumber: users.phoneNumber,
      email: users.email,
      name: users.name,
      isSubscribed: users.isSubscribed,
      freeQuestions: users.freeQuestions
    });
    return user[0];
  }

  async getUser(email: string) {
    const user = await db
      .select()
      .from(users)
      .where(sql`${users.email} = ${email}`);
    return user[0];
  }

  async deleteUsers() {
    await db.delete(users).returning();
    return;
  }
}

export default new AuthRepository();
