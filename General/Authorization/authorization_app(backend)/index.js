const express = require('express')
const PORT = process.env.PORT || 5000
const authRouter = require("./authRouter")

const app = express()

app.use("/", authRouter)


app.listen(PORT, ()=> console.log(`Server is listening on ${PORT}`))