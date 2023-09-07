import { NextFunction, Request, Response } from 'express';

import Errors from '../errors/customErrors';
import aiService from '../service/aiService';
import INDIVIDUALS from '../utils/individuals';
interface UserRequest extends Request {
  query: {
    question: string;
    characterID: string;
    userId: string;
  };
}

class AIController {
  public async askQuestion(
    req: UserRequest,
    res: Response,
    next: NextFunction
  ) {
    try {
      const { question, characterID, userId } = req.query;
      const answer = await aiService.getAIAnswer(
        question,
        Number(characterID) as keyof typeof INDIVIDUALS,
        userId
      );
      if (!answer) {
        next(Errors.internal());
      }
      res.json(answer);
    } catch (e) {
      next(Errors.internal());
    }
  }
}

export default new AIController();
