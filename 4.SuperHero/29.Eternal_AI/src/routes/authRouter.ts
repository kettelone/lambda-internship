import express from 'express';

const router = express.Router();
import authController from '../controller/authController';
import checkValidationErrors from '../middleware/validationResults';
import validator from '../middleware/validator';

router.post(
  '/sign-up',
  validator.checkSignUpUser(),
  checkValidationErrors,
  authController.signUp
);

export default router;
