drop database if exists tipos_joins;


create database tipo_joins;

use tipo_joins;

create table cores (
    id int auto_increment,
    cor varchar(50),
    primary key (id)
);

create table frutas (
    id int auto_increment primary key,
    fruta varchar(50)
);

create table cores_frutas (
   frutas_id int not null,
   cores_id int not null,
   primary key(frutas_id, cores_id),
   constraint fk_cores_frutas_cores
       foreign key (cores_id)
       references cores(id),
   constraint fk_cores_frutas
       foreign key (frutas_id)
       references frutas (id)
 );
 
INSERT INTO tipo_joins.cores (cor) values
('vermelho'),
('amarelo'),
('verde');


select id, cor from cores c;

insert frutas (fruta) values 
('maçã'),
('banana'),
('maracuja'),
('jaca'),
('pitaya'),
('goiaba');

select id, fruta from frutas f;


/* Cross join  é um tipo especial de junçao em que cada linha de uma tabela é combinada
 * com todas as linhas de outra tabela. isso resulta em um rpoduto cartesiano entre
 * as duas tabelas, ou seja, todas as combinaçoes possiveis de linhas são produzidas.
 * Por exemplo: temos duas tabelas uma chamada cores e outra chamada frutas,
 * e queremos encontrar todas as combinações possiveis de cores e fruta. */
  select c.id, c.cor, f.id, f.fruta from cores c cross join frutas f;
 select frutas_id, cores_id from cores_frutas cf;
 insert into cores_frutas (cores_id, frutas_id)
 select c.id as cores_id, f.id as frutas_id from cores c cross join frutas f;

create table clientes(
   id int,
   nome varchar(50),
   primary key (id)
);

create table pedidos (
   id int,
   clientes_id int,
   data_pedido date,
   primary key(id),
   constraint fk_pedidos_clientes
      foreign key (clientes_id)
      references clientes(id)
);

insert into clientes (id, nome) values
(1, 'joao'),
(2, 'emilly'),
(3, 'henrique'),
(4, 'guilherme'),
(5, 'ana'),
(6, 'gabi');

insert into pedidos (id, clientes_id, data_pedido)values
(101, 1, '2024-03-01'),
(102, 1, '2024-03-05'),
(103, 2, '2024-03-02'),
(104, 3, '2024-03-03'),
(105, 3, '2024-03-07'),
(106, 4, '2024-03-06'),
(107, 2, '2024-03-08'),
(108, 5, '2024-03-09'),
(109, 5, '2024-03-10');

insert into pedidos (id, data_pedido)values (110, '2024-03-11');

select id, nome from clientes;
select id, clientes_id, data_pedido from pedidos;



/* INNER join retorna  registros quando há pelo menos uma correspondencia em ambas as tabelas*/
select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
  from clientes c
  inner join pedidos p on c.id = p.clientes_id;
 /* neste exemplo, estamos selecionando todas as colunas das tabelas (clientes e pedido)
  * onde ha uma correspondencia entre o id na tabela clientes e o cliente_id na tabela periodos */
 
 
 
 /* LEFT join: retorna todos os registros da tabela da esquerda (primaeira tabela mencionada) e os registros correspondentes da tabela
  * da direita(segunda tabela mencionada) */
  select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
  from clientes c
  left join pedidos p on c.id = p.clientes_id;
 /* aqui, estamos selecionando todos os registros da tabela clientes e os registros
  * correspondentes da tabela pedidos, se houver, com base na correspondencia de id e cliente_id */

 
 
 
 /* RIGHT join:retorna todos os registros da tabela da direita (segunda tabela mencionada) e os registros correspondentes
 da tabela da esquerda (primeira tabela mecioada)*/
 select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
  from clientes c
  right join pedidos p on c.id = p.clientes_id;
 /* este comanda retorna todos os registros da tabela pedidos e os correspondentes da tabela clientes, se houver,
  *  com base na correspondencia de id e cliente_id */
 
 
 
 
 
 
 
 
 
 
 