-- Criando a Tabela Usuario
create table Usuario(
	cpf INT NOT NUll,
	nome VARCHAR (20),
	endereco VARCHAR (50),
	idade INT,
	CONSTRAINT usuario_pk PRIMARY KEY(cpf),
	CONSTRAINT check_idade CHECK(idade >0)
	
);

-- Criando a Tabela Emprestimo
CREATE table Emprestimo(
	COD_EMP int not null ,
	valor FLOAT,
	CPFUsuario int not null,
	CONSTRAINT pk_emprestimo PRIMARY key(cod_emp),
	CONSTRAINT CPF_Usuario FOREIGN Key (CPFUsuario) REFERENCES usuario (cpf)
);


-- Criando a Tabela Sessao
CREATE TABLE sessao(
	Num int not null UNIQUE,
	genero VARCHAR(10),
	CONSTRAINT pk_sessao PRIMARY key(num)
);

-- Criando a Tabela Livr
CREATE table livro(
	ISSN varchar(10) UNIQUE,
	nome VARCHAR(20),
	autor VARCHAR(20),
	edica int,
	num_sessao int,
	CONSTRAINT pk_livro PRIMARY key (issn)
	-- Esqueci de fazer o FK
	Alter TABLE livro add CONSTRAINT NS_FK FOREIGN Key (num_sessao ) REFERENCES sessao (Num)
);
-- Criando a Tabela Contem
CREATE TABLE Contem(
	dat date,
	Cod_Emprestimo int not null,
	ISSN VARCHAR(10),
	CONSTRAINT Cod_emp_fk FOREIGN Key (Cod_Emprestimo) REFERENCES emprestimo (COD_EMP)

);

-- Inseriondo os Dados na Tabela Usuario
INSERT INTO usuario (cpf, endereco, nome, idade) VALUES(321, 'Rua das Graças', 'Maria',  20);
INSERT INTO usuario (cpf, endereco, nome, idade) VALUES(123, 'Rua Dr Joao', 'Joao',  17);
INSERT INTO usuario (cpf, endereco, nome, idade) VALUES(456, 'Rua das Graças', 'Pedro',  17);
INSERT INTO usuario (cpf, endereco, nome, idade) VALUES(567, 'Rua dos Sicranos', 'Fulano',  30);

-- Inseriondo os Dados na Tabela Sessao
INSERT Into sessao (num,genero) VALUES(1234, 'Romance');
INSERT Into sessao (num,genero) VALUES(2345, 'Comedia');

-- Inseriondo os Dados na Tabela Livro
INSERT Into livro (issn,nome,autor, edica, num_sessao) VALUES(12345,'Comedia', 'Joao Pessoa',1, 2345 );
INSERT Into livro (issn,nome,autor, edica, num_sessao) VALUES(234,'Textos Crueis', 'FERNANDO PESSOA',1, 1234 );
INSERT Into livro (issn,nome,autor, edica, num_sessao) VALUES(454,'Strepsils', 'FERNANDO PESSOA',1, 1234 );


-- Inseriondo os Dados na Tabela Emprestimo
INSERT INTO emprestimo(cod_emp, valor,cpfusuario) VALUES(1234, 15, 321);
INSERT INTO emprestimo(cod_emp, valor,cpfusuario) VALUES(123, 5, 123);
INSERT INTO emprestimo(cod_emp, valor,cpfusuario) VALUES(234, 30, 456);
INSERT INTO emprestimo(cod_emp, valor,cpfusuario) VALUES(111, 30, 454);


-- Inseriondo os Dados na Tabela Contem
INSERT INTO contem(dat,cod_emprestimo,issn) VALUES('18/11/2021', 1234,234);
INSERT INTO contem(dat,cod_emprestimo,issn) VALUES('18/11/2021', 1234,12345);
INSERT INTO contem(dat,cod_emprestimo,issn) VALUES('15/11/2021', 123,234);
INSERT INTO contem(dat,cod_emprestimo,issn) VALUES('18/11/2021', 234,234);
INSERT INTO contem(dat,cod_emprestimo,issn) VALUES('10/11/2021', 111,454);


--Fazendo Os Selects
--a
SELECT nome FROM usuario WHERE(idade > 18 and idade < 30)

--b
SELECT nome FROM usuario WHERE(endereco = 'Rua das Graças')

--c
SELECT DISTINCT autor FROM livro 

--d
SELECT DISTINCT nome FROM usuario u, emprestimo d WHERE (u.cpf = d.cpfusuario and d.valor > 10);

--e
SELECT NOME FROM LIVRO  WHERE (NUM_SESSAO = 1234);

--f
--Na atividade foi pedido os livros emprestados na data 01/01/2017, mais não tinha nenhum dessa data, 
-- por esse motivo modifiquei a data para 18/11/2021

SELECT nome FROM livro l, contem c WHERE (l.issn = c.issn and c.dat = '18/11/2021')

--g
SELECT SUM(E.VALOR) FROM emprestimo E, contem Co WHERE (E.COD_EMP = Co.COD_EMPRESTIMO AND Co.dat = '18/11/2021');

--h
SELECT nome  FROM usuario WHERE (idade < 18);

--i
SELECT COUNT(livro) FROM livro WHERE (autor = 'FERNANDO PESSOA');

--j
SELECT AVG(E.VALOR) FROM EMPRESTIMO E, CONTEM CO WHERE (E.COD_EMP = CO.COD_EMPRESTIMO AND CO.ISSN = '234');


