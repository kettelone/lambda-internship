const {Router} = require('express')
const router = Router()
const fs = require('fs')
const csv = require('csv-parser')
let finalArray = []

//read csv file with ip ranges
fs.createReadStream('IP2LOCATION-LITE-DB1.CSV')
.pipe(csv())
.on('data', function (row) {
  //create an array for each line of csv file
  //if coutry code doesn`t exist skip that line
  if(row.code.length > 1){
    let subArray = [+row.from, +row.to, row.code, row.country]
    //push subarray to the final array
    finalArray.push(subArray)
  }
})
.on('end', function () {
    console.log(`CSV file reading finished`)
  })


router.get('/', (req, res)=>{
    let IP = req.headers['x-forwarded-for']

    //Convert IP Address to IP Number
    let parsedIP = IP.split('.')
    let w = +parsedIP[0],
        x = +parsedIP[1],
        y = +parsedIP[2],
        z = +parsedIP[3]

    let ipNumber = (16777216*w + 65536*x + 256*y +z)

    //compare IP number from user with data from csv file
    let finalArrayLength = finalArray.length
    let clientInfo;
    for(let n = 0; n < finalArrayLength; n++){
      if(ipNumber >= finalArray[n][0] && ipNumber <= finalArray[n][1]){
          clientInfo = {"IP is: " : IP ,"country is" : finalArray[n][3]}
      }
    }
    
    res.json(clientInfo)
})
module.exports = router