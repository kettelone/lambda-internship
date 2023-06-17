const imageUpload = [
  {
    type: 'input',
    name: 'path',
    message: 'Drag and drop the image to upload and press Enter: ',
  },
]

const imageRename = [
  {
    type: 'list',
    name: 'rename',
    message: 'Would you like to rename an image? ',
    choices: ['yes', 'no'],
  },
]

const enterNewName = [
  {
    type: 'input',
    name: 'newName',
    message: 'Enter new name for the image and press Enter: ',
  },
]

const sortenUrl = [
  {
    type: 'list',
    name: 'shortenUrl',
    message: 'Would you like to shorten image url? ',
    choices: ['yes', 'no'],
  },
]

export { imageUpload, imageRename, enterNewName, sortenUrl }
