-- ===Primeira Questão===
--Pojeto de Pedidos de Peças, com relação de Peças e Fornecedores

-- Tabela de Peças
CREATE TABLE PECAS(	
	nome varchar(50),
	peso float,
	cidade varchar(20) NOT NULL,	
	
	CONSTRAINT check_peso CHECK (peso > 0)
)

ALTER TABLE pecas ADD codPecas int not null

--Tabela de Fornecedores
CREATE TABLE fornecedores(
	corFornec varchar(2) PRIMARY KEY,
	nome varchar(20) UNIQUE, 
	status int not null,
	cidade varchar(20)

)

--Tabela de Pedidos
CREATE TABLE pedidos(
	codPecas int not null,
	codFornec varchar(2) not null,
	
	CONSTRAINT restricao_pk FOREIGN KEY(codPecas)REFERENCES pecas(codpecas)
	

)

ALTER TABLE pedidos
add CONSTRAINT referencia_codfornec FOREIGN key(codfornec)
REFERENCES fornecedores(codfornec)

-- ===Segunda Questão===

--Alterações nas tabelas
ALTER TABLE pecas add column
	fabricante VARCHAR(50);
	
ALTER TABLE pecas DROP column
	peso;

ALTER TABLE Fornecedores ALTER column nome type VARCHAR(100);

Alter  TAble Fornecedores rename Column cidade to regiao;

Alter table Pedidos rename to vendas;

-- ===Terceira Questao===
--Adicão de valores as tabelas
insert into pecas(nome,cidade,codpecas, fabricante) VALUES ('Eixo', 'Recife', 1, 'AAA');
insert into pecas(nome,cidade,codpecas, fabricante) VALUES ('Rolamento', 'Sume', 2, 'BBB');
insert into pecas(nome,cidade,codpecas, fabricante) VALUES ('Mancal', 'Monteiro', 3, 'CCC');
insert into pecas(nome,cidade,codpecas, fabricante) VALUES ('Parafuso', 'JP', 4, 'DDD');
insert into pecas(nome,cidade,codpecas, fabricante) VALUES ('Corrente', 'Campina', 5, 'EEE');

insert into fornecedores(codfornec, nome, status, regiao) VALUES (1, 'Silva', 5, 'JP');
insert into fornecedores(codfornec, nome, status, regiao) VALUES (2, 'Alves', 8, 'CG');
insert into fornecedores(codfornec, nome, status, regiao) VALUES (3, 'Tavares', 10, 'Sume');
insert into fornecedores(codfornec, nome, status, regiao) VALUES (4, 'Monteiro', 8, 'Monteiro');
insert into fornecedores(codfornec, nome, status, regiao) VALUES (5, 'Solza', 8, 'Recife');

ALTER TABLE vendas add column q_pedidos int not null;

--Criaçãode Vendas com as Informação do Codigo da Peça, Codigo do Fornecedor e Quantidade de Peças
insert into vendas VALUES(1,1, 10);
insert into vendas VALUES(3,1, 10);

insert into vendas VALUES(4,2, 50);
insert into vendas VALUES(5,2, 15);

insert into vendas VALUES(3,3, 8);
insert into vendas VALUES(4,3, 30);

insert into vendas VALUES(5,4, 12);
insert into vendas VALUES(1,4, 25);

insert into vendas VALUES(3,5, 18);
insert into vendas VALUES(2,5, 5);


