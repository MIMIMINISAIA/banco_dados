drop database if exists escola;

create database escola;

use escola;

create table alunos (
	id int not null auto_increment,
	nome varchar(100) not null,
	numero_identificacao varchar(45) not null unique,
	dt_nascimento date not null,
	endereco varchar(100)not null,
	primary key(id)
);

create table professores (
    id int not null auto_increment,
    nome varchar(100) not null,
    nu_indentificacao varchar(45) not null unique,
    especialidade varchar(100) not null,
    grau_academico varchar(100) not null,
    primary key(id)
);

create table disciplina (
    id int not null auto_increment,
    nome varchar(100) not null,
    codigo varchar(100) not null unique,
    professores_id int not null,
    primary key(id),
    constraint fk_professores_disciplina
		foreign key (professores_id)
		references professores (id)
);

create table notas (
    id int not null auto_increment,
    valor_nota decimal(5,2) not null,
    alunos_id int not null,
    disciplina_id int not null,
    primary key(id),
    constraint fk_alunos_notas
		foreign key (alunos_id)
		references alunos (id),
	constraint fk_disciplina_notas
		foreign key (disciplina_id)
		references disciplina (id)
);

create table interacao(
alunos_id int not null,
disciplina_id int not null,
    constraint fk_alunos_interacao
		foreign key (alunos_id)
		references alunos (id),
	constraint fk_disciplina_interacao
		foreign key (disciplina_id)
		references disciplina (id)
);


INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 1', '1', '1974-02-07', 'rua 1');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 2', '2', '2000-03-04', 'rua 2');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 3', '3', '1994-08-05', 'rua 3');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 4', '4', '2007-05-08', 'rua 4');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 5', '5', '2002-04-04', 'rua 5');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 6', '6', '1986-07-10', 'rua 6');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 7', '7', '1999-04-30', 'rua 7');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 8', '8', '2014-03-20', 'rua 8');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 9', '9', '1989-04-15', 'rua 9');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 10', '10', '1995-12-12', 'rua 10');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 11', '11', '2000-05-20', 'rua 11');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 12', '12', '1998-10-05', 'rua 12');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 13', '13', '1975-04-03', 'rua 13');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 14', '14', '2009-07-12', 'rua 14');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 15', '15', '2006-10-31', 'rua 15');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 16', '16', '2007-05-28', 'rua 16');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 17', '17', '2024-03-04', 'rua 17');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 18', '18', '2006-03-07', 'rua 18');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 19', '19', '2005-12-04', 'rua 19');
INSERT INTO alunos (nome, numero_identificacao, dt_nascimento, endereco) VALUES ('aluno 20', '20', '1998-05-20', 'rua 20');


select id, nome, numero_identificacao , dt_nascimento , endereco  from alunos a ;


INSERT INTO professores  (nome, nu_indentificacao , especialidade , grau_academico) VALUES ('professor 1', '1', 'matematica', '1');
INSERT INTO professores  (nome, nu_indentificacao , especialidade , grau_academico) VALUES ('professor 2', '2', 'portugues', '2');
INSERT INTO professores  (nome, nu_indentificacao , especialidade , grau_academico) VALUES ('professor 3', '3', 'ingles', '3');

select * from professores p;


insert into disciplina (nome, codigo, professores_id) values ('matematica', '1', 1);
insert into disciplina (nome, codigo, professores_id) values ('fisica', '2', 2);
insert into disciplina (nome, codigo, professores_id) values ('biologia', '3', 3);
insert into disciplina (nome, codigo, professores_id) values ('quimica', '4',2 );
insert into disciplina (nome, codigo, professores_id) values ('ciencias', '5',1);
insert into disciplina (nome, codigo, professores_id) values ('historia', '6',2);


select * from disciplina d;

insert into  notas (valor_nota, alunos_id, disciplina_id)values
(10.00, 1, 1),
(9.00, 2, 1),
(8.00, 3, 1),
(7.00, 4, 1),
(6.00, 5, 1),
(5.00, 6, 1),
(4.00, 7, 1),
(3.00, 8, 1),
(2.00, 9, 1),
(1.00, 10,1),
(10.00, 11, 1),
(9.00, 12, 1),
(8.00, 13, 1),
(7.00, 14, 1),
(6.00, 15, 1),
(5.00, 16, 1),
(4.00, 17, 1),
(3.00, 18, 1),
(2.00, 19, 1),
(1.00, 20, 1),

