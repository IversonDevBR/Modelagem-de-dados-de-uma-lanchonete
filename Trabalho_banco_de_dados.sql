CREATE TABLE Clientes (
		idCLIENTES INT auto_increment,
        nome varchar(45),
        telefone varchar(45),
        rua varchar (45),
        cidade varchar(45),
        bairro varchar(45),
        cep varchar(45),
        primary key(idCLIENTES)
        
);

CREATE TABLE Sanduiches (
	
    idSANDUICHES INT auto_increment,
    nome varchar(45),
    preco double,
	primary key (idSANDUICHES)
    
);

CREATE TABLE Entregadores (

	idENTREGADORES INT auto_increment,
    nome varchar(45),
    telefone varchar(45),
    primary key (idENTREGADORES)
	
);

CREATE TABLE Pedidos (
	
    idPEDIDOS INT auto_increment,
    idENTREGADORES INT,
    idCLIENTES INT,
    status tinyint,
    dataemissao date,
    primary key (idPEDIDOS),
    foreign key (idENTREGADORES) references Entregadores(idENTREGADORES),
    foreign key (idCLIENTES) references Clientes(idCLIENTES)
    
);

CREATE TABLE intensPedidos (
	
    idITENSPEDIDOS INT auto_increment,
    idPEDIDOS INT,
    idSANDUICHES INT,
    quantidade INT,
    primary key (idITENSPEDIDOS),
    foreign key (idPEDIDOS) references Pedidos (idPEDIDOS),
    foreign key (idSANDUICHES) references Sanduiches (idSANDUICHES)

);

INSERT INTO Clientes (nome, telefone, rua, cidade, bairro, cep) values ('Iverson Irian', '(41) 98819-1677', 'Saturno', 'Curitiba', 'Sitio Cercado', '81910-320');
INSERT INTO Sanduiches (nome, preco) values ('Hot dog primata', 24.55);
INSERT INTO Entregadores (nome, telefone) values ('Gerson Silva', '(41) 90033-5678');
-- 0 do INSERT INTO de pedidos = "em preparo", 1 = "pronto para entrega" e o 2 = "entregue"
INSERT INTO Pedidos (status, idCLIENTES, idENTREGADORES, dataemissao) values (0, 1, 1, '2026-10-25');
INSERT INTO IntensPedidos (quantidade, idPEDIDOS, idSANDUICHES) values (3, 1, 1);

SELECT 
	CASE status
		WHEN 0 THEN 'Em preparacao'
		WHEN 1 THEN 'Pedido saiu para a entrega'
		WHEN 2 THEN 'Pedido entregue'
	END AS statusPedido,
	dataemissao 
FROM Pedidos 
WHERE status = 0



