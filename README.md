# Projeto ingresso.com
Projeto final de Lab de Banco de Dados 1, feito em Junho de 2019. Desenvolveremos uma aplicação simples que implemente uma simulação de uma página web que realize a venda de ingressos de cinema.

## Sobre o projeto
Segue a arquitetura do projeto:
- <code>db_files/</code>: Arquivos utilizados na modelagem, criação e preenchimento do banco.
- <code>index.js</code>: Arquivo com a configuração e mapeamento do servidor.
- <code>queries.js</code>: Arquivo com os métodos de procura no banco de dados.

# Preparação do Ambiente

## NodeJS

### Instalação do NodeJS e NPM
``` shell
sudo apt install nodejs npm   
```

### Teste da intalação
``` shell
nodejs -v
npm -v
```

## Observações
As configurações do banco de dados e as queries utilizadas para pesquisa, inserção, atualização e deleção podem ser vizualizadas no arquivo `queies.js`. Os mapeamentos utilizados podem ser visualizados no arquivo `index.js`. A qualquer momento os arquivos do banco de dados podem ser visualizados acessando a url `http://localhost:3000/ingressos`

Para baixar o projeto no seu computador pedimos que execute os seguintes passos
``` shell
sudo apt install git
git clone git@github.com:Gc04346/ingresso.com-tf-lbd.git
```

## PostgreSQL

### Login como usuário padrão
``` shell
su - postgres psql
```

### Criando um usuário para a aplicação e garantindo privilégios
``` sql
CREATE DATABASE "ingresso_app" OWNER "postgres";
GRANT ALL PRIVILEGES ON DATABASE ingresso_app to postgres;
\q -- sair do PostgreSQL.
```

Pedimos que nesse momento o script seja executado via PgAdmin para criação das tabelas do banco. Há o script <code>db_files/ingresso_app.sql</code> responsável pela criação das tabelas. O script <code>db_files/popula.sql</code> é responsável pelo preenchimento do banco.

### Instalação da extensão para comunicação com o Banco de Dados.
``` shell
cd ingresso.com-tf-lbd # Entrando no diretório que se encontra o projeto.
npm i express pg
```

### Rodando o servidor.
``` shell
# Já na pasta onde se encontram os arquivos. Nome da pasta: ingresso.com-tf-lbd
node index.js
```

## Exemplos de uso da API/REST
A API está mapeada da seguinte forma:
Obs: Utilizaremos o utilitário <code>curl</code> para testar a api via terminal.

### Obter todos os ingressos cadastrados no banco
``` shell
curl http://localhost:3000/ingressos
```

### Obter um ingresso pelo id
Troque <code>id_ingresso</code> pelo id desejado.
``` shell
curl http://localhost:3000/ingressos/id_ingresso
```

### Gravar um novo ingresso
``` shell
curl --data "tipo=2&preco=10.5&data='2019-10-08'&id_sala=1&id_filme=1&id_compra=1&id_horario=1&id_assento=1" http://localhost:3000/ingressos
```

### Atualizar um ingresso
Troque <code>id_ingresso</code> pelo id desejado.
``` shell
curl -X PUT -d "tipo=2" -d "preco=20.5" -d "data='2019-10-08'" -d "id_sala=1" -d "id_filme=1" -d "id_compra=1" -d "id_horario=1" -d "id_assento=1" http://localhost:3000/ingressos/id_ingresso
```

### Deletar um ingresso
Troque <code>id_ingresso</code> pelo id desejado.
``` shell
curl -X PUT -d "tipo=2" -d "preco=20.5" -d "data='2019-10-08'" -d "id_sala=1" -d "id_filme=1" -d "id_compra=1" -d "id_horario=1" -d "id_assento=1" http://localhost:3000/ingressos/id_ingresso
```