use db_cvv;

create table t_estados (
	id_estado int identity primary key,
	estado varchar (50) not null,
	sigla char (2),
)

create table t_cidades (
	id_cidade int identity primary key,
	id_estado int,
	cidade varchar (100) not null,
	constraint fk_id_estado foreign key (id_estado) references t_estados (id_estado)
)

insert into t_estados values ('São Paulo', 'SP');
insert into t_estados values ('Amapá', 'AP');
insert into t_estados values ('Ceará', 'CE');
insert into t_estados values ('Espírito Santo', 'ES');
insert into t_estados values ('Goiás', 'GO');
insert into t_estados values ('Minas Gerais', 'MG');
insert into t_estados values ('Rio de Janeiro', 'RJ');
insert into t_estados values ('Rio Grande do Sul', 'RS');

insert into t_cidades values (1, 'São Paulo');
insert into t_cidades values (1, 'Osasco');
insert into t_cidades values (1, 'Barueri');
insert into t_cidades values (2, 'Macapa');
insert into t_cidades values (3, 'Fortaleza');
insert into t_cidades values (4, 'Santa Catarina');
insert into t_cidades values (5, 'Goiania');
insert into t_cidades values (6, 'Belo Horizonte');
insert into t_cidades values (7, 'Rio de Janeiro');
insert into t_cidades values (8, 'Porto Alegre');

select e.sigla, c.cidade from t_estados as e, t_cidades as c where e.id_estado = 1 and c.id_estado = 1;
