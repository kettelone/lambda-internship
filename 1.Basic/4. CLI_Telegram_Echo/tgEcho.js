require('dotenv').config()
const axios = require('axios').default
const TelegramBot = require('node-telegram-bot-api')
const imageEndpoint = 'https://picsum.photos/400/400'

const bot = new TelegramBot(process.env.TELEGRAM_TOKEN, { polling: true })

const getImage = async () => {
  const image = await axios.get(imageEndpoint, {
    responseType: 'arraybuffer',
  })
  return image
}

bot.on('message', async (msg) => {
  console.log(msg)
  const chatId = msg.chat.id

  if (msg.text === '/photo') {
    try {
      const image = await getImage()
      bot.sendPhoto(chatId, image.data)
      console.log('User requested photo')
    } catch (e) {
      console.log(e)
    }
  } else {
    bot.sendMessage(chatId, `${msg.from.username} sent message: '${msg.text}'`)
  }
  // send a message to the chat acknowledging receipt of their message
})
