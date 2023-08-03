import { User } from '../../database/schema/users';

export interface authRepositoryInterface {
  signUpUser(email: string, password: string): Promise<User[]>;
}
