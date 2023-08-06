import { NextFunction, Request, Response } from 'express';
import { validationResult } from 'express-validator';

function checkValidationErrors(
  req: Request,
  res: Response,
  next: NextFunction
): Response | undefined {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  next();
}

export default checkValidationErrors;
