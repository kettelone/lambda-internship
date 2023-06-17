const express = require('express')
const mainRoutes = require('./routes/main')

const PORT = process.env.PORT || 80 

const app = express()
app.use(mainRoutes)
app.listen(PORT, ()=>{
    console.log(`Server has been started on port ${PORT}`)
})
