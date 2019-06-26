// Arquivo com a configuração do banco de dados.
const Pool = require('pg').Pool
const pool = new Pool({
	user: 'app',
	host: 'localhost',
	database: 'cinema',
	password: 'testeapp',
	port: '5432',
}) 

// Obtendo todos os ingressos.
const getIngressos = (request, response) => {
	pool.query('select * from ingresso order by id asc', (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

// Obtendo um ingresso pelo id.
const getIngressoById = (request, response) => {
	const id = parseInt(request.params.id)

	pool.query('select * from ingresso where id = $1', [id], (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

// Gravando um ingresso.
const createIngresso = (request, response) => {
	// Campos que iremos persistir.
	const { tipo, preco, assento, horario, data } = request.body

	pool.query('insert into ingresso (tipo, preco, assento, horario, data) values ($1, $2, $3, $4, $5)', [tipo, preco, assento, horario, data], (error, results) => {
		if (error) {
			throw error
		}
		response.status(201).send('Ingresso adicionado com o ID: ${result.insertId}')
	})
}

// Atualizar um ingresso.
const updateIngresso = (request, response) => {
	const id = parseInt(request.params.id)
	const { tipo, preco, assento, horario, data } = request.body

	pool.query(
		'update ingresso set tipo = $1, preco = $2, assento = $3, horario = $4, data = $5 where id $6',
		[tipo, preco, assento, horario, data],
		(error, results) => {
			if (error) {
				throw error
			}
			response.status(200).send('Ingresso modificado com o ID: ${id}')
		})
}

// Deletar um usuário
const deleteIngresso = (request, response) => {
	const id = parseInt(request.params.id)

	pool.query('delete from users where id = $1', [id], (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).send('Ingresso deletado com o ID: ${id}')
	})
}

// Métodos que precisamos exportar
module.exports = {
	getIngressos,
	getIngressoById,
	createIngresso,
	updateIngresso,
	deleteIngresso,
}