import bcrypt from 'bcrypt';
import { Request, Response } from 'express';

// import authRepository from '../repository/AuthRepository/authRepository';
class AuthController {
  async signUp(req: Request, res: Response) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const hash = await bcrypt.hash(password, 5);
      console.log({ hash });
      // await authRepository.signUpUser(email, hash);
      res.json();
    } catch (e) {
      console.log(e);
    }
  }
}

export default new AuthController();
