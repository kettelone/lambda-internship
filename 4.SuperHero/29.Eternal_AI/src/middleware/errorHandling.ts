import { NextFunction, Request, Response } from 'express';

import CustomErrors from '../errors/customErrors';

function errorHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
): void {
  if (err instanceof CustomErrors) {
    res.status(err.code).json({
      status: err.code,
      name: err.name,
      message: err.message
    });
    return;
  }
  res.status(500).json({
    status: 500,
    name: 'Internal',
    message: 'Internal server error'
  });
  return;
}

export default errorHandler;
