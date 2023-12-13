create database bd_lojafpoo;

use lojafpoo;

create table produtos
(
	id integer auto_increment not null primary key,
    qnt_disponivel integer,
    preco numeric,
    nome varchar(100),
    fornecedor varchar(100),
	tamanho numeric,
    cor varchar(100), 
    bluetooth boolean,
    ram integer,
    memoria integer,
    nucleos integer
);

create table clientes 
(
	id integer auto_increment not null primary key,
    idade integer,
    cpg bigint,
    nome varchar(100),
    email varchar(100)
);

create table vendas
(
	id integer auto_increment not null primary key,
    id_cliente integer not null,
    id_produto integer not null,
    
    foreign key (id_cliente) references clientes(id),
    foreign key (id_produto) references produtos(id)
);

INSERT INTO produtos (qnt_disponivel, preco, nome, fornecedor, ram, memoria, nucleos) values
(
	2, 10, "Monitor", "Samsung", 16, 128, 2
);

select * from produtos where ram is not null;