import express, { Request } from 'express';
const router = express.Router();
import passport = require('passport');

require('../middleware/auth.ts');

interface GoogleCallbackRequest extends Request {
  user?: {
    id?: string;
    displayName?: string;
    emails?: { value: string }[];
  };
}

import authController from '../controller/authController';
import checkValidationErrors from '../middleware/validationResults';
import validator from '../middleware/validator';
import authRepository from '../repository/AuthRepository/authRepository';
import generateAccessToken from '../utils/generateJWT';

router.post(
  '/sign-up',
  validator.checkSignUpUser(),
  checkValidationErrors,
  authController.signUp
);

router.get(
  '/google',
  passport.authenticate('google', { scope: ['email', 'profile'] })
);

router.get(
  '/google/callback',
  passport.authenticate('google', {
    session: false,
    failureRedirect: process.env.FAILURE_REDIRECT
  }),
  async function (req: GoogleCallbackRequest, res) {
    if (!req.user) {
      return;
    }
    const { emails } = req.user;
    if (!emails) {
      return;
    }

    const user = await authRepository.getUser(emails[0].value);
    const jwt = generateAccessToken({ email: emails[0].value });
    res.cookie('jwt', jwt);
    res.cookie('user', user);
    res.redirect(`${process.env.SUCCESS_REDIRECT}`);
  }
);

router.get('/failure', (req, res) => {
  res.send('Failure google auth');
});

router.post('/login', authController.login);

//for testing purposes
router.delete('/delete-users', authController.deleteUsers);

export default router;
