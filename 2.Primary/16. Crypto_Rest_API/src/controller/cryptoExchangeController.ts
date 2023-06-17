import axios from 'axios'
import {
	ICoinMarketCapResponse,
	ICoinMarketCapData,
	ICoinBaseResponse,
	ICoinBaseData,
	ICoinMarketStatsResponse,
	ICoinMarketStatsData,
	IKucoinResponse,
	IKucoinData,
	ICoinPaprikaResponse,
	ICoinPaprikaData
} from '../models/cryptoExchangeModels'

export default class CryptoExchange {
	private endpoints = {
		coinMarketCapURL:
			'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest',
		coinBaseURL: 'https://api.coinbase.com/v2/prices/usd/spot',
		coinMarketStatsURL:
			'https://api.coinstats.app/public/v1/coins?currency=USD',
		kucoinURL: 'https://api.kucoin.com/api/v1/prices',
		coinPaprikaURL: 'https://api.coinpaprika.com/v1/tickers'
	}

	async getCointMarketInfo(): Promise<Array<ICoinMarketCapData>> {
		try {
			const response: ICoinMarketCapResponse = await axios.get(
				this.endpoints.coinMarketCapURL,
				{
					headers: {
						'X-CMC_PRO_API_KEY': `${process.env.COIN_MARKET_CAP_KEY}`
					}
				}
			)
			return response.data.data
		} catch (e) {
			console.log(e)
			return []
		}
	}

	async getCoinBaseInfo(): Promise<Array<ICoinBaseData>> {
		try {
			const response: ICoinBaseResponse = await axios.get(
				this.endpoints.coinBaseURL
			)
			return response.data.data
		} catch (e) {
			console.log(e)
			return []
		}
	}

	async getCoinMarketStatsInfo(): Promise<Array<ICoinMarketStatsData>> {
		try {
			const response: ICoinMarketStatsResponse = await axios.get(
				this.endpoints.coinMarketStatsURL
			)
			return response.data.coins
		} catch (e) {
			console.log(e)
			return []
		}
	}

	async getKucoinResponseInfo(): Promise<IKucoinData> {
		try {
			const response: IKucoinResponse = await axios.get(
				this.endpoints.kucoinURL
			)
			return response.data.data
		} catch (e) {
			console.log(e)
			return {}
		}
	}

	async getCoinPaprikaInfo(): Promise<Array<ICoinPaprikaData>> {
		try {
			const response: ICoinPaprikaResponse = await axios.get(
				this.endpoints.coinPaprikaURL
			)
			return response.data
		} catch (e) {
			console.log(e)
			return []
		}
	}
}
