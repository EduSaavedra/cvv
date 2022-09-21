--=============================================================================================================================================

use db_cvv;

select * from t_funcionario;
select * from t_paciente;
select * from t_carteira;
select * from t_vacina;
select * from t_unidadesaude;

sp_help t_unidadesaude;
sp_help t_funcionario;
sp_help t_paciente;
sp_help t_carteira;

-----------------------------------------------------------------------------MODIFICA��ES INSERT

begin transaction
	truncate table t_carteira;
commit

insert into t_modificacoes values ('v0.0.1 (b)', 'Cria��o do sistema com telas para testes.');
insert into t_modificacoes values ('v0.0.2 (b)', 'Finaliza��o da tela de inclus�o de Unidade de Sa�de.');
insert into t_modificacoes values ('v0.0.3 (b)', 'Remo��o da tela de inclus�o de Unidade de Sa�de.');
insert into t_modificacoes values ('v0.0.4 (b)', 'Removida tela de cadastro de paciente.');
insert into t_modificacoes values ('v0.0.5 (b)', 'Removido menu de vacinas e p�ginas de cadastro de vacina, altera��o de vacinas e inclus�o de lote.');
insert into t_modificacoes values ('v0.0.6 (b)', 'Finaliza��o da tela de consulta de unidades de sa�de.');
insert into t_modificacoes values ('v0.0.7 (b)', 'Corre��o de bugs na p�gina de sele��o das unidades de sa�de.');
insert into t_modificacoes values ('v0.0.8 (b)', 'Finaliza��o da tela de consulta de funcion�rios.');
insert into t_modificacoes values ('v0.0.9 (b)', 'Modifica��o da tela de consulta e altera��o de pacientes.');
insert into t_modificacoes values ('v0.1.10 (b)', 'Finaliza��o da tela de consulta e altera��o de pacientes.');
insert into t_modificacoes values ('v0.2.10 (b)', 'Corre��o de bugs da tela de consulta e altera��o de pacientes.');
insert into t_modificacoes values ('v0.3.10 (b)', 'Altera��o dos tipos de dados do banco.');
insert into t_modificacoes values ('v0.4.10 (b)', 'Corre��o de bug da tela de vacina��o.');
insert into t_modificacoes values ('v0.4.10 (b)', 'Finaliza��o da tela de consulta de vacinas aplicadas.');
insert into t_modificacoes values ('v0.5.10 (b)', 'Finaliza��o est�tica do menu.');
insert into t_modificacoes values ('v1.5.10', 'Aplica��o retirada de vers�o beta.');
insert into t_modificacoes values ('v1.5.11', 'Corre��o de bugs na tela de aplica��o de vacinas.');
insert into t_modificacoes values ('v1.6.10', 'Adicionada p�gina para reset de senha.');
insert into t_modificacoes values ('v1.6.12', 'Corre��o de bugs no Master Page.');
insert into t_modificacoes values ('v2.6.12', 'Corre��o de bug na classe de Pacientes.');

truncate table t_modificacoes

-----------------------------------------------------------------------------UNIDADES DE SAUDE INSERT

insert into t_tipounidadesaude values ('AE', 'Ambulat�rio de Especialidades');
insert into t_tipounidadesaude values ('AMA', 'Assist�ncia M�dica Ambulatorial');
insert into t_tipounidadesaude values ('AMB', 'Ambulat�rio');
insert into t_tipounidadesaude values ('AME', 'Ambulat�rio M�dico de Especialidade');
insert into t_tipounidadesaude values ('C S', 'Cento de Sa�de');
insert into t_tipounidadesaude values ('CEN', 'Centro Assistencial');
insert into t_tipounidadesaude values ('CR ', 'Centro de Refer�ncia');
insert into t_tipounidadesaude values ('CRI', 'Centro de Refer�ncia de Imunobiol�gicos');
insert into t_tipounidadesaude values ('CS ', 'Cento de Sa�de');
insert into t_tipounidadesaude values ('CSE', 'Centro de Sa�de Escola');
insert into t_tipounidadesaude values ('HOS', 'Hospital');
insert into t_tipounidadesaude values ('INS', 'Instituto');
insert into t_tipounidadesaude values ('SAE', 'Servi�o de Assist�ncia Especializada');
insert into t_tipounidadesaude values ('SER', 'Servi�os');
insert into t_tipounidadesaude values ('TER', 'Terminal Rodovi�rio');
insert into t_tipounidadesaude values ('UBS', 'Unidade B�sica De Sa�de');
insert into t_tipounidadesaude values ('UPA', 'Unidade de Pronto Atendimento');

-----------------------------------------------------------------------------VACINA INSERT

insert into t_vacina values ('Vacina Teste');

-----------------------------------------------------------------------------APLICACAO VACINA INSERT

insert into t_carteira values (GETDATE(), dateadd(YEAR, 10,getdate()), 'Primeira', '123456', '123', '123', '3', '1');
insert into t_carteira values (GETDATE(), dateadd(YEAR, 10,getdate()), 'Primeira', '102030', '2039033153200031', '321', '', '2');

