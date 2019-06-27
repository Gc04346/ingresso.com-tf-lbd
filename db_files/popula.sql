-- Script básico para popular o banco.
insert into padrao_horario (codigo) values (1);
insert into horario (inicio, duracao, id_padrao_horario) values ('2019-10-08', 2, 1);
insert into padrao_assento (codigo) values (1);
insert into assento (numero, fileira, tipo, ocupacao, id_padrao_assento) values (1, 'A', 1, False, 1);
insert into cinema (nome, companhia, endereco, cidade) values ('Cinemão', 'Vale Tudo', 'Rua João Paulo', 'Cidadizinha');
insert into filme (titulo, duracao, genero, classificacao, sinopse) values ('O grande filme', 2, 'Aventura', 18, 'A grande luta dos filmes hehe.');
insert into cliente (cpf, nome, endereco) values (12345, 'Bacana da Silva', 'Rua Lugar Nenhum');
insert into compra (taxa_servico, total, id_cliente) values (0.5, 10.50, 1);
insert into sala (numero, id_cinema, id_padrao_horario, id_padrao_assento, id_filme) values (1, 1, 1, 1, 1);
insert into ingresso (tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento) values (1, 11.50, '2019-10-08', 1, 1, 1, 1, 1);
insert into ingresso (tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento) values (1, 12.50, '2019-10-08', 1, 1, 1, 1, 1);
insert into ingresso (tipo, preco, data, id_sala, id_filme, id_compra, id_horario, id_assento) values (2, 13.50, '2019-10-08', 1, 1, 1, 1, 1);		