(10.00, 1, 2),
(9.00, 2, 2),
(8.00, 3, 2),
(7.00, 4, 2),
(6.00, 5, 2),
(5.00, 6, 2),
(4.00, 7, 2),
(3.00, 8, 2),
(2.00, 9, 2),
(1.00, 10,2),
(10.00, 11, 2),
(9.00, 12, 2),
(8.00, 13, 2),
(7.00, 14, 2),
(6.00, 15, 2),
(5.00, 16, 2),
(4.00, 17, 2),
(3.00, 18, 2),
(2.00, 19, 2),
(1.00, 20, 2),

(10.00, 1, 3),
(9.00, 2, 3),
(8.00, 3, 3),
(7.00, 4, 3),
(6.00, 5, 3),
(5.00, 6, 3),
(4.00, 7, 3),
(3.00, 8, 3),
(2.00, 9, 3),
(1.00, 10,3),
(10.00, 11, 3),
(9.00, 12, 3),
(8.00, 13, 3),
(7.00, 14, 3),
(6.00, 15, 3),
(5.00, 16, 3),
(4.00, 17, 3),
(3.00, 18, 3),
(2.00, 19, 3),
(1.00, 20, 3),
 
(10.00, 1, 4),
(9.00, 2, 4),
(8.00, 3, 4),
(7.00, 4, 4),
(6.00, 5, 4),
(5.00, 6, 4),
(4.00, 7, 4),
(3.00, 8, 4),
(2.00, 9, 4),
(1.00, 10,4),
(10.00, 11, 4),
(9.00, 12, 4),
(8.00, 13, 4),
(7.00, 14, 4),
(6.00, 15, 4),
(5.00, 16, 4),
(4.00, 17, 4),
(3.00, 18, 4),
(2.00, 19, 4),
(1.00, 20, 4),

(10.00, 1, 5),
(9.00, 2, 5),
(8.00, 3, 5),
(7.00, 4, 5),
(6.00, 5, 5),
(5.00, 6, 5),
(4.00, 7, 5),
(3.00, 8, 5),
(2.00, 9, 5),
(1.00, 10,5),
(10.00, 11, 5),
(9.00, 12, 5),
(8.00, 13, 5),
(7.00, 14, 5),
(6.00, 15, 5),
(5.00, 16, 5),
(4.00, 17, 5),
(3.00, 18, 5),
(2.00, 19, 5),
(1.00, 20, 5),

(10.00, 1, 6),
(9.00, 2, 6),
(8.00, 3, 6),
(7.00, 4, 6),
(6.00, 5, 6),
(5.00, 6, 6),
(4.00, 7, 6),
(3.00, 8, 6),
(2.00, 9, 6),
(1.00, 10,6),
(10.00, 11, 6),
(9.00, 12, 6),
(8.00, 13, 6),
(7.00, 14, 6),
(6.00, 15, 6),
(5.00, 16, 6),
(4.00, 17, 6),
(3.00, 18, 6),
(2.00, 19, 6),
(1.00, 20, 6);


-- exercicio 1

select a.id, a.nome, d.id, d.nome from alunos a cross join disciplina d; 
select disciplina_id, alunos_id from interacao  i;
insert into interacao  (alunos_id, disciplina_id)
select a.id as alunos_id, d.id as disciplina_id from alunos a cross join disciplina d;

-- exercico 2

select a.id, a.nome, d.nome  from alunos a 
inner join interacao i on a.id = i.alunos_id
inner join disciplina d on d.id = i.disciplina_id
where d.nome = 'matematica';

-- exercicio 3

select p.id, p.nome, d.nome  from professores p  
inner join disciplina d  on p.id = d.professores_id
where d.nome = 'matematica';

-- exercicio 4

select n.valor_nota, a.nome , d.id,   d.nome  from notas n 
inner join alunos a  on a.id = n.alunos_id
inner join disciplina d on d.id = n.disciplina_id
where d.nome = 'matematica';


-- exercício 5

