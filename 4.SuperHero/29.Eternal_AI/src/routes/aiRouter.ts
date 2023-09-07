import express from 'express';

const router = express.Router();
import aiController from '../controller/aiController';
import checkAuth from '../middleware/authMiddleware';
import checkValidationErrors from '../middleware/validationResults';
import validator from '../middleware/validator';

router.get(
  '/ask-question',
  checkAuth,
  validator.checkQuestionToAI(),
  checkValidationErrors,
  aiController.askQuestion
);

export default router;
