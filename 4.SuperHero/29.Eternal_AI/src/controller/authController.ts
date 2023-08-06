import bcrypt from 'bcrypt';
import { NextFunction, Request, Response } from 'express';
import DBError from '../errors/dbErrors';

import authRepository from '../repository/AuthRepository/authRepository';

class AuthController {
  async signUp(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body as { [key: string]: string };
      const hash = await bcrypt.hash(password, 5);
      await authRepository.signUpUser(email, hash);
      res.json("User is successfully registered"); 
    } catch (e: any) {
      if (e.code === "23505") {
        next(DBError.userExist())
      } else {
        next(DBError.internal())
      }
    }
  }

  async googleSignUp(req: Request, res: Response, next: NextFunction) {
    
  }
}

export default new AuthController();
