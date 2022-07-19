// import readline module
const readline = require('readline')

// create interface for input and output
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
})

const cliInteraction = () => {
  rl.question(
    'Please enter some words and or numbers separated by space?\n ',
    (userInput) => {
      rl.question(
        `What would you like to do with information provided?
            1.Sort the words in alphabetical order.
            2.Sort the numbers in acsending order.
            3.Sort the numbers in decsending order.
            4.Sort the words in acsending order by the number of letters in the word.
            5.Show only unique words.
            6.Show only unique values.
            7.Type 'exit' to stop the program execution.\n
        Enter a number(1-7) and press Enter: `,
        (userChoice) => {
          switch (userChoice) {
            case 'exit':
              rl.close()
              break
            case '1':
              console.log(userInput.split(' ').sort())
              cliInteraction()
              break
            case '2':
              console.log(userInput.split(' ').sort((a, b) => a - b))
              cliInteraction()
              break
            case '3':
              console.log(userInput.split(' ').sort((a, b) => b - a))
              cliInteraction()
              break
            case '4':
              console.log(
                userInput.split(' ').sort((a, b) => a.length - b.length)
              )
              cliInteraction()
              break
            case '5':
              console.log([...new Set(userInput.split(' '))])
              cliInteraction()
              break
            case '6':
              console.log([...new Set(userInput.split(' '))])
              cliInteraction()
              break
            default:
              cliInteraction()
          }
        }
      )
    }
  )
}

cliInteraction()
