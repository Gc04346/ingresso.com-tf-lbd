// Arquivo com as configurações do nosso servidor.
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

app.use(bodyParser.json())
app.use(
	bodyParser.urlencoded({
		extended: true,
	})
)

app.get('/', (request, response) => {
	response.json({ info: 'Olha o monstro saindo da jaula.' })
})

app.listen(port, () => {
	console.log('App running on port ${port}.')
})