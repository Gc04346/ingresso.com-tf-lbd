-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-alpha
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.cinema | type: TABLE --
-- DROP TABLE IF EXISTS public.cinema CASCADE;
CREATE TABLE public.cinema(
	id serial NOT NULL,
	nome varchar,
	companhia varchar,
	endereco varchar,
	cidade varchar,
	CONSTRAINT cinema_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.cinema OWNER TO postgres;
-- ddl-end --

-- object: public.horario | type: TABLE --
-- DROP TABLE IF EXISTS public.horario CASCADE;
CREATE TABLE public.horario(
	id_horario serial NOT NULL,
	inicio date,
	duracao smallint,
	id_padrao_horario_padrao_horario integer,
	CONSTRAINT horario_pk PRIMARY KEY (id_horario)

);
-- ddl-end --
ALTER TABLE public.horario OWNER TO postgres;
-- ddl-end --

-- object: public.padrao_horario | type: TABLE --
-- DROP TABLE IF EXISTS public.padrao_horario CASCADE;
CREATE TABLE public.padrao_horario(
	id_padrao_horario serial NOT NULL,
	codigo smallint,
	CONSTRAINT padrao_horario_pk PRIMARY KEY (id_padrao_horario)

);
-- ddl-end --
ALTER TABLE public.padrao_horario OWNER TO postgres;
-- ddl-end --

-- object: public.sala | type: TABLE --
-- DROP TABLE IF EXISTS public.sala CASCADE;
CREATE TABLE public.sala(
	id_sala serial NOT NULL,
	numero smallint,
	id_cinema integer,
	id_padrao_horario_padrao_horario integer,
	id_padrao_assento_padrao_assento integer,
	id_filme_filme integer,
	CONSTRAINT sala_pk PRIMARY KEY (id_sala)

);
-- ddl-end --
ALTER TABLE public.sala OWNER TO postgres;
-- ddl-end --

-- object: public.ingresso | type: TABLE --
-- DROP TABLE IF EXISTS public.ingresso CASCADE;
CREATE TABLE public.ingresso(
	id_ingresso serial NOT NULL,
	tipo smallint,
	preco double precision,
	data date,
	id_sala_sala integer,
	id_filme_filme integer,
	id_compra_compra integer,
	CONSTRAINT ingresso_pk PRIMARY KEY (id_ingresso)

);
-- ddl-end --
ALTER TABLE public.ingresso OWNER TO postgres;
-- ddl-end --

-- object: public.compra | type: TABLE --
-- DROP TABLE IF EXISTS public.compra CASCADE;
CREATE TABLE public.compra(
	id_compra serial NOT NULL,
	taxa_servico double precision,
	total double precision,
	id_cliente_cliente integer,
	CONSTRAINT compra_pk PRIMARY KEY (id_compra)

);
-- ddl-end --
ALTER TABLE public.compra OWNER TO postgres;
-- ddl-end --

-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente(
	id_cliente serial NOT NULL,
	cpf smallint,
	nome varchar,
	endereco varchar,
	CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)

);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO postgres;
-- ddl-end --

-- object: public.cartao | type: TABLE --
-- DROP TABLE IF EXISTS public.cartao CASCADE;
CREATE TABLE public.cartao(
	id_cartao serial NOT NULL,
	numero smallint,
	titular varchar,
	data_vencimento date,
	id_cliente_cliente integer,
	CONSTRAINT cartao_pk PRIMARY KEY (id_cartao)

);
-- ddl-end --
ALTER TABLE public.cartao OWNER TO postgres;
-- ddl-end --

-- object: public.filme | type: TABLE --
-- DROP TABLE IF EXISTS public.filme CASCADE;
CREATE TABLE public.filme(
	id_filme serial NOT NULL,
	titulo varchar,
	duracao smallint,
	genero varchar,
	classificacao smallint,
	sinopse varchar,
	CONSTRAINT filme_pk PRIMARY KEY (id_filme)

);
-- ddl-end --
ALTER TABLE public.filme OWNER TO postgres;
-- ddl-end --

-- object: public.padrao_assento | type: TABLE --
-- DROP TABLE IF EXISTS public.padrao_assento CASCADE;
CREATE TABLE public.padrao_assento(
	id_padrao_assento serial NOT NULL,
	codigo smallint,
	CONSTRAINT padrao_assento_pk PRIMARY KEY (id_padrao_assento)

);
-- ddl-end --
ALTER TABLE public.padrao_assento OWNER TO postgres;
-- ddl-end --

