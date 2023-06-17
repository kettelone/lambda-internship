class UserResponse {
  serviceOptions() {
    const options = {
      reply_markup: {
        keyboard: [['Погода'], ['Курс валют']],
        resize_keyboard: true,
        one_time_keyboard: true
      }
    }

    return options
  }

  cityOptions() {
    const options = {
      reply_markup: {
        keyboard: [
          ['Харків', 'Суми', 'Дніпро'],
          ['Місто не в списку...'],
          ['Головне меню']
        ],
        resize_keyboard: true,
        one_time_keyboard: true
      }
    }

    return options
  }

  intervalOptions() {
    const options = {
      reply_markup: {
        keyboard: [
          ['З інтервалом 3 години'],
          ['З інтервалом 6 годин'],
          ['Попереднє меню']
        ],
        resize_keyboard: true,
        one_time_keyboard: true
      }
    }
    return options
  }

  currencyOptions() {
    const options = {
      reply_markup: {
        keyboard: [['USD', 'EUR'], ['Головне меню']],
        resize_keyboard: true,
        one_time_keyboard: true
      }
    }
    return options
  }
}

module.exports = new UserResponse()
