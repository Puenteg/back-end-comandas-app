----------------------------------------------------------------------------------------
--------------------------------------CREATE TABLES-------------------------------------
----------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `Mesero`;
Create Table `Mesero`
(
	`idMesero` int not null AUTO_INCREMENT,
	`nombre` varchar(50) not null,
    `apellido` varchar(50) not null,
    constraint pk_idMesero Primary Key(idMesero)
);

DROP TABLE IF EXISTS `Comanda`;	
Create Table Comanda	
(
	`idComanda` int not null,   
	`idMesero` int not null,
    `formaPago` varchar(50) null,
    `propina` float null,
    `total` float null,
    constraint pk_idComanda Primary Key(idComanda),
    Constraint fk_idMesero Foreign Key(idMesero)References Mesero(idMesero) On Delete Cascade
);
/* DROP TABLE IF EXISTS `Mesero`;
Create Table `Mesero`
(
	`idMesero` int not null AUTO_INCREMENT,
	`nombre` varchar(50) not null,
    constraint pk_nombreMesero Primary Key(nombre)
);

DROP TABLE IF EXISTS `Comanda`;	
Create Table Comanda	
(
	`idComanda` int not null,   
	`nombre` varchar(50) not null,
    `formaPago` varchar(50) null,
    `propina` float null,
    `total` float null,
    constraint pk_idComanda Primary Key(idComanda),
    Constraint fk_nombreMesero Foreign Key(nombre)References Mesero(nombre) On Delete Cascade
); */

DROP TABLE IF EXISTS `Platillos`;
Create Table Platillos(
    `idPlatillo` int AUTO_INCREMENT,
    `Nombre` varchar(50) null,
    `Descripcion` varchar(100) null,
    `Costo` float null,
    constraint pk_idPlatillo Primary Key(idPlatillo)
);

DROP TABLE IF EXISTS `Bebidas`;
Create Table Bebidas(
    `idBebida` int AUTO_INCREMENT,
    `Nombre` varchar(50) null,
    `Descripcion` varchar(100) null,
    `Costo` float null,
    constraint pk_idBebida Primary Key(idBebida)
);

DROP TABLE IF EXISTS `Paquete`;
Create Table Paquete(
    `idPaquete` int AUTO_INCREMENT,
    `Nombre` varchar(50) null,
    `Descripcion` varchar(100) null,
    `Costo` float null,
    constraint pk_idPaquete Primary Key(idPaquete)
);

--Relacion de la Comanda y Platillos 
DROP TABLE IF EXISTS `ComandaPlatillos`;	
Create Table ComandaPlatillos(
    `idPlatillo` int not null,
    `idComanda` int not null,
    `cantidad` float not null,
    Constraint fk_idPlatillo Foreign Key(idPlatillo)References Platillos(idPlatillo) On Delete Cascade,
    Constraint fk_idComanda Foreign Key(idComanda)References Comanda(idComanda) On Delete Cascade
);

--Relacion de la Comanda y Bebidas
DROP TABLE IF EXISTS `ComandaBebidas`;	
Create Table ComandaBebidas(
    `idBebida` int not null,
    `idComanda` int not null,
    `cantidad` float not null,
    Constraint fk_idBebida Foreign Key(idBebida)References Bebidas(idBebida) On Delete Cascade,
    Constraint fk_idComanda_bebidas Foreign Key(idComanda)References Comanda(idComanda) On Delete Cascade
);

--Relacion de la Comanda y Paquetes
DROP TABLE IF EXISTS `ComandaPaquete`;
Create Table ComandaPaquete(
    `idPaquete` int not null,
    `idComanda` int not null,
    `cantidad` float not null,
    Constraint fk_idPaquete Foreign Key(idPaquete)References Paquete(idPaquete) On Delete Cascade,
    Constraint fk_idComanda_paquete Foreign Key(idComanda)References Comanda(idComanda) On Delete Cascade
);

DROP TABLE IF EXISTS `Administradores`;
Create Table Administradores(
    `idAdministrador` int not null AUTO_INCREMENT PRIMARY KEY,
    `usuario` varchar(50) not null,
    `nombre` varchar(50) not null,
    `apellido` varchar(50) not null,
    `contrasenia` varchar(50) not null,
    `email` varchar(50) not null
);