select * from t_carteira where fk_cartao_sus = '123';

-----------------------------------------------------------------------------UNIDADES INSERT

insert into t_unidadesaude values ('Posto Rio de Janeiro', 'AMA', 'Rio de Janeiro', '01201-45', 'endereco rj', '1254', 'bairro rj', 'RJ', '(11) 1234-5678');
insert into t_unidadesaude values ('Posto Rio Grande do Sul', 'UBS', 'Porto Alegre', '01201-45', 'endereco rgs', '1254', 'bairro porto alegre', 'RS', '(11) 1234-5678');
insert into t_unidadesaude values ('Posto Macapa', 'AME', 'Macapa', '81201-45', 'Endere�o Macapa', 
'1254', 'Bairro Macapa', 'AP', '(96) 2234-5678');

insert into t_unidadesaude values ('Posto Ceara', 'AMA', 'Fortaleza', '91201-45', 
'Endereco Fortaleza', '1254', 'Bairro Fortaleza', 'CE', '(85) 3334-5678');

insert into t_unidadesaude values ('Posto Espirto Santo', 'UBS', 'Vitoria', '21201-45', 'Endereco Vitoria', '1254', 'Bairro Vitoria', 'ES', '(27) 1234-5678');

insert into t_unidadesaude values ('Posto Goi�s', 'UBS', 'Goania', '61201-45', 'Endereco Goania', '1254', 'Bairro Goania', 'GO', '(62) 1234-5678');

insert into t_unidadesaude values ('Posto Minas Gerais', 'AMA', 'Belo Horizonte', '59901-45', 'Endereco Belo Horizonte', '1254', 'Bairro Belo Horizonte', 'MG', '(31) 7234-5678');

insert into t_unidadesaude values ('Posto Minas Gerais', 'AMA', 'Belo Horizonte', '59901-45', 'Endereco Belo Horizonte', '1254', 'Bairro Belo Horizonte', 'MG', '(31) 7234-5678');

-----------------------------------------------------------------------------FUNCIONARIOS INSERT

select *, u.nome_unidadesaude from t_funcionario as f, t_unidadesaude as u where f.coren = '123' and u.id_unidadesaude = 1;

insert into t_funcionario values (
	'123',
	'0101',
	'Jo�o P. da Silva',
	'111.111.111-11',
	'08/08/08',
	'Brasil',
	'05001-100',
	'Rua da Desgra�a',
	'10',
	'Casa 2',
	'T�cnico em Enfermagem',
	'1',
	'teste_func@cvv.com.br',
	'A',
	'SP',
	'123',
	'1'
);

insert into t_funcionario values (
	'102030',
	'03030303',
	'Marcelo Leite de Oliveira',
	'410.603.588-08',
	'06/02/1969',
	'Brasil',
	'05105-020',
	'Rua Doutor Cabral de Vasconcelos',
	'124',
	'',
	'Enfermeiro',
	'1',
	'marceloleite79@gmail.com',
	'I',
	'SP',
	'C@rteira',
	'2'
);
update t_funcionario set status_funcionario = 'A' where coren = '102030'

insert into t_funcionario values (
	'321',
	'0202',
	'Marcos Eduardo Saavedra Cosmo',
	'410.603.588-08',
	'06/02/1994',
	'Brasil',
	'05105-020',
	'Rua Doutor Cabral de Vasconcelos',
	'124',
	'',
	'Enfermeiro',
	'1',
	'marcos.cosmo@cvv.com.br',
	'A',
	'SP',
	'321',
	'2'
);
update t_funcionario set status_funcionario = 'A' where coren = '321'
update t_funcionario set status_funcionario = 'I' where coren = '321'

--mudar a senha para aleat�ria
update t_funcionario set senha = left(NEWID(),8) where coren = 321;

-----------------------------------------------------------------------------PACIENTES INSERT

insert into t_paciente values (
	'123',
	'Jo�o Agripino da Costa Doria Junior',
	'Maria Sylvia Vieira de Moraes Dias',
	'111.111.111-11',
	'M',
	'Branco',
	'11.111.111-X',
	'03/08/1987',
	'Brasil',
	'11111-11',
	'SP',
	'S�o Paulo',
	'Vila Leopoldina',
	'Rua Casa do Caralho',
	'666',
	'Casa 3',
	'paciente.teste@cvv.com.br',
	'',
	'11111-1111',
	'Rural',
	'Brasileiro',
	'A'
);

insert into t_paciente values (
	'2039033153200031',
	'Marcos Eduardo Saavedra Cosmo',
	'Victoria Elizabeth Saavedra Saavedra',
	'410.603.588-08',
	'M',
	'Branco',
	'42.797.800-2',
	'06/02/1994',
	'Brasil',
	'05105-020',
	'SP',
	'S�o Paulo',
	'Vila dos Rem�dios',
	'Rua Doutor Cabral de Vasconcelos',
	'124',
	'Casa 3',
	'marcos.saavedra@live.com',
	'(11) 4305-7596',
	'(11) 96908-2210',
	'Urbana',
	'Brasileiro',
	'A'
);