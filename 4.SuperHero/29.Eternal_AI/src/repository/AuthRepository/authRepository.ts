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
      name: string | null;
      id: string;
      phoneNumber: string | null;
      email: string;
      password: string;
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
