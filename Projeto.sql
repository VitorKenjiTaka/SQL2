CREATE DATABASE Projeto
GO
USE Projeto
GO

CREATE TABLE users (
id						INT	        IDENTITY(1, 1)			  NOT NULL,
name				    VARCHAR(45)                           NOT NULL,
username			    VARCHAR(45)                           NOT NULL,
password			    VARCHAR(45) DEFAULT('123mudar')       NOT NULL,
email				    VARCHAR(45)							  NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE projects (
id						INT	        IDENTITY(10001, 1)	        NOT NULL,
name				    VARCHAR(45)                             NOT NULL,
description			    VARCHAR(45)                             NULL,
data				    DATE 	    CHECK(data > '01/09/2014')	NOT NULL
PRIMARY KEY(id)
)

GO
CREATE TABLE users_projects (
idUsers			    INT                                  NOT NULL,
idProjects		        INT                              NOT NULL
PRIMARY KEY(idUsers,idProjects)
FOREIGN KEY(idUsers) REFERENCES users(id),
FOREIGN KEY(idProjects) REFERENCES projects(id)
)

GO
ALTER TABLE users
ALTER COLUMN username VARCHAR (10)  NOT NULL

GO
ALTER TABLE users
ALTER COLUMN password VARCHAR (8)  NOT NULL

INSERT INTO users ( name, username, password, email)
VALUES('Maria', 'Rh_maria', '123mudar', 'maria@empresa.com')

INSERT INTO users ( name, username, password, email)
VALUES('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')

INSERT INTO users ( name, username, password, email)
VALUES('Ana', 'Rh_ana', '123mudar', 'ana@empresa.com')

INSERT INTO users ( name, username, password, email)
VALUES('Clara', 'Ti_clara', '123mudar', 'clara@empresa.com')

INSERT INTO users ( name, username, password, email)
VALUES('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')
GO

INSERT INTO projects( name, description, data)
VALUES('Re-folha','Refatoração das Folhas','05/09/2014')

INSERT INTO projects( name, description, data)
VALUES('Manutenção PCs','Manutenção PCs','06/09/2014')

INSERT INTO projects( name, description, data)
VALUES('Auditoria', NULL,'07/09/2014')

INSERT INTO users_projects (idUsers, idProjects)
VALUES(1, 10001)

INSERT INTO users_projects (idUsers, idProjects)
VALUES(5, 10001)

INSERT INTO users_projects (idUsers, idProjects)
VALUES(3, 10003)

INSERT INTO users_projects (idUsers, idProjects)
VALUES(4, 10002)

INSERT INTO users_projects (idUsers, idProjects)
VALUES(2, 10002)

UPDATE projects
SET data = '12/09/2014'
WHERE name = 'Manutenção PCs'

UPDATE users
SET username = 'Rh_cido'
WHERE name = 'Aparecido'

UPDATE users
SET password = '888@*'
WHERE username = 'Rh_maria' AND password = '123mudar'

DELETE users_projects
WHERE idUsers = 2
