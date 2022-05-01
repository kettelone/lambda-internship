'use strict'
import { 
  APIGatewayProxyEvent, 
  APIGatewayProxyResult 
} from "aws-lambda";

const findFirstPositiveSLS = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  const arr:Array<number> = JSON.parse(event.body).array

  const numberInfo = arr.find((el) => typeof el === 'number' && el > 0)

  return numberInfo
    ? { statusCode: 200, body: JSON.stringify(numberInfo) }
    : {
        statusCode: 200,
        body: JSON.stringify('There is no positive number...'),
      }
}

module.exports = {
  handler: findFirstPositiveSLS,
}
