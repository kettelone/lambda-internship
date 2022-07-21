import inquirer from 'inquirer'
import * as fs from 'fs'

const questionsUserInfo = [
  {
    type: 'input',
    name: 'name',
    message: 'Please provide your name. Press ENTER to cancel: ',
  },
  {
    type: 'list',
    name: 'gender',
    message: 'Choose your gender',
    choices: ['Male', 'Female', 'None of mentioned above'],
    when(answers) {
      if (answers.name === '') {
        return false
      }
      return true
    },
    filter(val) {
      return val.toLowerCase()
    },
  },
  {
    type: 'input',
    name: 'age',
    message: 'Please specify your age: ',
    when(answers) {
      if (answers.name === '') {
        return false
      }
      return true
    },
  },
]

const questionDB = [
  {
    type: 'list',
    name: 'search',
    message: 'Would you like to find user in database? (y/n) ',
    choices: ['y(yes)', 'n(no)'],
  },
]

const questionUserName = [
  {
    type: 'input',
    name: 'userName',
    message: 'Type the name of the user you want to find ',
    filter(val) {
      return val.toLowerCase()
    },
  },
]

const start = async () => {
  const answersUserInfo = await inquirer.prompt(questionsUserInfo)
  if (answersUserInfo.name === '') {
    const answersDB = await inquirer.prompt(questionDB)
    if (answersDB.search === 'y(yes)') {
      fs.readFile('usersDB.txt', 'utf8', async function (err, file) {
        if (err) throw err
        const usersArray = file.split('\n')
        usersArray.pop()
        const DB = usersArray.map((element) => {
          return JSON.parse(element)
        })

        const answerUserSearch = await inquirer.prompt(questionUserName)
        let notFound = true
        for (let i = 0; i < DB.length; i++) {
          if (DB[i].name === answerUserSearch.userName) {
            notFound = false
            console.log(DB[i])
            break
          }
        }
        if (notFound) {
          console.log('User was not found')
        }
      })
    } else {
      return
    }
  } else {
    fs.appendFile(
      'usersDB.txt',
      JSON.stringify(answersUserInfo) + '\n',
      function (err) {
        if (err) throw err
      }
    )
    await start()
  }
}

start()
