---------------------------------------------- Projeto Final - Administração de Banco de Dados ----------------------------------------------------

-- Criação do Banco de Dados

CREATE DATABASE campanha_seguros;

-- Criação das tabelas do Banco

USE campanha_seguros;
CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    cpf VARCHAR(60) NOT NULL,
    telefone VARCHAR(20)
);


CREATE TABLE carro(
    id_carro INT PRIMARY KEY,
    marca VARCHAR(60) NOT NULL,
    cor VARCHAR(40) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    placa VARCHAR(60) NOT NULL,
    cliente INT
);


CREATE TABLE acidente(
    id_acidente INT PRIMARY KEY,
    data_acidente DATE,
    local_acidente VARCHAR(60) NOT NULL,
    obs VARCHAR(60)
);


--Implementação de Relacionamentos

-- Adicionando chave estrangeira na tabela carro

ALTER TABLE carro ADD FOREIGN KEY (cliente) REFERENCES cliente(id_cliente) ON DELETE SET NULL;


-- Criação de uma tabela adicional chamada 'carros_sofrem_acidentes' contendo a relação de carros e acidentes

CREATE TABLE carros_sofrem_acidentes(
    id_carro INT,
    id_acidente INT,
    PRIMARY KEY(id_carro, id_acidente),
    FOREIGN KEY(id_carro) REFERENCES carro(id_carro) ON DELETE CASCADE,
    FOREIGN KEY(id_acidente) REFERENCES acidente(id_acidente) ON DELETE CASCADE
);



-- Populando as Tabelas

INSERT INTO cliente VALUES 
(1, 'José', '78526986332', '+5571975863052'),
(2, 'Maria', '78526977332', '+5571972263052'),
(3, 'Carlos', '78526986112', '+5571695863052'),
(4, 'João', '78526989732', '+5571975863632'),
(5, 'Luiz', '78526984872', '+5571977853052'),
(6, 'Vanessa', '78574986332', '+5571975862552'),
(7, 'Tereza', '78566986332', '+5571972863052'),
(8, 'Vânia', '78578986332', '+5571941863052'),
(9, 'Marcela', '78588986332', '+5571975563052'),
(10, 'Thiago', '78536986332', '+5571975743052');


INSERT INTO carro VALUES
(12,'volkswagen', 'preto','suv', 'bra-3r52', 1),
(13,'fiat', 'prata','compacto', 'ice-2973', 3),
(14,'ford', 'vermelho','esportivo', 'bfq-8663', 2),
(15,'volvo', 'branco','hatch', 'pec-2013', 5),
(16,'audi', 'branco-gelo','sedan', 'hmg-8693', 4),
(17,'jeep', 'preto','suv', 'jsq-7463', 6),
(18,'mercedez-benz', 'azul','esportivo', 'for-1904', 8),
(19,'kia', 'prata','suv', 'jdr-0312', 7),
(20,'hyundai', 'branco','sedan', 'jjk-1960', 10),
(21,'subaru', 'branco','sedan', 'lpt-4625', 9);


INSERT INTO acidente VALUES
(101, '2023-01-24', 'rua do acidente1', 'grave'),
(102, '2023-01-12', 'rua do acidente2', 'leve'),
(103, '2022-12-25', 'rua do acidente3', 'gravissimo'),
(104, '2022-12-13', 'rua do acidente4', 'medio'),
(105, '2020-11-22', 'rua do acidente5', 'medio'),
(106, '2023-01-22', 'rua do acidente6', 'leve'),
(107, '2023-12-22', 'rua do acidente7', 'gravissimo'),
(108, '2022-11-15', 'rua do acidente8', 'leve'),
(109, '2022-11-14', 'rua do acidente9', 'grave'),
(110, '2022-11-14', 'rua do acidente7', 'leve');


INSERT INTO carros_sofrem_acidentes VALUES
(12, 102),
(14, 101),
(13, 104),
(15, 103),
(17, 106),
(16, 105),
(19, 108),
(18, 107),
(20, 110),
(21, 109),
(14, 103),
(19, 101),
(20, 104),
(17, 107);

------------------------------------------- Operações ------------------------------------------------


-- 1 - 

CREATE USER breno@localhost IDENTIFIED BY '12345';
CREATE USER isaias@localhost IDENTIFIED BY '12345';
CREATE USER carmem@localhost IDENTIFIED BY '12345';
CREATE USER yona@localhost IDENTIFIED BY '12345';
CREATE USER ana@localhost IDENTIFIED BY '12345';


-- 2 - 

GRANT SELECT
ON *.*
TO breno@localhost

-- 3 - 

GRANT SELECT ON * TO carmem@localhost;

-- 4 - 

GRANT UPDATE, DELETE, INSERT ON campanha_seguros.* TO isaias@localhost;
GRANT UPDATE, DELETE, INSERT ON campanha_seguros.* TO yona@localhost;
GRANT UPDATE, DELETE, INSERT ON campanha_seguros.* TO ana@localhost;

-- 5 - 

REVOKE DELETE ON campanha_seguros.* FROM isaias@localhost, yona@localhost, ana@localhost;

-- 6 - O backup do banco criado encontra-se numa pasta chamada "insurance_campaign_database" neste diretório

