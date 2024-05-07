drop database if exists escola;

create database if not exists escola;

use escola;

create table alunos(
   id int auto_increment ,
   nome varchar(60),
   idade int,
   primary key(id)
);


insert into alunos (nome, idade) values 
('joao', 20 ),
('maria', 22),
('carlos', 19);

select * from alunos; 

-- View
-- view é uma representação virtual de uma tabela, baseada em uma consulta sql.
-- ela permite simplificar consultas complexas e reutilizar a logica de consulta
-- create view <nome> as <pesquisa>
create view alunosMaioresDe20 as
select nome, idade from alunos 
where idade > 20;

alter view alunosmaioresde20 as
select nome, idade, year(now())- idade as ano_nascimento from alunos a
where idade > 20;

select * from alunosmaioresde20;


-- function
-- são blocos de codigos reutilizaveis que realizam uma tarefa especifica
-- pode se usa las para simplificar consultas, calculos ou manipulação de dados
Delimiter //
create function calculaMediaIdade()
returns decimal(5,2)
begin
	   declare media decimal(5,2);
	   select avg(idade) into media from alunos;
	   return media;
end//
delimiter ;

select calculaMediaIdade() as mediaIdade;
select id, nome, idade, calculaMediaIdade() as mediaIdade from alunos;

delimiter //
create function calcular_idade(data_nascimento date)
returns int 
begin
	declare idade int;
    declare data_atual date;
    set data_atual = curdate();
    set idade = year(data_atual) - year(data_nascimento);
   if month(data_atual) < month(data_nascimento) or (
       month(data_atual) = month(data_nascimento) and 
       day (data_atual)< day(data_nascimento)
     )then 
     set idade = idade - 1;
    end if;
    return idade;
end//
delimiter ;

select calcular_idade('2007-05-08');

-- procedure
-- procedimento são conjuntos de instruções sql armazenados no banco de dados.
-- eles podem aceitar parametros e executar uma serie de comandos
delimiter //
create procedure adicionaAluno(X_nome varchar(50), x_idade int)
begin
	insert into alunos (nome, idade) values (X_nome, x_idade);
end//
delimiter ;

call adicionaAluno('Ana', 30);
-- diferença entre function e prodecure
-- function -> retorna um valor
-- prodecure -> nao retorna um valor di

select * from alunos a ;

































