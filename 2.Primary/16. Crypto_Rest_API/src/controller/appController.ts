import {
  ICoinMarketCapData,
  ICoinBaseData,
  ICoinMarketStatsData,
  IKucoinData,
  ICoinPaprikaData,
  IFinalCryptoObject,
} from '../models/cryptoExchangeModels';
import Coin from '../models/dbModels';

export default class AppController {
  async findAverage(
    coinMarketInfo: ICoinMarketCapData[],
    coinBaseInfo: ICoinBaseData[],
    coinMarketStatsInfo: ICoinMarketStatsData[],
    kucoinInfo: IKucoinData, // good
    coinPaprikaInfo: ICoinPaprikaData[]
  ) {
    // modify each crypto currency exchange response to be the same format
    const coinMarketObject: IFinalCryptoObject = {};
    const coinBaseObject: IFinalCryptoObject = {};
    const coinMarketStatsObject: IFinalCryptoObject = {};
    const coinPaprikaObject: IFinalCryptoObject = {};

    // coinMarketObject
    coinMarketInfo.forEach((el) => {
      coinMarketObject[`${el.symbol}`] = `${el.quote.USD.price}`;
    });

    // coinBaseObject
    coinBaseInfo.forEach((el) => {
      coinBaseObject[`${el.base}`] = `${el.amount}`;
    });

    // coinMarketStatsObject
    coinMarketStatsInfo.forEach((el) => {
      coinMarketStatsObject[`${el.symbol}`] = `${el.price}`;
    });
    // coinPaprikaObject
    coinPaprikaInfo.forEach((el) => {
      coinPaprikaObject[`${el.symbol}`] = `${el.quotes.USD.price}`;
    });

    const finalArray = [
      coinMarketObject,
      coinBaseObject,
      coinMarketStatsObject,
      coinPaprikaObject,
    ];

    const averagePrices = kucoinInfo;

    // map through each coin Object
    finalArray.forEach((coinObject) => {
      Object.keys(coinObject).forEach((key) => {
        // find the average price of the coin on each iteration from 2 objects
        if (averagePrices[key]) {
          averagePrices[key] = `${(
            (Number(averagePrices[key]) + Number(coinObject[key])) /
            2
          ).toFixed(5)}`;
        }
      });
    });
    return averagePrices;
  }

  async saveToDB(averagePrices: IFinalCryptoObject) {
    Coin.destroy({
      where: {},
    });
    Object.keys(averagePrices).forEach((coin) => {
      Coin.create({
        name: coin,
        price: averagePrices[coin],
      });
    });
  }

  async getOneCoin(coinSymbol: string): Promise<any> {
    const result = await Coin.findOne({
      where: { name: coinSymbol.toUpperCase() },
    });

    return result;
  }
}
