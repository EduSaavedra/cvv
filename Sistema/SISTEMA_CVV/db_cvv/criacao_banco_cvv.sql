--asp repeater c# para imprimir a carteira em cubos

set language portuguese;

use master;

drop database db_cvv;

create database db_cvv;

use db_cvv;

create table t_modificacoes (
	id_modificacao int identity primary key,
	num_versao varchar (15),
	modificacoes varchar (120),
)

create table t_paciente (
	cartao_sus varchar (17) primary key not null,
	nome_paciente varchar (45),
	nome_mae varchar (45),
	cpf char (14),	
	sexo char (1),
	raca varchar (30),
	rg char (12),
	dt_nasc date,
	pais varchar (50),
	cep char (9) not null,
	uf char (2),
	municipio varchar (50),
	bairro varchar (30),
	endereco varchar (45),
	numero varchar (6),
	complemento varchar (15),
	email varchar (70),
	telefone varchar (14),
	celular varchar (15),
	ctg_zona char (7) not null,
	nacionalidade varchar (30) not null,
	status_paciente char (1) not null,
);

create table t_tipounidadesaude (
	id_tipounidadesaude int primary key identity,
	iniciais varchar (5),
	descricao varchar (50)
);


create table t_unidadesaude (
	id_unidadesaude int identity primary key,
	nome_unidadesaude varchar (70) unique,
	tipo_unidade varchar (5),
	cidade varchar (45),
	cep varchar (9),
	endereco varchar (45),
	numero varchar (45),
	bairro varchar (45),
	estado varchar (45),
	telefone varchar (14),
);

create table t_funcionario (
	coren varchar (12) primary key not null,
	matricula varchar (15) unique not null,
	nome_funcionario varchar (45),
	cpf char (14) not null,
	data_nascimento date,
	pais varchar (45),
	cep char (9),
	endereco varchar (45),
	numero varchar (6),
	complemento varchar (45),
	categoria_funcionario varchar (45),
	tipo_acesso char (1),
	email_funcionario varchar (45),
	status_funcionario char (1),
	estado_atuacao char (2),
	senha varchar (45),
	fk_id_unidadesaude int,
	constraint fk_id_unidadesaude foreign key (fk_id_unidadesaude) references t_unidadesaude (id_unidadesaude),
);

create table t_vacina (
	id_vacina int primary key identity,
	nome_vacina varchar (45) unique,
);

create table t_carteira (
	id_aplicacaovacina int primary key identity,
	data_aplicacao date,
	proxima_aplicacao date,
	dose varchar (30),
	lote_vacina varchar (10),
	fk_cartao_sus varchar (17),
	constraint fk_paciente foreign key (fk_cartao_sus) references t_paciente (cartao_sus),
	fk_coren varchar (12),
	constraint fk_coren foreign key (fk_coren) references t_funcionario (coren),
	fk_id_vacina int,
	foreign key (fk_id_vacina) references t_vacina (id_vacina),
	fk_id_unidadesaude int,
	constraint fk_unidadesaude foreign key (fk_id_unidadesaude) references t_unidadesaude (id_unidadesaude),
);