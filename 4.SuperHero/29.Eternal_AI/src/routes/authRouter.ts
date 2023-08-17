import express, { Request } from 'express';
const router = express.Router();
import passport = require('passport');

// eslint-disable-next-line import/order
import generateAccessToken from '../utils/generateJWT';
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
  function (req: GoogleCallbackRequest, res) {
    if (!req.user) {
      return;
    }
    const { id, displayName, emails } = req.user;
    if (!emails) {
      return;
    }
    const token = generateAccessToken({
      googleId: id,
      displayName,
      email: emails[0].value
    });
    res.json(token);
    // res.redirect(`${baseFrontendUrl}/OAuthRedirecting?token=${token}`);
  }
);

router.get('/failure', (req, res) => {
  res.send('Failure google auth');
});

export default router;
