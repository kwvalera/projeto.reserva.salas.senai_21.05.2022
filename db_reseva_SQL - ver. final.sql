#aula 04 BD - 21/05/2022 - tarefa reserva de sala
#criar bd

create database bd_reserva;
use bd_reserva;

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#criar tabelas
create table turma(
id_turma int not null,
id_matriculap int not null,
quant_alunos int null,
primary key (id_turma));

create table cursos(
id_curso int not null,
id_matriculap int not null,
primary key (id_curso));

create table professor(
id_matriculap int not null,
nome_professor varchar (50) not null,
Cpf varchar (20) not null,
telefone varchar (20) not null, 
primary key (id_matriculap));

create table coordenador(
id_matriculac int not null,
id_matriculap int not null,
nome_coordenador varchar (50) not null,
Cpf varchar (20) not null,
telefone varchar (20) not null,
primary key (id_matriculac));

create table monitor(
id_monitor int not null,
id_matriculac int not null,
nome_monitor varchar (50) not null,
Cpf varchar (20) not null,
telefone varchar (20) not null,
primary key (id_monitor));

create table periodo(
id_periodo int not null,
periodo varchar (15),
primary key (id_periodo));

create table local_(
id_local int not null,
local_1 int not null,
primary key (id_local));

create table laboratorio(
id_lab int not null,
carteiras int not null,
cadeiras int not null,
projetor int not null,
computadores int not null,
primary key (id_lab));

create table sala_de_aula(
id_saladeaula int not null,
carteiras int not null,
cadeiras int not null,
projetor int not null,
computador int not null,
primary key (id_saladeaula));

create table manutencao(
id_relato int not null,
relatorio int not null,
primary key (id_relato));

create table reserva(
cod_reserva int not null,
id_matriculap int not null,
id_curso int not null,
id_periodo int not null,
id_turma int not null,
id_local int not null,
data_ date not null,
primary key (cod_reserva));

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#adicionando as foreign key (chaves estrangeiras)
alter table turma
add constraint fk1_matriculap foreign key (id_matriculap) references professor (id_matriculap);

alter table cursos
add constraint fk2_matriculap foreign key (id_matriculap) references professor (id_matriculap);

#table professor não tem fk

alter table coordenador
add constraint fk3_matriculap foreign key (id_matriculap) references professor (id_matriculap);

alter table monitor
add constraint fk1_matriculac foreign key (id_matriculac) references coordenador (id_matriculac);

#table periodo não tem fk
#table local_ não tem fk

#table laboratorio não tem fk
#table sala_de_aula não tem fk
#table manutencao não tem fk

alter table reserva
add constraint fk4_matriculap foreign key (id_matriculap) references professor (id_matriculap);

alter table reserva
add constraint fk1_curso foreign key (id_curso) references cursos (id_curso);

alter table reserva
add constraint fk1_periodo foreign key (id_periodo) references periodo (id_periodo);

alter table reserva
add constraint fk1_turma foreign key (id_turma) references turma (id_turma);

alter table reserva
add constraint fk1_local foreign key (id_local) references local_ (id_local);

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

/*inserir dados - professor, coordenador, turma, cursos, monitor, periodo, laboratorio,
  sala de aula, local, manutencao, reserva */
  
#inserindo valores table professor
insert into professor (id_matriculap, nome_professor, Cpf, telefone)
values (20848, 'José Roberto', '811.839.799-83', '(41) 99574-3265');
insert into professor (id_matriculap, nome_professor, Cpf, telefone)
values (20849, 'Andy Kim', '653.737.859-11', '(41) 98592-1236');
insert into professor (id_matriculap, nome_professor, Cpf, telefone)
values (20850, 'Andressa Alburquerque', '745.490.599-40', '(41) 98751-2237');
insert into professor (id_matriculap, nome_professor, Cpf, telefone)
values (20851, 'Franciely Linda', '733.990.584-41', '(41) 98761-2238');
insert into professor (id_matriculap, nome_professor, Cpf, telefone)
values (20852, 'Alice Sonza', '743.880.592-40', '(41) 98771-2239');

#inserindo valores table coordenador
insert into coordenador (id_matriculac, id_matriculap, nome_coordenador, Cpf, telefone)
values (30892, 20848, 'Rafael Santini', '153.973.290-88', '(23) 97586-9433');
insert into coordenador (id_matriculac, id_matriculap, nome_coordenador, Cpf, telefone)
values (30893, 20849, 'Raissa Leal', '354.147.990-67', '(41) 98567-9904');
insert into coordenador (id_matriculac, id_matriculap, nome_coordenador, Cpf, telefone)
values (30894, 20850, 'Jimin Park', '356.154.997-33', '(41) 99733-4321');
insert into coordenador (id_matriculac, id_matriculap, nome_coordenador, Cpf, telefone)
values (30895, 20851, 'Luana Luz', '403.233.983-21', '(41) 98893-5493');
insert into coordenador (id_matriculac, id_matriculap, nome_coordenador, Cpf, telefone)
values (30896, 20852, 'Brenda Luysa', '311.121.854-31', '(41) 99566-9932');

#inserindo valores table turma
insert into turma (id_turma, id_matriculap, quant_alunos)
values (10892, 20848, 30);
insert into turma (id_turma, id_matriculap, quant_alunos)
values (10893, 20849, 22);
insert into turma (id_turma, id_matriculap, quant_alunos)
values (10894, 20850, 44);
insert into turma (id_turma, id_matriculap, quant_alunos)
values (10895, 20851, 23);
insert into turma (id_turma, id_matriculap, quant_alunos)
values (10896, 20852, 18);

