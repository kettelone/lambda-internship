import { body, query } from 'express-validator';

import INDIVIDUALS from '../utils/individuals';

class Validator {
  checkAuthCredentials() {
    return [
      body('email')
        .notEmpty()
        .withMessage('The email value should not be empty')
        .isEmail()
        .withMessage('The value should be a valid email'),
      body('password')
        .notEmpty()
        .withMessage('The password value should not be empty')
        .isLength({ min: 8 })
        .withMessage('The password value should be at least 8 characters long')
    ];
  }

  checkQuestionToAI() {
    return [
      query('question')
        .notEmpty()
        .withMessage('The question should not be an empty string'),
      query('characterID')
        .notEmpty()
        .withMessage('The characterID should not be empty')
        .isNumeric()
        .withMessage('The characterID should be a numeric value')
        .custom((value) => {
          const result = Object.keys(INDIVIDUALS).length + 1 >= Number(value);
          return result;
        })
        .withMessage('Provided characterID does not exist')
    ];
  }
}

export default new Validator();
