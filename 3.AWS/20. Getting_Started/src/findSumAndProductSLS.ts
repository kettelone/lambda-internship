'use strict'
import { 
  APIGatewayProxyEvent, 
  APIGatewayProxyResult 
} from "aws-lambda";

const findSumAndProductSLS = async (event:APIGatewayProxyEvent):Promise<APIGatewayProxyResult> => {
  const arr: Array<number> = JSON.parse(event.body).array
  const n: number = JSON.parse(event.body).n
  const arrSliced = arr.slice(0, n)

  const sum = arrSliced.reduce(
    (prev, cur) => (typeof cur === 'number' ? prev + cur : prev),
    0
  )
  const product = arrSliced.reduce(
    (prev, cur) => (typeof cur === 'number' ? prev * cur : prev),
    1
  )

  const responseString = `sum is ${sum}, product is ${product}`
  const response = {
    statusCode: 200,
    body: JSON.stringify(responseString),
  }
  return response
}

module.exports = {
  handler: findSumAndProductSLS,
}
