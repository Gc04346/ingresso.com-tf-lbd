// Arquivo com as configurações do nosso servidor.
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000
const db = require('./queries')

app.use(bodyParser.json())
app.use(
	bodyParser.urlencoded({
		extended: true,
	})
)
// Habilitando o CORS
app.use(function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	next();
});

// Página inicial do nosso site.
app.get('/', (request, response) => {
	response.json({ info: 'Implementação do Caso de Uso CSU-XXX do trabalho de MDS.' })
})

// Rotas por url.
app.get('/ingressos', db.getIngressos)
app.get('/ingressos/:id', db.getIngressoById)
app.post('/ingressos', db.createIngresso)
app.put('/ingressos/:id', db.updateIngresso)
app.delete('/ingressos/:id', db.deleteIngresso)

app.listen(port, () => {
	console.log('App running on port ${port}.')
})
