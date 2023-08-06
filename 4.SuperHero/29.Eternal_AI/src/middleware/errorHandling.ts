import { NextFunction, Request, Response } from 'express';

import DBError from '../errors/dbErrors';

function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
): void {
  if (err instanceof DBError) {
    res.status(err.code).json(err.message);
    return;
  }
  res.status(500).json('Generic server error');
  return;
}

export default errorHandler;
