coren; 	matricula; 	nome; 	categoria; 		tipo_acesso; 	email; 		status; 	estado
123;	123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;
'';		123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;		
456;	123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;
789;	123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;
'';		123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;
012;	123;		joao;	enfermeiro;		3;				f@live.com;	a;			sp;



CREATE OR REPLACE TRIGGER tr_validacao
BEFORE INSERT ON t_funcionarios
FOR EACH ROW

begin

	if (new.id = '' or new.id = 0) then
		insert into tab_logs (coren, mensagem, data) values (new.coren, 'NAO ACEITA ZEROS OU NULOS NO COREN', SYSDATE);
		commit;
		return;
	else if (new.matricula = 0) then	
		insert into tab_logs (coren, mensagem, data) values (new.coren, 'NAO ACEITA ZEROS OU NULOS NA MATRICULA', sysdate);
		commit;
		return;
	end if;	
	

end;