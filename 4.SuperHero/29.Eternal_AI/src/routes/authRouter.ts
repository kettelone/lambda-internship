import express, { Request } from 'express';
const router = express.Router();
import passport = require('passport');

require('../middleware/googleAuth.ts');

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

//SignUp Route
router.post(
  '/sign-up',
  validator.checkAuthCredentials(),
  checkValidationErrors,
  authController.signUp
);

//Redirects to Google auth consent screen
router.get(
  '/google',
  passport.authenticate('google', { scope: ['email', 'profile'] })
);

//Redirect here after successful Google auth
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

//Redirect here after failure Google auth
router.get('/failure', (req, res) => {
  res.send('Failure google auth');
});

//User login
router.post(
  '/login',
  validator.checkAuthCredentials(),
  checkValidationErrors,
  authController.login
);

//for testing purposes
router.delete('/delete-users', authController.deleteUsers);

export default router;
