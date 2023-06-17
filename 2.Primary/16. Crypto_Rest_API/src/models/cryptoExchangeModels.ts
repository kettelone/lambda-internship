// CoinMarketCap
interface ICoinMarketCapResponse {
  status: number;
  data: {
    data: ICoinMarketCapData[];
  };
}

interface ICoinMarketCapData {
  name: string;
  symbol: string;
  quote: {
    USD: {
      price: number;
      last_updated: string;
    };
  };
}
// CoinBase
interface ICoinBaseResponse {
  data: {
    data: ICoinBaseData[];
  };
}

interface ICoinBaseData {
  base: string; // symbol of the coin
  currency: string;
  amount: string;
}

// CoinMarketStats
interface ICoinMarketStatsResponse {
  data: {
    coins: ICoinMarketStatsData[];
  };
}

interface ICoinMarketStatsData {
  id: string;
  name: string;
  symbol: string;
  price: number;
}

// Kucoin
interface IKucoinResponse {
  data: {
    data: IKucoinData;
  };
}

interface IKucoinData {
  [key: string]: string; // key is the symbol of the coin, value is the price of the coin
}
// CoinPaprika
interface ICoinPaprikaResponse {
  data: [
    {
      name: string;
      symbol: string;
      quotes: {
        USD: {
          price: number;
        };
      };
    }
  ];
}

interface ICoinPaprikaData {
  name: string;
  symbol: string;
  quotes: {
    USD: {
      price: number;
    };
  };
}

interface IFinalCryptoObject {
  [key: string]: string; // key is the symbol of the coin, value is the price of the coin
}

export {
  ICoinMarketCapResponse,
  ICoinMarketCapData,
  ICoinBaseResponse,
  ICoinBaseData,
  ICoinMarketStatsResponse,
  ICoinMarketStatsData,
  IKucoinResponse,
  IKucoinData,
  ICoinPaprikaResponse,
  ICoinPaprikaData,
  IFinalCryptoObject,
};
