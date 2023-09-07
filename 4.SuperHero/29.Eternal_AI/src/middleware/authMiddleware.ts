import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';

import CustomErrors from '../errors/customErrors';
function checkAuth(req: Request, res: Response, next: NextFunction) {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) {
      next(CustomErrors.notAuthenticated());
      return;
    }
    const id = jwt.verify(token, process.env.JWT_SECRET!);
    req.query.decodedData = id;
    next();
  } catch (e) {
    next(CustomErrors.notAuthenticated());
  }
}

export default checkAuth;
