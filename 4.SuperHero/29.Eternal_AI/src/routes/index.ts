import express from 'express';

const router = express.Router();
import aiRouter from './aiRouter';
import authRouter from './authRouter';

router.use('/auth', authRouter);
router.use('/ai', aiRouter);

export default router;
