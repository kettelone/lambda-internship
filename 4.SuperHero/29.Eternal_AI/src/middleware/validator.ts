import { body } from 'express-validator';

class Validator {
  checkSignUpUser() {
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

  checkLoginUser() {}
}

export default new Validator();
