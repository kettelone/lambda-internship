import { authRepositoryInterface } from './interface';
import db from '../../database/db';
import { users } from '../../database/schema/users';
import { NewUser } from '../../database/schema/users';
class AuthRepository implements authRepositoryInterface {
  async signUpUser(email: string, password: string) {
    {
      const user: NewUser[] = await db
        .insert(users)
        .values({ email, password })
        .returning();
      return user;
    }
  }
}

export default new AuthRepository();
