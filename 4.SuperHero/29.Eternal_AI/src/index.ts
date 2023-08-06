import 'dotenv/config';
import cors from 'cors';
import express, { Express } from 'express';

import errorHandler from './middleware/errorHandling';
import router from './routes/index';
const app: Express = express();

app.use(cors()); // enables to send request from browser
app.use(express.json()); //enables to parse json
app.use('/api', router);
app.use(errorHandler);

const { PORT } = process.env;

const start = async () => {
  try {
    app.listen(PORT, async () => {
      console.log(`Server started on port ${PORT}`);
    });
  } catch (e) {
    console.log(e);
  }
};

start();
