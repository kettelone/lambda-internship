import express from 'express';

const router = express.Router();
import aiController from '../controller/aiController';

router.get('/ask-question', aiController.askQuestion);

export default router;
