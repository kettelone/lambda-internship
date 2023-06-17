const moment = require('moment')

const pricePerSymbolList = {
    ru: 0.05,
    ua: 0.05,
    en: 0.12,
}
const symbolsPerHour = {
    ru: 1333,
    ua: 1333,
    en: 333,
}

const hour = 3600*1000;
const halfHour = hour/2;


const fileExtensions  = ["doc", "docx", "rtf"];

function getPrice(textLength, ln){
    const pricePerSymbol = pricePerSymbolList[ln]
    const price = Math.max(1000, textLength)*pricePerSymbol
    return price
}

function getTime(textLength, ln){
    const symbolsPerHourCount = symbolsPerHour[ln]
    const time = Math.max(hour, halfHour + ((textLength/symbolsPerHourCount)*hour))
    return time
}

function priceAndTimeMultiplier(fileExtension) {
    return fileExtensions.includes(fileExtension) ? 1 : 1.2
}

function calculateResultDate(duration){
    const resultDate = moment();
    while(true){
        const dayStart = moment(resultDate)
            .startOf("day")
            .hour(10)
            .minute(0)
            .valueOf()

        const dayEnd =  moment(resultDate)
            .startOf("day")
            .hour(19)
            .minute(0)
            .valueOf()

        switch (resultDate.valueOf()) {
            case resultDate.valueOf() > dayEnd:
                resultDate.add(1, "days").set({hours: '10', minutes: '00'})
                break;
            case resultDate.valueOf() < dayStart:
                resultDate.set({hours: '10', minutes: '00'})
                break
            default: break;
        }

        if(resultDate.day() === 6 || resultDate.day() === 0){
            resultDate.add(1, "days").set({hours: '10', minutes: '00'})
            continue
        }

        const leftToEndDay = dayEnd - resultDate.valueOf()
        if(duration < leftToEndDay){
            return resultDate.valueOf() + duration
        }

        duration = duration - leftToEndDay;

        resultDate.add(1, "days").set({hours: '10', minutes: '00'})
    }
}

function finalResult(textLength, ln, format){
    const formatMultiplier = priceAndTimeMultiplier(format)
    const price = getPrice(textLength, ln)*formatMultiplier
    const duration = getTime(textLength, ln)*formatMultiplier
    console.log(duration)
    const date = calculateResultDate(duration)
    console.log(date)
    return `price: ${price}, deadline date is: ${moment(date).format('LLLL')}`
}
console.log(finalResult(500, 'ru', 'doc'));