Select SUM(Costo) from (
    select Costo * Cantidad from Comanda
    inner join ComandaPlatillos on idComanda = idComanda
    inner join platillos on idPlatillo = idPlatillo
    union all
    select Costo * Cantidad from comanda
    inner join ComandaBebidas on idComanda = idComanda
    inner join Bebidas on idBebida = idBebida
    union all
    select Costo * Cantidad from comanda
    inner join ComandaPaquete on idComanda = idComanda
    inner join Paquete on idPaquete = idPaquete
);

----------------------------------------------------------------------------------------
-----------------------------------------SEQUENCES--------------------------------------
----------------------------------------------------------------------------------------

-- Creación de secuencias 
CREATE SEQUENCE seqComanda START WITH 1;
CREATE SEQUENCE seqPlatillos START WITH 1;
CREATE SEQUENCE seqBebidas START WITH 1;
CREATE SEQUENCE seqPaquete START WITH 1;
CREATE SEQUENCE seqComandaPlatillos START WITH 1;
CREATE SEQUENCE seqComandaBebidas START WITH 1;
CREATE SEQUENCE seqComandaPaquete START WITH 1;
CREATE SEQUENCE seqMesero START WITH 1;

-- Consumo de secuencia
SELECT NEXT VALUE FOR seqcomanda AS Secuencia;


/* Create Table Grupo
(
	cveGru char(7) not null,
	nomGru varchar(50) not null,
	constraint pk_cveGru Primary Key(cveGru)
)

Create Table Alumno
(
	cveAlu char(4) not null,        --pk
	nomAlu varchar(100) not null,
	edaAlu tinyint not null,
	cveGru char(7) not null,        --fk

	Constraint pk_cveAlu Primary Key(cveAlu),
	Constraint fk_cveGru Foreign Key(cveGru)References Grupo(cveGru) On Delete Cascade
) */

----------------------------------------------------------------------------------------
-----------------------------------------INSERTS----------------------------------------
----------------------------------------------------------------------------------------
-- Platillos
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 1', 'Platillo a base de...', 100);
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 2', 'Platillo a base de...', 200);
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 3', 'Platillo a base de...', 300);
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 4', 'Platillo a base de...', 400);
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 5', 'Platillo a base de...', 500);
Insert Into Platillos(idPlatillo, Nombre, Descripcion, Costo)values((SELECT NEXT VALUE FOR seqPlatillos), 'Platillo 6', 'Platillo a base de...', 600);


-- Bebidas
Insert Into Bebidas(idBebida, Nombre, Descripcion, Costo)
    values((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 1', 'Bebida a base de...', 100),
        ((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 2', 'Bebida a base de...', 200),
        ((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 3', 'Bebida a base de...', 300),
        ((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 4', 'Bebida a base de...', 400),
        ((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 5', 'Bebida a base de...', 500),
        ((SELECT NEXT VALUE FOR seqBebidas), 'Bebida 6', 'Bebida a base de...', 600);

Insert Into Mesero(idMesero, nombre, apellido) values 
    ((SELECT NEXT VALUE FOR seqMesero), 'Juan', 'Ramirez'),
    ((SELECT NEXT VALUE FOR seqMesero), 'Pedro', 'Juarez'),
    ((SELECT NEXT VALUE FOR seqMesero), 'Ulises', 'Salazar');

Insert Into Paquete(idPaquete, Nombre, Descripcion, Costo) values
    ((SELECT NEXT VALUE FOR seqPaquete), 'Paquete 1', 'Consiste en platillo 1 + bebida 1', 190),
    ((SELECT NEXT VALUE FOR seqPaquete), 'Paquete 2', 'Consiste en platillo 2 + bebida 2', 390),
    ((SELECT NEXT VALUE FOR seqPaquete), 'Paquete 3', 'Consiste en platillo 3 + bebida 3', 550),
    ((SELECT NEXT VALUE FOR seqPaquete), 'Paquete 4', 'Consiste en platillo 4 + bebida 4', 700);