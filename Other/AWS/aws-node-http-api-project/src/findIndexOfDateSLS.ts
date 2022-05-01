'use strict'
import { 
  APIGatewayProxyResult 
} from "aws-lambda";

const findIndexOfDateSLS = async (): Promise<APIGatewayProxyResult> => {
  const currentYear = new Date().getFullYear()
  const currentMonth = new Date().getMonth()
  const currentDay = new Date().getDate()

  let dayIndex = currentDay

  for (let month = 0; month < currentMonth; month++) {
    dayIndex += new Date(currentYear, month + 1, 0).getDate()
  }

  const response = {
    statusCode: 200,
    body: JSON.stringify({ dayIndex: dayIndex }),
  }
  return response
}

module.exports = {
  handler: findIndexOfDateSLS,
}
