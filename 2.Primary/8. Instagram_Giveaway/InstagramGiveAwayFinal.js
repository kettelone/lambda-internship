let uniqueValues = ()=>{
     
     const fs = require('fs')

     //get number of files in the folder
     let numberOfFiles = fs.readdirSync('./Text-files').length
     let wordsCollectionString = "";
     let setObject;
     let wordsArray = [];
     let finalArray = [];
    for(let file = 0; file < numberOfFiles; file ++){
        //1. read the text file
        wordsCollectionString = fs.readFileSync(`Text-files-2M/out${file}.txt`, 'utf8')
        //2. create an array of words by splitting string on '\n' character
        wordsArray = wordsCollectionString.split('\n')
        //3.create new Set object from the array of words
        setObject = new Set(wordsArray)
        //4.Convert the set into array using spread
        setObject = [...setObject]
        finalArray = finalArray.concat(setObject)
    }
    let finalSet = new Set(finalArray)
    console.log("unique values: ", finalSet.size)
}

                                                //////////////------------------------///////////////////

let existInAllFiles= () => {
    const fs = require('fs')

    //get number of files in the folder
    let numberOfFiles = fs.readdirSync('./Text-files').length
    let wordsCollectionString = "";
    let setObject;
    let wordsArray = [];
    let finalArray = [];
   for(let file = 0; file < numberOfFiles; file ++){
       //1. read the text file
       wordsCollectionString = fs.readFileSync(`Text-files-2M/out${file}.txt`, 'utf8')
       //2. create an array of words by splitting string on '\n' character
       wordsArray = wordsCollectionString.split('\n')
       //3.create new Set object from the array of words
       setObject = new Set(wordsArray)
       //4.Convert the set into array using spread
       setObject = [...setObject]
       finalArray.push(setObject)
   }

   let finalMerged = []
   for(let q =0; q < finalArray.length; q++){
       finalMerged = finalMerged.concat(finalArray[q])
   }
   let finalSorted = finalMerged.sort()

   let result = finalSorted.reduce(function(prev, cur) {
        prev[cur] = (prev[cur] || 0) + 1;
        return prev;
    }, {});
    let repeatedWordsOccurence = Object.values(result)
    let reapetedLength = repeatedWordsOccurence.length
    let existInAll = 0

    for(let q = 0; q < reapetedLength; q++){
        if(repeatedWordsOccurence[q] === 20){
            existInAll++
        }
    }

    console.log("existInAll is: ", existInAll)
}
                                                //////////////------------------------///////////////////

let existInAtLeastTen = ()=>{
    const fs = require('fs')

    //get number of files in the folder
    let numberOfFiles = fs.readdirSync('./Text-files').length
    let wordsCollectionString = "";
    let setObject;
    let wordsArray = [];
    let finalArray = [];
   for(let file = 0; file < numberOfFiles; file ++){
       //1. read the text file
       wordsCollectionString = fs.readFileSync(`Text-files-2M/out${file}.txt`, 'utf8')
       //2. create an array of words by splitting string on '\n' character
       wordsArray = wordsCollectionString.split('\n')
       //3.create new Set object from the array of words
       setObject = new Set(wordsArray)
       //4.Convert the set into array using spread
       setObject = [...setObject]
       finalArray.push(setObject)
   }
   let finalSorted = [];
   let sortedArray = [];

   for(let n = 0; n < numberOfFiles; n++){
    sortedArray = finalArray[n].sort();
    finalSorted = finalSorted.concat(sortedArray)
   }

    finalSorted = finalSorted.sort()
    let existAtLeastInTen = 0

    let result = finalSorted.reduce(function(prev, cur) {
        prev[cur] = (prev[cur] || 0) + 1;
        return prev;
        }, {});

    let repeatedWordsOccurence = Object.values(result)
    let reapetedLength = repeatedWordsOccurence.length

    for(let q = 0; q < reapetedLength; q++){
        if(repeatedWordsOccurence[q] >= 10){
                existAtLeastInTen++
        }
    }

    console.log("existAtLeastInTen: ", existAtLeastInTen)

}   

console.time('FirstWay');
uniqueValues()
console.timeEnd('FirstWay');
console.time('FirstWay');
existInAtLeastTen()
console.timeEnd('FirstWay');
console.time('FirstWay');
existInAllFiles()
console.timeEnd('FirstWay');