CREATE DATABASE primeira_aula_SQL_clinica
GO
USE primeira_aula_SQL_clinica

CREATE TABLE Filme (
id              INT										NOT NULL,
titulo          VARCHAR(40)								NOT NULL,
ano             INT           CHECK(ano < 2022)            NULL
PRIMARY KEY (id)
)

CREATE TABLE Estrela (
id          INT            NOT NULL,
nome        VARCHAR(50)    NOT NULL
PRIMARY KEY (id)
)
GO
CREATE TABLE DVD (
num                INT                                        NOT NULL,
data_fabricacao    DATE    CHECK(data_fabricacao < GETDATE()) NOT NULL,
Filmeid            INT										  NOT NULL
PRIMARY KEY (num)
FOREIGN KEY (Filmeid)
    REFERENCES Filme (id)
)
GO
CREATE TABLE Filme_Estrela (
Filmeid          INT     NOT NULL,
Estrelaid        INT     NOT NULL
FOREIGN KEY (Filmeid)
    REFERENCES Filme(id),
FOREIGN KEY (Estrelaid)
    REFERENCES Estrela(id)
)

CREATE TABLE Cliente (
num_cadastro       INT                               NOT NULL,
nome               VARCHAR(70)                       NOT NULL,
logradouro         VARCHAR(150)                      NOT NULL,
num                INT           CHECK(num > 0)      NOT NULL,
CEP                CHAR(8)       CHECK(LEN(CEP) = 8)     NULL
PRIMARY KEY (num_cadastro)
)

CREATE TABLE Locacao (
DVDnum               INT                                              NOT NULL,
Clientenum_cadastro  INT                                              NOT NULL,
data_locacao         DATE        CHECK(data_locacao = GETDATE())      NOT NULL,
data_devolucao       DATE        CHECK(data_locacao < data_devolucao) NOT NULL,
valor                DECIMAL     CHECK(valor > 0)                     NOT NULL
PRIMARY KEY (data_locacao)
FOREIGN KEY (DVDnum)
    REFERENCES DVD(num),
FOREIGN KEY (Clientenum_cadastro)
    REFERENCES Cliente(num_cadastro)
)

ALTER TABLE estrela
ADD nome_real     VARCHAR(50)       NULL

ALTER TABLE filme
ALTER COLUMN titulo VARCHAR (80)  NOT NULL

INSERT INTO filme (id, titulo, ano)
VALUES  (1001, 'Whiplash', 2015)

INSERT INTO filme (id, titulo, ano)
VALUES  (1002, 'Birdman', 2015)

INSERT INTO filme (id, titulo, ano)
VALUES  (1003, 'Interestelar', 2014)

INSERT INTO filme (id, titulo, ano)
VALUES  (1004, 'A culpa é das estrelas', 2014)

INSERT INTO filme (id, titulo, ano)
VALUES  (1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014)

INSERT INTO filme (id, titulo, ano)
VALUES  (1006, 'Sing', 2016)

INSERT INTO estrela (id, nome)
VALUES(9901, 'Michael Keaton')

INSERT INTO estrela (id, nome)
VALUES(9902, 'Emma Stone')

INSERT INTO estrela (id, nome)
VALUES(9903, 'Miles Teller')

INSERT INTO estrela (id, nome)
VALUES(9904, 'Steve Carell')

INSERT INTO estrela (id, nome)
VALUES(9905, 'Jennifer Garner')

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES(1002, 9901)

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES(1002, 9902)

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES(1001, 9903)

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES(1005, 9904)

INSERT INTO Filme_Estrela (Filmeid, Estrelaid)
VALUES(1005, 9905)




INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10001, '2020-12-02', 1001)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10002, '2019-10-18', 1002)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10003, '2020-04-03', 1003)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10004, '2020-12-02', 1001)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10005, '2019-10-18', 1004)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10006, '2020-04-03', 1002)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10007, '2020-12-02', 1005)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10008, '2019-10-18', 1002)

INSERT INTO dvd(num, data_fabricacao,Filmeid)
VALUES(10009, '2020-04-03', 1003)

INSERT INTO cliente (num_cadastro, nome, logradouro, num, CEP)
VALUES(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040')

INSERT INTO cliente (num_cadastro, nome, logradouro, num, CEP)
VALUES(5502, 'Carlos Carreiro', 'Rua Bartolomeu Aires', 1250, '04419110')

INSERT INTO cliente (num_cadastro, nome, logradouro, num, CEP)
VALUES(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL)

INSERT INTO cliente (num_cadastro, nome, logradouro, num, CEP)
VALUES(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg', 36, NULL)

INSERT INTO cliente (num_cadastro, nome, logradouro, num, CEP)
VALUES(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10001, 5502, '2021-02-18', '2021-02-21', 3.50)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10009, 5502, '2021-02-18', '2021-02-21', 3.50)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10002, 5503, '2021-02-18', '2021-02-19', 3.50)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10002, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10004, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10005, 5505, '2021-02-20', '2021-02-23', 3.00)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10001, 5501, '2021-02-24', '2021-02-26', 3.50)

INSERT INTO locacao(DVDnum, Clientenum_cadastro, data_locacao, data_devolucao, valor)
VALUES(10008, 5501, '2021-02-24', '2021-02-26', 3.50)

UPDATE Estrela
SET nome_real = 'Michael John Douglas'
WHERE id = 9901
UPDATE estrela
SET nome_real = 'Emily Jean Stone'
WHERE id = 9902
UPDATE estrela
SET nome_real = NULL
WHERE id = 9903
UPDATE estrela
SET nome_real =  'Steven John Carell'
WHERE id = 9904
UPDATE estrela
SET nome_real =  'Jennifer Anne Garner'
WHERE id = 9905

UPDATE cliente
SET CEP = '08411150'
WHERE num_cadastro = 5503

UPDATE cliente
SET CEP = '02918190'
WHERE num_cadastro = 5504

UPDATE locacao
SET valor = 3.25
WHERE data_locacao = '2021-02-18' AND Clientenum_cadastro = 5502

UPDATE locacao
SET valor = 3.10
WHERE data_locacao = '2021-02-24' AND Clientenum_cadastro =  5501

UPDATE dvd
SET data_fabricacao = 2019-07-14
WHERE num = 10005

UPDATE estrela
SET nome_real = 'Miles Alexander Teller'
WHERE id = 9903

DELETE filme
WHERE id = 1006

SELECT ano
FROM filme
WHERE ano = 2014

SELECT id, ano
FROM filme
WHERE titulo = 'Birdman'

SELECT id, ano
FROM filme
WHERE titulo LIKE '%plash%'

SELECT id, nome, nome_real
FROM estrela
WHERE nome LIKE '%Steve%'

SELECT Filmeid, CONVERT( CHAR(10),data_fabricacao, 103) AS fab
FROM dvd
WHERE data_fabricacao >= '01-01-2020'

SELECT DVDnum, data_locacao, data_devolucao, valor , valor + 2.00 AS divida
FROM locacao
WHERE Clientenum_cadastro = 5505

SELECT logradouro, num, CEP
FROM cliente
WHERE nome = 'Matilde Luz'

SELECT nome_real
FROM estrela
WHERE nome = 'Michael Keaton'

SELECT num_cadastro, nome, logradouro + '  ' + CAST( num AS VARCHAR(5))+ '  ' + CEP AS end_comp
FROM cliente
WHERE num_cadastro >= 5503
