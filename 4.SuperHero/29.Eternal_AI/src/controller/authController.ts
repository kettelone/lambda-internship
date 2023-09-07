import bcrypt from 'bcrypt';
import { NextFunction, Request, Response } from 'express';

import CustomErrors from '../errors/customErrors';
import authRepository from '../repository/AuthRepository/authRepository';
import generateAccessToken from '../utils/generateJWT';

class AuthController {
  public async signUp(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const hash = await bcrypt.hash(password, 5);
      const newUser = await authRepository.signUpUser(email, hash);
      const jwt = generateAccessToken({ id: newUser.id });
      res.status(201).send({
        jwt,
        user: newUser,
        message: 'User is successfully registered'
      });
    } catch (e: any) {
      if (e.code === '23505') {
        next(CustomErrors.userExist());
      } else {
        next(CustomErrors.internal());
      }
    }
  }

  public async login(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const user = await authRepository.getUser(email);
      if (!user) {
        next(CustomErrors.userNotExist());
        return;
      }
      if (!user.password) {
        next(CustomErrors.loginWithGoogle());
        return;
      }
      const validPassword = bcrypt.compareSync(password, user.password);
      if (!validPassword) {
        next(CustomErrors.invalidPassword());
        return;
      }
      const jwt = generateAccessToken({ id: user.id });
      res.status(201).send({
        jwt,
        user: {
          id: user.id,
          name: user.name,
          phoneNumber: user.phoneNumber,
          email: user.email,
          isSubscribed: user.isSubscribed,
          freeQuestions: user.freeQuestions
        },
        message: 'User is successfully logged in'
      });
    } catch (e) {
      next(CustomErrors.internal());
    }
  }

  async deleteUsers(req: Request, res: Response) {
    await authRepository.deleteUsers();
    res.send();
  }
}

export default new AuthController();
