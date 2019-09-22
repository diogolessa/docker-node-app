const path = require('path')
const express = require('express')

const homeTpl = path.resolve('src/html/index.html')
const contactTpl = path.resolve('src/html/contact.html')


const homePage = (req, res) => {
    res.sendFile(homeTpl)
}

const contactPage = (req, res) => {
    res.sendFile(contactTpl)
}

module.exports = app => {
    // Definindo arquivos estáticos
    app.use(express.static('src/styles'))

    app.get('/', homePage)
    app.get('/contact', contactPage)
}