import 'dotenv/config';
import bodyParser from 'body-parser';
import cors from 'cors';
import express, { Express } from 'express';
import passport from 'passport';
require('./middleware/auth');

// import { runMigration } from './database/db';
import errorHandler from './middleware/errorHandling';
import router from './routes/index';
const app: Express = express();

app.use(cors()); // enables to send request from browser
app.use(express.json()); //enables to parse json

app.use('/api', router);
app.use(bodyParser.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use(errorHandler);

const { PORT } = process.env;

const start = async () => {
  try {
    // await runMigration();
    app.listen(PORT, async () => {
      console.log(`Server started on port ${PORT}`);
    });
  } catch (e) {
    console.log(e);
  }
};

start();
