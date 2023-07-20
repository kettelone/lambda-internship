import 'dotenv/config';
import cors from 'cors';
import express, { Express } from 'express';

const app: Express = express();

app.use(cors()); // enables to send request from browser
app.use(express.json()); //enables to parse json
app.get('/', function (req, res) {
  res.send('Hello World');
});

const { PORT } = process.env;

const start = async () => {
  try {
    app.listen(PORT, () => console.log(`Server started on port ${PORT}`));
  } catch (e) {
    console.log(e);
  }
};

start();
