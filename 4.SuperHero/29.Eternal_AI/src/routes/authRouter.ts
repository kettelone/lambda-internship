import express from 'express';
const router = express.Router();
import passport = require('passport');
require('../middleware/auth.ts');

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
    failureRedirect: process.env.FAILURE_REDIRECT,
    successRedirect: process.env.SUCCESS_REDIRECT
  })
);

router.get('/success', (req, res) => {
  res.json('Success google auth');
});

router.get('/failure', (req, res) => {
  res.send('Failure google auth');
});

export default router;
