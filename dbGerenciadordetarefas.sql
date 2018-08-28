use master
go
drop database gerenciadordeTarefa
go

create database gerenciadordeTarefa
go
use gerenciadordeTarefa


create table tb_Pessoas(
	id_pessoa int NOT NULL identity(0,1),
	dsNome varchar(180),
	dsEmail varchar(180),
	dsSexo varchar(1)
	
	PRIMARY KEY(id_pessoa) 
	)

create table tb_Metodologia(
	id_metodologia int NOT NULL identity(0,1),
	dsNome varchar(180),
	PRIMARY KEY(id_metodologia)
)
	

create table tb_Tarefas(
	id_tarefa int NOT NULL identity(0,1),
	dsTitulo varchar(180),
	dtPrazoEst date,
	dsDescricao varchar(180),
	dtInicio date,
	dtFim date,
	id_metodologia int,
	
	primary key(id_tarefa),
	FOREIGN key(id_metodologia) references tb_Metodologia(id_metodologia)
)

create table relTarefaPessoa(
	id_relTaPe int NOT NULL identity(0,1),
	id_pessoa int ,
	id_tarefa int,
	
	PRIMARY KEY(id_relTaPe),
	Foreign key(id_pessoa) references tb_Pessoas(id_pessoa),
	foreign key(id_tarefa) references tb_Tarefas(id_tarefa)
)

insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('Luis','luis@luis','m')
insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('Paloma','paloma@luis','f')
insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('Sarah','sarah@luis','f')
insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('Eduardo','luis@luis','m')
insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('Roger','roger@luis','m')
insert into tb_Pessoas(dsNome,dsEmail,dsSexo) values ('CARLOS','carlor@luis','m')


insert into tb_Metodologia(dsNome) values ('SCRUM')
insert into tb_Metodologia(dsNome) values ('POMODRO')
insert into tb_Metodologia(dsNome) values ('Feyman')

insert into tb_Tarefas(dsTitulo,dsDescricao,dtPrazoEst,dtInicio,dtFim,id_metodologia) 
	values ('Tela de cadsatro','Construir tela de cadastro','2018-08-8','2018-08-01',
			'2018-08-8',0)
insert into tb_Tarefas(dsTitulo,dsDescricao,dtPrazoEst,dtInicio,dtFim,id_metodologia) 
	values ('Tela de login','Construir tela de login','2018-08-8','2018-08-01',
			'2018-08-8',1)
insert into tb_Tarefas(dsTitulo,dsDescricao,dtPrazoEst,dtInicio,dtFim,id_metodologia) 
	values ('Tela de home','Construir tela home','2018-08-8','2018-08-01',
			'2018-08-08',1)
insert into tb_Tarefas(dsTitulo,dsDescricao,dtPrazoEst,dtInicio,dtFim,id_metodologia) 
	values ('Tela de splash','Construir tela de splash','2018-08-8','2018-08-01',
			'2018-08-08',2)
insert into tb_Tarefas(dsTitulo,dsDescricao,dtPrazoEst,dtInicio,dtFim,id_metodologia) 
	values ('Tela de influencia','Construir tela de influencia','2018-08-8','2018-08-01',
			'2018-08-15',0)			

insert into relTarefaPessoa(id_pessoa,id_tarefa) values (0,4)
insert into relTarefaPessoa(id_pessoa,id_tarefa) values (1,3)
insert into relTarefaPessoa(id_pessoa,id_tarefa) values (2,2)
insert into relTarefaPessoa(id_pessoa,id_tarefa) values (3,1)
insert into relTarefaPessoa(id_pessoa,id_tarefa) values (4,0)
insert into relTarefaPessoa(id_pessoa,id_tarefa) values (5,4)

			
/*select * from tb_Pessoas

select * from tb_Metodologia

select * from tb_Tarefas

select * from relTarefaPessoa*/

--Ex 1

select p.id_pessoa, p.dsNome, t.id_tarefa from tb_pessoas as p
left join tb_tarefas as t on p.id_pessoa=t.id_tarefa where id_tarefa is null


--Ex 2

select count (dsNome) as Qtd, dsNome from tb_metodologia group by dsNome order by count(dsNome) desc;

--Ex 3 

--mulheres
select count(1) as Mulheres from tb_tarefas as b left join tb_pessoas as a on b.id_tarefa = a.id_pessoa where dsSexo = 'F';

--Homem
select COUNT(1) as Homens from tb_Tarefas as b left join tb_Pessoas as a on b.id_tarefa = a.id_pessoa where dsSexo = 'm';

--Ex 4
--select p.dsNome, t.dtPrazoEst, t.dtFim from tb_Pessoas as p join relTarefaPessoa as r on p.id_pessoa = r.id_pessoa
--join tb_Tarefas as t on r.id_tarefa = t.id_tarefa where t.dtPrazoEst > t.dtFim;

select p.dsNome, t.dtPrazoEst, t.dtFim from tb_Pessoas as p 
INNER JOIN relTarefaPessoa as r on r.id_pessoa = p.id_pessoa
INNER JOIN tb_Tarefas as t on r.id_tarefa = t.id_tarefa where t.dtPrazoEst < t.dtFim; 

