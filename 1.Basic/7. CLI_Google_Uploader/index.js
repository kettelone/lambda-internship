import 'dotenv/config'
import inquirer from 'inquirer'
import {
  imageUpload,
  imageRename,
  enterNewName,
  sortenUrl,
} from './controller/questions.js'
import { ControllerClass } from './controller/controller.js'
const controller = new ControllerClass()


const askToShorten = (response) => {
  const imageId = response.data.id
  console.log('File has been succesfully uploaded!')
  const { shortenUrl } = await inquirer.prompt(sortenUrl)
  if (shortenUrl === 'yes') {
    const response = await controller.shortenUrl(imageId)
    console.log(response)
  }
}

const start = async () => {
  const { path } = await inquirer.prompt(imageUpload)
  const { rename } = await inquirer.prompt(imageRename)
  if (rename === 'yes') {
    const { newName } = await inquirer.prompt(enterNewName)
    const response = await controller.uploadImage(path, newName)
    if (response.status && response.status === 200) {
      askToShorten(response)
    }
  } else if(rename === 'no'){
    const response = await controller.uploadImage(path, '')
    if (response.status === 200) {
      askToShorten(response)
    }
  }
}

start()
