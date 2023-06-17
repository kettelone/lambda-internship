const axios = require('axios')
const moment = require('moment')
moment.locale('uk')

const emojies = {
  'scattered clouds': '☁️', //рвані хмари
  'few clouds': '⛅',
  'broken clouds': '☁️',
  'overcast clouds': '☁️',
  'clear sky': '🟡',
  'shower rain': '🌧️',
  rain: '🌦️',
  thunderstorm: '🌩️',
  'light rain': '🌧️',
  'moderate rain': '🌧️',
  snow: '❄️',
  mist: '🌫️'
}

class ForecastClass {
  //get forecast from open weather API
  async getForecast(cityName) {
    const language = 'en'
    try {
      const openWeatherUrl = encodeURI(
        `https://api.openweathermap.org/data/2.5/forecast?q=${cityName}&lang=${language}&units=metric&appid=${process.env.OPEN_WEATHER_API_KEY}`
      )
      const response = await axios(openWeatherUrl)
      return response
    } catch (e) {
      console.log(e)
      const response = {
        status: 400
      }
      return response
    }
  }

  //custom forescast for every 3 hours
  craeteCustomFormat(forecast) {
    let finalForecast = {}

    forecast.data.list.map((el) => {
      let dayOfWeek = moment(el.dt_txt.split(' ')[0]).format('dddd')
      let dayOfMonth = moment(el.dt_txt.split(' ')[0]).format('LL').slice(0, -8)
      let day = `${dayOfWeek}, ${dayOfMonth}`
      let time = el.dt_txt.split(' ')[1].substring(0, 5)
      let tempReal = Math.round(el.main.temp)
      let tempFeelsLike = Math.round(el.main.feels_like)
      let weatherDescription = emojies[el.weather[0].description]

      if (finalForecast.hasOwnProperty(day)) {
        finalForecast[day].push(
          `${time}, ${tempReal}°C, відчувається ${tempFeelsLike}°C ${weatherDescription}\n`
        )
      } else {
        finalForecast[day] = [
          `${time}, ${tempReal}°C, відчувається ${tempFeelsLike}°C ${weatherDescription}\n`
        ]
      }
    })

    return finalForecast
  }

  createFinalString(finalForecast, cityName, interval) {
    let finalString = `Погода в <b>${cityName}</b>\n\n`
    if (interval === 3) {
      for (const [key] of Object.entries(finalForecast)) {
        finalString += `⬇️ <b>${key}</b>\n\n`
        finalForecast[key].map((el) => {
          finalString += `🕒 ${el}`
        })
        finalString += `\n`
      }
    } else if (interval === 6) {
      for (const [key] of Object.entries(finalForecast)) {
        finalString += `⬇️ <b>${key}</b>\n\n`
        for (let i = 0; i < finalForecast[key].length; i = i + 2) {
          if (finalForecast[key][i]) {
            finalString += `🕒 ${finalForecast[key][i]}`
          }
        }
        finalString += `\n`
      }
    }
    return finalString
  }
}

module.exports = new ForecastClass()
