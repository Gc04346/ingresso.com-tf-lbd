// Arquivo com a configuração do banco de dados.
const Pool = require('pg').Pool
const pool = new Pool({
	user: 'postgres',
	host: 'localhost',
	database: 'ingresso_app',
	password: 'postgres',
	port: '5432',
}) 

// Obtendo todos os ingressos.
const getIngressos = (request, response) => {
	pool.query('select * from ingresso order by id_ingresso asc', (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

// Obtendo um ingresso pelo id.
const getIngressoById = (request, response) => {
	const id = parseInt(request.params.id)

	pool.query('select * from ingresso where id_ingresso = $1', [id], (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

// Gravando um ingresso.
const createIngresso = (request, response) => {
	// Campos que iremos persistir.
	const { tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento } = request.body

	pool.query('insert into ingresso (tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento) values ($1, $2, $3, $4, $5, $6, $7, $8)', [tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento], (error, results) => {
		if (error) {
			throw error
		}
		response.status(201).send('Ingresso adicionado com o ID: ${result.insertId}')
	})
}

// Atualizar um ingresso.
const updateIngresso = (request, response) => {
	const id = parseInt(request.params.id)
	const { tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento } = request.body

	pool.query(
		'update ingresso set tipo = $1, preco = $2, data = $3, id_sala = $4, id_filme = $5, id_compra = $6, id_horario = $7, id_assento = $8 where id_ingresso = $9',
		[tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento, id],
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

	pool.query('delete from ingresso where id_ingresso = $1', [id], (error, results) => {
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