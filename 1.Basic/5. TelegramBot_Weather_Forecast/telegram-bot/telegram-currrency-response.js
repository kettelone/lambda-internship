const axios = require('axios')
let previousCurrencyInfo = null
const currencyCodes = {
  USD: 840,
  EUR: 978,
  GBP: 826,
  AED: 784
}
class PrivatBankClass {
  async getExchangeRate(currency) {}
}
class MonoBankClass {
  async getExchangeRate(currency) {
    const monoApiUrl = 'https://api.monobank.ua/bank/currency'
    try {
      const response = await axios(monoApiUrl)
      if (response.status === 200) {
        previousCurrencyInfo = response
        const exchangeRate = response.data.filter((el) => {
          return el['currencyCodeA'] === currencyCodes[`${currency}`]
        })
        return `${exchangeRate[0]['rateBuy'].toFixed(2)}/${exchangeRate[0][
          'rateSell'
        ].toFixed(2)}`
      }
    } catch (e) {
      const exchangeRate = previousCurrencyInfo.data.filter((el) => {
        return el['currencyCodeA'] === currencyCodes[`${currency}`]
      })
      return `${exchangeRate[0]['rateBuy'].toFixed(2)}/${exchangeRate[0][
        'rateSell'
      ].toFixed(2)}`
    }
  }
}

module.exports = {
  PrivatBankClass,
  MonoBankClass
}
