import { Request, Response } from 'express';

// import authRepository from '../repository/AuthRepository/authRepository';
class AuthController {
  async signUp(req: Request, res: Response) {
    try {
      console.log(req.body);
      // const { email, password } = req.body as { [key: string]: string };
      // const user = await authRepository.signUpUser(email, password);
      res.json();
    } catch (e) {
      console.log(e);
    }
  }
}

export default new AuthController();
