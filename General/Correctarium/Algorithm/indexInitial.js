
///////==========Initial==========//////////
function priceCalculation(text, language, date){
    let textLength = (133)
    let isStandartFormat = true
    //price per symbol
    const ukrRus = 0.05
    const eng = 0.12
    //minimun price
    const minPrice1 = 50
    const minPrice2 = 120
    let price

    //price per text
    if(language === 'Украинский' || language === 'Русский' ){
        price = (ukrRus*textLength).toFixed(2)
        price = price > minPrice1? price : minPrice1
    }else if(language === 'Английский'){
        price = (eng*textLength).toFixed(2)
        price = price > minPrice2? price : minPrice2
    }
    // price if file has not .doc, .docx ,.rtf extension
    if(!isStandartFormat){
        price = (price*1.2)
    }

    const ms = 1000
    const millisecondsInHour = 3600*ms
    //minimun time to complete order in seconds
    const minTime = 60*60
    const initialTime  = 30*60

    //work speed
    let ukrRusSpeed = (60*60)/1333
    let engSpeed = (60*60)/333
    let timeNeeded
   
    // time needed to complete the order in seconds
    if(language === 'Украинский' || language === 'Русский' ){
        timeNeeded = ukrRusSpeed*textLength + initialTime
        timeNeeded = timeNeeded> minTime? timeNeeded : minTime
    }else if(language === 'Английский'){
        timeNeeded = engSpeed*textLength + initialTime
        timeNeeded = timeNeeded> minTime? timeNeeded : minTime
    }
    //time to complete order if file has not .doc, .docx ,.rtf extension
    if(!isStandartFormat){
        timeNeeded = (timeNeeded*1.2)
    }

    
    let orderDay =  date.getDay()//  getDay() number of the day of the week  0 - Sunday , 6 - Saturday
    let orderDate = date.getDate()// date of the day ex.: 17 
    //console.log(orderDate)
    let orderMonth = date.getMonth()
    let orderYear = date.getFullYear()


    //check if order received during or out of working days
    if(date.getDay() === 6 ){
        date = new Date(orderYear, orderMonth, (orderDate + 2), 10)
    }else if(date.getDay() === 0){
        date = new Date(orderYear, orderMonth, (orderDate + 1), 10)
    }

  
    //check if order received during or out of working hours
    let workingTimeBegining = new Date(orderYear, orderMonth, orderDate, 10)
    let workingTimeEnd = new Date(orderYear, orderMonth, orderDate, 19)
    
    //If order received before 10:00
    if(workingTimeBegining > date.getTime()){
        date = workingTimeBegining
    }
    
    //if order received after 19:00
    if(date >= workingTimeEnd){
        if(date.getDay() === 5){
            date  = new Date(orderYear, orderMonth, orderDate + 3, 10)
        }else{
            date = new Date(orderYear, orderMonth, orderDate + 1, 10)
        }
    }
    
    let timeLeftInDay = 9*millisecondsInHour - (date.getTime() -  workingTimeBegining.getTime())
    let oneFullDay = 24*60*60*1000
    let oneFullWeek = 7*24*60*60*1000
    let oneWorkingDay = 9*60*60
    let weeksToComplete
    let hoursLeftToComplete
    let daysToComplete
    let hours
    let secondsToComplete
    let deadline

    //check if order can be completed same day
    if((timeLeftInDay - (timeNeeded*1000)) > 0){
        
        deadline = new Date((date.getTime() + timeNeeded*1000))

    }else{ 
        hours = (timeNeeded/3600)
        weeksToComplete = Math.trunc(hours/(9*5))
        daysToComplete = Math.trunc((timeNeeded -  weeksToComplete*5*oneWorkingDay)/oneWorkingDay)
        hoursLeftToComplete = Math.trunc((timeNeeded -(weeksToComplete*5*oneWorkingDay + daysToComplete*oneWorkingDay))/3600)
        secondsToComplete  = timeNeeded - (Math.trunc((timeNeeded/3600))*3600)
        
        deadline = new Date(date.getTime() + oneFullWeek*weeksToComplete + daysToComplete*oneFullDay + hoursLeftToComplete*millisecondsInHour + secondsToComplete*ms)
        let daysLeftinWeek = 5 - date.getDay()
        //console.log(daysLeftinWeek)
 
        if(daysLeftinWeek > daysToComplete){         
                if(deadline.getHours() >= 19){
                    hoursLeftToComplete =  (deadline.getHours() - 19)
                    deadline = new Date(date.getTime() + oneFullWeek*weeksToComplete + (daysToComplete + 1)*oneFullDay + (10 + hoursLeftToComplete)*millisecondsInHour + secondsToComplete*ms)
                    console.log(deadline)
                    if((deadline.getDay() === 6) || deadline.getDay() === 0){
                        deadline = new Date(deadline.getTime() + 2*oneFullDay)
                    }
                }else{
                    deadline = new Date(date.getTime() + oneFullWeek*weeksToComplete + daysToComplete*oneFullDay + hoursLeftToComplete*millisecondsInHour + secondsToComplete*ms)
                
                    if((deadline.getDay() === 6) || deadline.getDay() === 0){
                        deadline = new Date(deadline.getTime() + 2*oneFullDay)
                    }
                }
        }else{
                deadline = new Date(date.getTime() + oneFullWeek*weeksToComplete + (daysToComplete + 2)*oneFullDay + hoursLeftToComplete*millisecondsInHour + secondsToComplete*ms)
                //console.log(deadline.getHours() >= 19)
                if(deadline.getHours() >= 19){
                    hoursLeftToComplete = (deadline.getHours() - 19)
                    //console.log(deadline.getMinutes())
                deadline =  new Date(deadline.getFullYear(), deadline.getMonth(), (deadline.getDate() + 1), (10 + hoursLeftToComplete), deadline.getMinutes())
                    if((deadline.getDay() === 6) || deadline.getDay() === 0){
                        deadline = new Date(deadline.getTime() + 2*oneFullDay)
                    }
                }
            }

    }
  
    //console.log(deadline)

     return [price, deadline]
}
