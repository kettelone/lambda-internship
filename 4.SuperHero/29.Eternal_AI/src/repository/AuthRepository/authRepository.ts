import { authRepositoryInterface } from './interface';
import db from '../../database/db';
import { users } from '../../database/schema/users';
import { User } from '../../database/schema/users';
class AuthRepository implements authRepositoryInterface {
  async signUpUser(
    email: string,
    password: string
  ): Promise<
    {
      email: string;
      password: string;
      name: string | null;
      id: string | null;
      phoneNumber: string | null;
      isSubscribed: boolean | null;
      freeQuestions: number | null;
    }[]
  > {
    const user: User[] = await db
      .insert(users)
      .values({ email, password })
      .returning();
    return user;
  }
}

export default new AuthRepository();
