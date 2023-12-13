create database pizzaria;

use pizzaria;

create table usuarios
(
id_usuario integer primary key,
nome_usuario varchar(50),
email varchar(50),
senha varchar(50),
cpf numeric (11),
telefone numeric (11),
id_endereco integer
);

ALTER TABLE usuarios
ADD CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco);

insert into usuarios (id_usuario, nome_usuario, email, senha, telefone, cpf, id_endereco) values
(1, 'Ricardo Borges', 'ricardo123@hotmail.com', 'ricardo123', 11991465028, 839410248381, 1),
(2, 'Rebeca Tomaz', 'rebeca123@hotmail.com', 'rebeca123', 11991934385, 09294732840, 2),
(3, 'Gustava de Campos', 'campos123@hotmail.com', 'campos123', 11995927540, 69210948211, 3),
(4, 'Vitoria Cardoso', 'vitoria123@hotmail.com', 'vitoria123', 11992948295, 33946013407, 4),
(5, 'Pedro Pedraga', 'pedrinho123@hotmail.com', 'fofo123', 11996941037, 19305382955, 5);

create table enderecos
(
id_endereco integer primary key,
cep numeric(8) not null,
rua varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(25) not null, 
estado varchar(25)not null
);

insert into endereco (id_endereco, cep, rua, bairro, cidade, estado) values
(1, 77064713, 'Rua P 9', 'Setor Bela Vista (Taquaralto)', 'Palmas', 'Tocantins'),
(2, 58303040, 'Rua Paulino Bastos', 'Municípios', 'Santa Rita', 'Paraíba'),
(3, 58075475, 'Rua Maria Augusta de Queiroz', 'Ernesto Geisel', 'João Pessoa', 'Paraíba'),
(4, 41410050, 'Estrada do Bonsucesso', 'Barragem de Ipitanga', 'Salvador', 'Bahia'),
(5, 57071824, '5ª Travessa da Alegria', 'Clima Bom', 'Maceió', 'Alagoas');

create table categorias
(
id_categoria integer primary key,
nome_categoria varchar(25) not null
);

insert into categorias (id_categoria, nome_categoria) values
(1, 'Pizzas salgadas'),
(2, 'Pizzas doces'),
(3, 'Frutas'),
(4, 'Bebidas'),
(5, 'Sobremesas');

create table produtos
(
id_produto integer primary key,
nomeProduto varchar(50) not null,
preco double,
descricao varchar(100) not null,
avaliacao_geral double,
id_categoria integer,
id_comentario integer,

foreign key (id_categoria) references categorias (id_categoria)
);

ALTER TABLE usuarios
ADD CONSTRAINT id_comentario FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario);

insert into produtos (id_produto, nomeProduto, preco, descricao, avaliacao_geral, id_categoria, id_comentario) values
(1, 'Pizza de frango com catupiry', 29.99, 'A pizza de frango com Catupiry é uma combinação deliciosa e popular. Feita com massa crocante, molho de tomate, frango temperado e o cremoso queijo Catupiry, essa pizza oferece uma explosão de sabores marcantes e textura aveludada. É uma opção irresistível que agrada aos amantes de pizza, ideal para quem busca uma experiência gastronômica única.', 4.4, 1, 1);

create table comentarios
(
id_comentario integer primary key,
id_usuario integer,
comentario varchar(150),
avaliacao numeric(5) not null,
data_comentario date,

foreign key (id_usuario) references usuarios (id_usuario)
);

insert into comentarios (id_comentario, id_usuario, comentario, avaliacao, data_comentario) values
(1, 1, 'Pizza excelente!!', 5, '2023-07-02'),
(2, 2, 'O único problema era a borda meio queimada, de resto tava uma delícia!', 3, '2023-10-17'),
(3, 3, 'Essa sobremesa tava horrivel', 1, '2023-04-04'),
(4, 4, 'A pizza de M&M veio com pouco M&M!', 4, '2023-12-4'),
(5, 5, 'Tava ok', 3, '2023-01-29')


