const express = require('express')
const router = require('./routes')

const app = express()

const PORT = 4000

router(app)

app.listen(PORT, () => {
    console.log('listening on port ', PORT)
})