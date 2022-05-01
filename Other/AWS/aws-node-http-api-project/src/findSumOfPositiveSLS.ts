'use strict'
import { 
  APIGatewayProxyEvent, 
  APIGatewayProxyResult 
} from "aws-lambda";

const findSumOfPositiveSLS = async (event: APIGatewayProxyEvent):Promise<APIGatewayProxyResult> => {
  const arr: Array<number> = JSON.parse(event.body)
  const sum: number = arr.reduce(function (prev, curr) {
    return curr > 0 ? prev + curr : prev
  }, 0)

  const response = {
    statusCode: 200,
    body: 'Sum is: ' + JSON.stringify(sum),
  }
  return response
}

module.exports = {
  handler: findSumOfPositiveSLS,
}
