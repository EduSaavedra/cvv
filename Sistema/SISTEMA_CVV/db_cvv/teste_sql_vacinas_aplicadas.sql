drop database db_cvv_teste;

create database db_cvv_teste;

use db_cvv_teste;

create table t_paciente(
	cartao_sus int primary key,
	nome_paciente varchar (45),
);

create table t_vacinas(
	id_vacina int primary key,
	nome_vacina varchar (45),
);

create table t_vacinasaplicadas(
	id_aplicada int primary key,
	fk_cartao_sus int,
	constraint fk_paciente foreign key (fk_cartao_sus) references t_paciente (cartao_sus),
	fk_id_vacina int,
	constraint fk_vacina foreign key (fk_id_vacina) references t_vacinas (id_vacina),
);

----------------------------------------- SELECT Q TRAZ VACINAS APLICADAS NO PACIENTE 1234
select 
us.nome_unidadesaude, 
f.nome_funcionario, f.coren, f.matricula, 
p.nome_paciente, p.cartao_sus, 
l.data_fabricacao, 
v.nome_vacina, 
c.dose, c.proxima_aplicacao 
from t_unidadesaude as us, t_funcionario as f, 
t_paciente as p, t_vacina as v, t_carteira as c, t_lotevacina as l 
where p.cartao_sus = '1234' and id_vacina = c.fk_id_vacina 
and p.cartao_sus = c.fk_cartao_sus and f.coren = c.fk_coren
and us.id_unidadesaude = c.fk_id_unidadesaude;

--------------------------------------------------------------

insert into t_vacinas values (10, 'antitetanica');
insert into t_vacinas values (20, 'gripe');
insert into t_vacinas values (30, 'febre amarela');
insert into t_vacinas values (40, 'rubeula');
insert into t_vacinas values (50, 'poliomelite');
insert into t_vacinas values (60, 'gotinha');

insert into t_vacinasaplicadas values (001, 1, 10);
insert into t_vacinasaplicadas values (002, 1, 60);
insert into t_vacinasaplicadas values (003, 1, 50);
insert into t_vacinasaplicadas values (004, 2, 10);
insert into t_vacinasaplicadas values (005, 3, 10);
insert into t_vacinasaplicadas values (006, 4, 10);
insert into t_vacinasaplicadas values (007, 2, 20);
insert into t_vacinasaplicadas values (008, 3, 20);
insert into t_vacinasaplicadas values (009, 3, 30);

select * from t_vacinasaplicadas;

select p.nome_paciente, v.nome_vacina from 
t_paciente as p,
t_vacinas as v,
t_vacinasaplicadas as a
where p.cartao_sus = a.fk_cartao_sus and v.id_vacina = fk_id_vacina and p.cartao_sus = 3;



---------------------------------------------------SELECT Q VERIFICA PRA QUAL DOENCA A VACINA SERVE

select d.nome_doenca
from t_vacina as v join t_aplicavel as a on v.id_vacina = a.fk_id_vacina 
join t_doencas as d on a.fk_id_doenca = d.id_doenca
where v.nome_vacina = 'Dupla Tipo adulto (dT)';

-----------------------------------------------------------------------------SELECT CARTERA DE VACINACAO

select us.nome_unidadesaude, 
f.nome_funcionario, f.coren, f.matricula, 
p.nome_paciente, p.cartao_sus,
l.lote,
v.nome_vacina, 
c.dose, c.data_aplicacao, c.proxima_aplicacao
from t_unidadesaude as us, t_funcionario as f, 
t_paciente as p, 
t_vacina as v, 
t_carteira as c, 
t_lotevacina as l 
where p.cartao_sus = 203903315320003
and id_vacina = c.fk_id_vacina 
and p.cartao_sus = c.fk_cartao_sus 
and coren = c.fk_coren;