#inserindo valores table cursos
insert into cursos (id_curso, id_matriculap)
values (04892, 20848);
insert into cursos (id_curso, id_matriculap)
values (04893, 20849);
insert into cursos (id_curso, id_matriculap)
values (04894, 20850);
insert into cursos (id_curso, id_matriculap)
values (04895, 20851);
insert into cursos (id_curso, id_matriculap)
values (04896, 20852);

#inserindo valores table monitor
insert into monitor (id_monitor, id_matriculac, nome_monitor, Cpf, telefone)
values (05892, 30892, 'Lucas Armando', '006.437.039-93', '(41) 99789-6534');
insert into monitor (id_monitor, id_matriculac, nome_monitor, Cpf, telefone)
values (05893, 30893, 'Amanda Rachel', '270.868.559-79', '(41) 98849-1265');
insert into monitor (id_monitor, id_matriculac, nome_monitor, Cpf, telefone)
values (05894, 30894, 'Pablo Zelinski', '320.445.934-80', '(41) 99455-3251');
insert into monitor (id_monitor, id_matriculac, nome_monitor, Cpf, telefone)
values (05895, 30895, 'Frederico Armando', '250.348.239-81', '(41) 98878-2394');
insert into monitor (id_monitor, id_matriculac, nome_monitor, Cpf, telefone)
values (05896, 30896, 'José Real', '769.367.099-82', '(41) 99778-3324');

#inserir valores table periodo
insert into periodo (id_periodo, periodo)
values (06892, 'Manhã');
insert into periodo (id_periodo, periodo)
values (06893, 'Tarde');
insert into periodo (id_periodo, periodo)
values (06894, 'Noite');

#inserir valores table laboratorio
insert into laboratorio (id_lab, carteiras, cadeiras, projetor, computadores)
values (889932, 089935, 079935, 069935, 029935);
insert into laboratorio (id_lab, carteiras, cadeiras, projetor, computadores)
values (889933,	089936,	079936,	069936,	029936);
insert into laboratorio (id_lab, carteiras, cadeiras, projetor, computadores)
values (889934,	089937,	079937,	069937,	029937);
insert into laboratorio (id_lab, carteiras, cadeiras, projetor, computadores)
values (889935,	089938,	079938,	069938,	029938);
insert into laboratorio (id_lab, carteiras, cadeiras, projetor, computadores)
values (889936,	089939,	079939,	069939,	029939);

#inserir valores table sala de aula
insert into sala_de_aula (id_saladeaula, carteiras, cadeiras, projetor, computador)
values (989932, 089932, 079932,	069932,	029932);
insert into sala_de_aula (id_saladeaula, carteiras, cadeiras, projetor, computador)
values (989933, 089933, 079933,	069933,	029933);
insert into sala_de_aula (id_saladeaula, carteiras, cadeiras, projetor, computador)
values (989934, 089934, 079934,	069934,	029934);
insert into sala_de_aula (id_saladeaula, carteiras, cadeiras, projetor, computador)
values (989935, 089935, 079935,	069935,	029935);
insert into sala_de_aula (id_saladeaula, carteiras, cadeiras, projetor, computador)
values (989936, 089936, 079936,	069936,	029936);

#inserir valores table local_ // local_1 corresponde a id_lab ou id_saladeaula
insert into local_ (id_local, local_1)
values (01112,	08892);
insert into local_ (id_local, local_1)
values (01113,	08893);
insert into local_ (id_local, local_1)
values (01114,	08894);
insert into local_ (id_local, local_1)
values (01115,	08895);
insert into local_ (id_local, local_1)
values (01116,	08896);
insert into local_ (id_local, local_1)
values (01117, 989932);
insert into local_ (id_local, local_1)
values (01118, 989933);
insert into local_ (id_local, local_1)
values (01119, 989934);
insert into local_ (id_local, local_1)
values (01120, 989935);
insert into local_ (id_local, local_1)
values (01121, 989936);

#inserindo valores table manutencao
insert into manutencao (id_relato, relatorio)
values (097566,	087566);
insert into manutencao (id_relato, relatorio)
values (097567,	087567);
insert into manutencao (id_relato, relatorio)
values (097568,	087568);
insert into manutencao (id_relato, relatorio)
values (097569,	087569);
insert into manutencao (id_relato, relatorio)
values (097570,	087570);

#inserindo valores reserva (data deve ser sem '/')
insert into reserva (cod_reserva, id_matriculap, id_curso, id_periodo, id_turma, id_local, data_)
values (01892,	20848,	04892,	06892,	10892,	01115,	20220301);
insert into reserva (cod_reserva, id_matriculap, id_curso, id_periodo, id_turma, id_local, data_)
values (01893,	20849,	04893,	06893,	10893,	01116,	20220423);
insert into reserva (cod_reserva, id_matriculap, id_curso, id_periodo, id_turma, id_local, data_)
values (01894,	20850,	04894,	06894,	10894,	01117,	20220630);
insert into reserva (cod_reserva, id_matriculap, id_curso, id_periodo, id_turma, id_local, data_)
values (01895,	20851,	04895,	06892,	10895,	01118,	20220122);
insert into reserva (cod_reserva, id_matriculap, id_curso, id_periodo, id_turma, id_local, data_)
values (01896,	20852,	04896,	06893,	10896,	01119,	20220422);

