import { sql } from 'drizzle-orm';
import { Request } from 'express';
import passport, { DoneCallback } from 'passport';

import db from '../database/db';
import { users } from '../database/schema/users';

interface Profile {
  emails: {
    value: string;
    verified: true;
  }[];
  id: string;
}
// eslint-disable-next-line @typescript-eslint/no-var-requires
const GoogleStrategy = require('passport-google-oauth20').Strategy;
passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: process.env.GOOGLE_CALLBACK_URL,
      passReqToCallback: true
    },
    async function (
      request: Request,
      accessToken: string,
      refreshToken: string,
      profile: Profile,
      done: DoneCallback
    ) {
      const googleAccountEmail = profile.emails[0].value;
      const user = await db
        .select()
        .from(users)
        .where(sql`${users.email} = ${googleAccountEmail}`);
      if (user.length === 0) {
        await db
          .insert(users)
          .values({ email: googleAccountEmail, googleId: profile.id });
      }
      return done(null, profile);
    }
  )
);