select n.valor_nota, a.nome, d.nome, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.valor_nota >= 7;

-- exercício 6

select n.valor_nota, a.nome, d.nome, d.codigo, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.valor_nota >= 7 and d.nome = 'fisica';


-- exercício 7

select n.valor_nota, a.nome, d.nome, d.codigo, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.valor_nota >2 and d.nome = 'matematica';

-- exercicio 8

select n.valor_nota, a.nome, d.nome, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.valor_nota < 7;

-- exercício 9

select a.nome, a.dt_nascimento from alunos a 
where a.dt_nascimento > '2005-02-09';


-- exercício 10

select a.nome as alunos, d.nome as disciplina, n.valor_nota from notas n 
left join alunos a on a.id = n.alunos_id
left join disciplina d on d.id = n.disciplina_id where isnull(n.valor_nota);

-- exercicio 11
select a.nome as alunos, d.nome as disciplina from alunos a
inner join interacao i on a.id = i.alunos_id 
inner join disciplina d on i.disciplina_id = d.id 
where d.nome = 'matematica';

-- exercicio 12
select a.nome as alunos, p.nome as profressores, p.grau_academico, d.nome as disciplina 
from alunos a
inner join interacao i on a.id = i.alunos_id 
inner join disciplina d on i.disciplina_id = d.id 
inner join professores p on d.professores_id = p.id 
where p.grau_academico = '1';

-- exercicio 13
select d.nome as displina_nome, p.nome as professor_nome 
from disciplina d 
left join professores p on d.professores_id = p.id;



-- exercicio 14
select count(*) as total_alunos_ma from alunos a 
inner join interacao i on a.id = i.alunos_id
inner join disciplina d on i.disciplina_id = d.id
where d.nome = 'matematica';


-- exercicio 15

select sum(valor_nota) as soma
     from notas n
     inner join disciplina d on n.disciplina_id = d.id 
     where nome = 'fisica';


-- exercicio 16

select max(valor_nota) as maior_valor 
      from notas n
      inner join disciplina d on n.disciplina_id = d.id 
      where nome = 'historia' ;
     
-- exercicio 17
select min(valor_nota) as menor_valor 
     from notas n
     inner join disciplina d on n.disciplina_id = d.id 
     where nome = 'quimica';
    
-- exercico 18
select avg(valor_nota) as nota_media 
     from notas n
     inner join disciplina d on n.disciplina_id = d.id 
     where nome = 'biologia';
    
-- exercicio 19
select d.nome as disciplina, count(a.id) as numero_de_alunos
from disciplina d 
join interacao i on d.id = i.disciplina_id
join alunos a on i.alunos_id = a.id
group by d.nome;
    


-- exercicio 20 
select sum(valor_nota) as soma from notas;

-- exercicio 21
select max(valor_nota) as maior_valor from notas ;

-- exercico 22
select min(valor_nota) as menor_valor from notas;

-- exercicio 23
select avg(valor_nota) as nota_media from notas;


-- exercicio 24
select d.nome AS Disciplina, avg(n.valor_nota) AS Media_Notas
from disciplina d
inner join notas n ON d.id = n.disciplina_id
group by d.nome;

-- exercicio 25
select d.nome AS disciplina,a.nome as aluno,avg(n.valor_nota) as media
from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by d.nome, a.nome
order by d.nome , a.nome ;

-- exercicio 26
select d.nome  AS disciplina ,a.nome as aluno,avg(n.valor_nota) as media
from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by d.nome, a.nome
order by d.nome asc , media desc;

-- exercicio 27
select alunos_id, valor_nota,a.nome  
from notas n
inner join disciplina d on n.disciplina_id = d.id 
inner join alunos a on n.alunos_id = a.id 
where d.nome = 'historia'
order by valor_nota limit 5;

-- exercicio 28
select a.nome as aluno,avg(n.valor_nota) as media from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
where d.nome = 'Química'
group by a.nome 
order by media desc limit 3;

-- exercicio 29
select a.nome as aluno,avg(n.valor_nota) as media from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by a.nome 
order by media desc limit 10;

-- exercicio 30
select count(distinct  a.id) AS numero_de_alunos_ativos from alunos a
inner join interacao i ON a.id = i.alunos_id;





























