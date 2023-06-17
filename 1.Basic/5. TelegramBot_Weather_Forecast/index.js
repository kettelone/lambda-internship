require('dotenv').config()
const express = require('express')
const TelegramBot = require('node-telegram-bot-api')
const axios = require('axios')
const forecastClass = require('./telegram-bot/telegram-weather-class')
const userResponse = require('./telegram-bot/telegram-user-response')
const {
  MonoBankClass,
  PrivatBankClass
} = require('./telegram-bot/telegram-currrency-response')
const mono = new MonoBankClass()
const privat = new PrivatBankClass()

const bot = new TelegramBot(process.env.TELEGRAM_BOT_TOKEN, { polling: true })
const app = express()
const PORT = process.env.PORT || 7000

// every 15 minutes send a request to the app to prevent from falling asleep
setInterval(async () => {
  const appUrl = 'https://weather-currency-super-bot.herokuapp.com/'
  await axios.get(appUrl)
}, 15 * 60 * 1000)

let cityName = ''

app.listen(PORT, async () => {
  console.log(`Your app started on ${PORT}`)

  bot.on('message', async (msg) => {
    const chatId = msg.chat.id
    const message = msg.text
    if (message === '/start') {
      const serviceOptions = userResponse.serviceOptions()
      bot.sendMessage(chatId, 'Оберіть сервіс', serviceOptions)
    } else if (message === 'Головне меню') {
      const serviceOptions = userResponse.serviceOptions()
      bot.sendMessage(chatId, 'Оберіть сервіс', serviceOptions)
    } else if (message === 'Попереднє меню') {
      const cityOptions = userResponse.cityOptions()
      bot.sendMessage(chatId, 'Оберіть своє місто...', cityOptions)
    } else if (message === 'Місто не в списку...') {
      bot.sendMessage(chatId, 'Введіть назву населеного пункту...')
    } else if (
      message === 'Суми' ||
      message === 'Харків' ||
      message === 'Дніпро'
    ) {
      cityName = message
      const intervalOptions = userResponse.intervalOptions()
      bot.sendMessage(chatId, 'Оберіть інтервал...', intervalOptions)
    } else if (message === 'З інтервалом 3 години') {
      const forecast = await forecastClass.getForecast(cityName)
      const finalForecast = forecastClass.craeteCustomFormat(forecast)
      const finalString = forecastClass.createFinalString(
        finalForecast,
        cityName,
        3
      )
      bot.sendMessage(chatId, finalString, {
        parse_mode: 'HTML'
      })
    } else if (message === 'З інтервалом 6 годин') {
      const forecast = await forecastClass.getForecast(cityName)
      const finalForecast = forecastClass.craeteCustomFormat(forecast)
      const finalString = forecastClass.createFinalString(
        finalForecast,
        cityName,
        6
      )
      bot.sendMessage(chatId, finalString, {
        parse_mode: 'HTML'
      })
    } else if (message === 'Погода') {
      const cityOptions = userResponse.cityOptions()
      bot.sendMessage(chatId, 'Оберіть своє місто...', cityOptions)
    } else if (message === 'Курс валют') {
      const currencyOptions = userResponse.currencyOptions()
      bot.sendMessage(chatId, 'Оберіть валюту...', currencyOptions)
    } else if (message === 'USD' || message === 'EUR') {
      const currency = message
      const rate = await mono.getExchangeRate(currency)
      bot.sendMessage(chatId, `🪙1 ${currency} = ${rate} грн`)
    } else {
      cityName = msg.text
      const forecast = await forecastClass.getForecast(cityName)
      if (forecast.status && forecast.status === 200) {
        const intervalOptions = userResponse.intervalOptions()
        bot.sendMessage(chatId, 'Оберіть інтервал...', intervalOptions)
      } else if (forecast.status && forecast.status === 400) {
        bot.sendMessage(chatId, 'Вказане місто не знайдено')
      }
    }
  })
})