-- object: public.assento | type: TABLE --
-- DROP TABLE IF EXISTS public.assento CASCADE;
CREATE TABLE public.assento(
	id_assento serial NOT NULL,
	numero smallint,
	fileira char,
	tipo smallint,
	ocupacao bool,
	id_padrao_assento_padrao_assento integer,
	CONSTRAINT assento_pk PRIMARY KEY (id_assento)

);
-- ddl-end --
ALTER TABLE public.assento OWNER TO postgres;
-- ddl-end --

-- object: cinema_fk | type: CONSTRAINT --
-- ALTER TABLE public.sala DROP CONSTRAINT IF EXISTS cinema_fk CASCADE;
ALTER TABLE public.sala ADD CONSTRAINT cinema_fk FOREIGN KEY (id_cinema)
REFERENCES public.cinema (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: padrao_horario_fk | type: CONSTRAINT --
-- ALTER TABLE public.sala DROP CONSTRAINT IF EXISTS padrao_horario_fk CASCADE;
ALTER TABLE public.sala ADD CONSTRAINT padrao_horario_fk FOREIGN KEY (id_padrao_horario_padrao_horario)
REFERENCES public.padrao_horario (id_padrao_horario) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: padrao_horario_fk | type: CONSTRAINT --
-- ALTER TABLE public.horario DROP CONSTRAINT IF EXISTS padrao_horario_fk CASCADE;
ALTER TABLE public.horario ADD CONSTRAINT padrao_horario_fk FOREIGN KEY (id_padrao_horario_padrao_horario)
REFERENCES public.padrao_horario (id_padrao_horario) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: padrao_assento_fk | type: CONSTRAINT --
-- ALTER TABLE public.sala DROP CONSTRAINT IF EXISTS padrao_assento_fk CASCADE;
ALTER TABLE public.sala ADD CONSTRAINT padrao_assento_fk FOREIGN KEY (id_padrao_assento_padrao_assento)
REFERENCES public.padrao_assento (id_padrao_assento) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: padrao_assento_fk | type: CONSTRAINT --
-- ALTER TABLE public.assento DROP CONSTRAINT IF EXISTS padrao_assento_fk CASCADE;
ALTER TABLE public.assento ADD CONSTRAINT padrao_assento_fk FOREIGN KEY (id_padrao_assento_padrao_assento)
REFERENCES public.padrao_assento (id_padrao_assento) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: filme_fk | type: CONSTRAINT --
-- ALTER TABLE public.sala DROP CONSTRAINT IF EXISTS filme_fk CASCADE;
ALTER TABLE public.sala ADD CONSTRAINT filme_fk FOREIGN KEY (id_filme_filme)
REFERENCES public.filme (id_filme) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sala_fk | type: CONSTRAINT --
-- ALTER TABLE public.ingresso DROP CONSTRAINT IF EXISTS sala_fk CASCADE;
ALTER TABLE public.ingresso ADD CONSTRAINT sala_fk FOREIGN KEY (id_sala_sala)
REFERENCES public.sala (id_sala) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: filme_fk | type: CONSTRAINT --
-- ALTER TABLE public.ingresso DROP CONSTRAINT IF EXISTS filme_fk CASCADE;
ALTER TABLE public.ingresso ADD CONSTRAINT filme_fk FOREIGN KEY (id_filme_filme)
REFERENCES public.filme (id_filme) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: compra_fk | type: CONSTRAINT --
-- ALTER TABLE public.ingresso DROP CONSTRAINT IF EXISTS compra_fk CASCADE;
ALTER TABLE public.ingresso ADD CONSTRAINT compra_fk FOREIGN KEY (id_compra_compra)
REFERENCES public.compra (id_compra) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.compra DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.compra ADD CONSTRAINT cliente_fk FOREIGN KEY (id_cliente_cliente)
REFERENCES public.cliente (id_cliente) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cliente_fk | type: CONSTRAINT --
-- ALTER TABLE public.cartao DROP CONSTRAINT IF EXISTS cliente_fk CASCADE;
ALTER TABLE public.cartao ADD CONSTRAINT cliente_fk FOREIGN KEY (id_cliente_cliente)
REFERENCES public.cliente (id_cliente) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


