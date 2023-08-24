import bcrypt from 'bcrypt';
import { NextFunction, Request, Response } from 'express';

import AuthError from '../errors/authErrors';
import authRepository from '../repository/AuthRepository/authRepository';
import generateAccessToken from '../utils/generateJWT';

class AuthController {
  public async signUp(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const hash = await bcrypt.hash(password, 5);
      const newUser = await authRepository.signUpUser(email, hash);
      const jwt = generateAccessToken({ email });
      res.status(201).send({
        jwt,
        user: newUser,
        message: 'User is successfully registered'
      });
    } catch (e: any) {
      if (e.code === '23505') {
        next(AuthError.userExist());
      } else {
        next(AuthError.internal());
      }
    }
  }

  public async login(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const user = await authRepository.getUser(email);
      if (!user) {
        next(AuthError.userNotExist());
        return;
      }
      if (!user.password) {
        next(AuthError.loginWithGoogle());
        return;
      }
      const validPassword = bcrypt.compareSync(password, user.password);
      if (!validPassword) {
        next(AuthError.invalidPassword());
        return;
      }
      const jwt = generateAccessToken({ email });
      res.status(201).send({
        jwt,
        user: user,
        message: 'User is successfully logged in'
      });
    } catch (e) {
      next(AuthError.internal());
    }
  }

  async deleteUsers(req: Request, res: Response) {
    await authRepository.deleteUsers();
    res.send();
  }
}

export default new AuthController();
