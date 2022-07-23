require('dotenv').config()
const fs = require('fs')
const { Command } = require('commander')
const TelegramBot = require('node-telegram-bot-api')
const program = new Command()
const bot = new TelegramBot(process.env.TELEGRAM_TOKEN, {
  polling: false,
})

//get the chat id once and save it to .env file
// bot.on('message', (msg) => {
//   const chatId = msg.chat.id
//   console.log(chatId)
// })

const start = () => {
  program.name('tg-bot-cli').description('CLI interaction with TG bot')
  program
    .command('m')
    .description('Enter the message to be sent the TG bot')
    .argument('<string>', 'string to split')
    .action((message) => {
      try {
        bot.sendMessage(process.env.CHAT_ID, message)
      } catch (e) {
        console.log(e)
      }
    })
  program
    .command('p')
    .description('Drag and drop image into the console after the command')
    .argument('<path>', 'path to file')
    .action((path) => {
      try {
        const buffer = fs.readFileSync(path)
        console.log(buffer)
        bot.sendPhoto(process.env.CHAT_ID, buffer)
      } catch (e) {
        console.log(e)
      }
    })
  program.parse()
}

start()
