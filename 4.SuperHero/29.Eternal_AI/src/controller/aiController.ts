import { NextFunction, Request, Response } from 'express';

import aiService from '../service/aiService';

interface UserRequest extends Request {
  query: {
    message: string;
  };
}

class AIController {
  public async askQuestion(
    req: UserRequest,
    res: Response,
    next: NextFunction
  ) {
    try {
      const { message } = req.query;
      const answer = await aiService.getAIAnswer(message);
      res.json(answer);
    } catch (e) {
      console.log(e);
    }
  }
}

export default new AIController();
