const {finalResult, calculateResultDate, getPrice, getTime} = require('./index');

describe('getTime',()=>{
    test('should return time needed for the order execution', ()=>{
        expect(getTime(500, 'ru')).toBe(3600*1000)
    })
})