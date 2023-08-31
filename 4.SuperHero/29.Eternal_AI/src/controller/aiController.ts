import { NextFunction, Request, Response } from 'express';

import aiService from '../service/aiService';
import INDIVIDUALS from '../utils/individuals';
interface UserRequest extends Request {
  query: {
    question: string;
    characterID: string;
  };
}

class AIController {
  public async askQuestion(
    req: UserRequest,
    res: Response,
    next: NextFunction
  ) {
    try {
      const { question, characterID } = req.query;
      const answer = await aiService.getAIAnswer(
        question,
        Number(characterID) as keyof typeof INDIVIDUALS
      );
      res.json(answer);
    } catch (e) {
      console.log(e);
    }
  }
}

export default new AIController();
