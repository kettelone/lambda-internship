const dotsRec  = (str, tmp = [str[0]]) => {
    if(str.length <= 1){
        return tmp;
    }

    const char = str[1];
    console.log('char is: ', char) 
    str = str.slice(1)
    const nextWithDots = tmp.slice().map((it) => it + '.' + char)
    const nextWithoutDots = tmp.map((it) => it + char)

    str = str.slice(1);

    const withoutDots = dotsRec(str, nextWithoutDots);
    const withDots = dotsRec(str, nextWithDots);

    return [...withoutDots, ...withDots];
}

dotsRec('abc')