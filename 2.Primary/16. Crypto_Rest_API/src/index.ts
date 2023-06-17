import dotenv from 'dotenv';
import express, { Express } from 'express';
import sequelize from './db';
import CryptoExchange from './controller/cryptoExchangeController';
import AppController from './controller/appController';

const cryptoClass = new CryptoExchange();
const appController = new AppController();

dotenv.config();
const app: Express = express();
const { PORT } = process.env;

app.listen(PORT, async () => {
  try {
    await sequelize.authenticate();
    await sequelize.sync(); // будет сверят состояние базы данных со схемой данных
  } catch (e) {
    console.log(e);
  }

  console.log('hello');

  console.log(`App is running on port ${process.env.PORT}`);
  const coinMarketInfo = await cryptoClass.getCointMarketInfo();
  const coinBaseInfo = await cryptoClass.getCoinBaseInfo();
  const coinMarketStatsInfo = await cryptoClass.getCoinMarketStatsInfo();
  const kucoinInfo = await cryptoClass.getKucoinResponseInfo();
  const coinPaprikaInfo = await cryptoClass.getCoinPaprikaInfo();
  const averagePrices = await appController.findAverage(
    coinMarketInfo,
    coinBaseInfo,
    coinMarketStatsInfo,
    kucoinInfo,
    coinPaprikaInfo
  );
  await appController.saveToDB(averagePrices);
});
