USE master
GO

CREATE DATABASE TPIN_Cervezeria_Grupo5
GO

USE TPIN_Cervezeria_Grupo5
GO

CREATE TABLE Provincias
(
IdProvincia_Pr INT IDENTITY (1,1),
NombreProvincia_Pr VARCHAR(30) NOT NULL,
CONSTRAINT PK_Provincias PRIMARY KEY (IdProvincia_Pr)
)
GO

CREATE TABLE Localidades
(
IdProvincia_Lo INT NOT NULL,
IdLocalidad_Lo INT IDENTITY (1,1),
NombreLocalidad_Lo VARCHAR(30) NOT NULL,
CONSTRAINT PK_Localidades PRIMARY KEY (IdProvincia_Lo, IdLocalidad_Lo),
CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (IdProvincia_Lo) REFERENCES Provincias(IdProvincia_Pr)
)
GO

CREATE TABLE Clientes
(
DNI_Cli CHAR(10) NOT NULL,
Nombre_Cli VARCHAR(30) NOT NULL,
Apellido_Cli VARCHAR(30) NOT NULL,
Legajo_Cli VARCHAR(5) NOT NULL UNIQUE,
Genero_Cli VARCHAR(10) NOT NULL CHECK(Genero_Cli = 'MASCULINO' OR Genero_Cli = 'FEMENINO'),
Telefono_Cli VARCHAR(15) NOT NULL,
Contraseña_Cli VARCHAR(25) NOT NULL,
IdProvincia_Cli INT NOT NULL,
IdLocalidad_Cli INT NOT NULL,
Estado_Cli BIT DEFAULT 1,
CONSTRAINT PK_Clientes PRIMARY KEY (DNI_Cli),
CONSTRAINT FK_Clientes_Localidades FOREIGN KEY (IdProvincia_Cli, IdLocalidad_Cli) REFERENCES Localidades(IdProvincia_Lo, IdLocalidad_Lo)
)
GO

CREATE TABLE Trabajadores
(
DNI_Tr CHAR(10) NOT NULL,
Nombre_Tr VARCHAR(30) NOT NULL,
Apellido_Tr VARCHAR(30) NOT NULL,
Legajo_Tr VARCHAR(5) NOT NULL UNIQUE,
Genero_Tr VARCHAR(10) NOT NULL CHECK(Genero_Tr = 'MASCULINO' OR Genero_Tr = 'FEMENINO'),
Telefono_Tr VARCHAR(15) NOT NULL,
Contraseña_Tr VARCHAR(25) NOT NULL,
IdProvincia_Tr INT NOT NULL,
IdLocalidad_Tr INT NOT NULL,
FechaIngreso_Tr DATE NOT NULL CHECK (FechaIngreso_Tr <= GETDATE()),
Estado_Tr BIT DEFAULT 1,
CONSTRAINT PK_Trabajadores PRIMARY KEY (DNI_Tr),
CONSTRAINT FK_Trabajadores_Localidades FOREIGN KEY (IdProvincia_Tr, IdLocalidad_Tr) REFERENCES Localidades(IdProvincia_Lo, IdLocalidad_Lo)
)
GO

CREATE TABLE Ventas
(
DNI_Cli_Ve CHAR(10) NOT NULL,
DNI_Tr_Ve CHAR(10) NOT NULL,
codVenta_Ve INT IDENTITY (1,1),
TotalVenta_Ve DECIMAL(14,2) DEFAULT '0.00',
FechaVenta_Ve DATE DEFAULT GETDATE(),
CONSTRAINT PK_Ventas PRIMARY KEY (codVenta_Ve),
CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (DNI_Cli_Ve) REFERENCES Clientes(DNI_Cli),
CONSTRAINT FK_Ventas_Trabajadores FOREIGN KEY (DNI_Tr_Ve) REFERENCES Trabajadores(DNI_Tr)
)
GO

CREATE TABLE Marcas_Cerveza
(
codMarca_MC INT IDENTITY (1,1),
NombreMarca_MC VARCHAR(35) NOT NULL,
CONSTRAINT PK_Marcas_Cerveza PRIMARY KEY (codMarca_Mc)
)
GO

CREATE TABLE Tipos_Cerveza
(
codMarca_TC INT NOT NULL,
codTipo_TC INT IDENTITY (1,1),
NombreTipo_TC VARCHAR(35) NOT NULL,
Descripcion_TC VARCHAR(150) NOT NULL,
CONSTRAINT PK_TiposCerveza PRIMARY KEY (codMarca_TC, codTipo_TC),
CONSTRAINT FK_TiposCerveza_MarcasCerveza FOREIGN KEY (codMarca_TC) REFERENCES Marcas_Cerveza(codMarca_MC)
)
GO

CREATE TABLE Cervezas
(
codCerveza_Ce INT IDENTITY (1,1),
codMarca_Ce INT NOT NULL,
codTipo_Ce INT NOT NULL,
PrecioUnitario_Ce DECIMAL(12,2),
Stock_Ce INT NOT NULL DEFAULT 0,
Url_Imagen_Ce VARCHAR(100),
Estado_Ce BIT DEFAULT 1,
CONSTRAINT PK_Cervezas PRIMARY KEY (codCerveza_Ce),
CONSTRAINT FK_Cervezas_TiposCerveza FOREIGN KEY (codMarca_Ce, codTipo_Ce) REFERENCES Tipos_Cerveza(codMarca_TC, codTipo_TC)
)
GO

CREATE TABLE Detalle_Ventas
(
codVenta_DV INT NOT NULL,
codCerveza_DV INT NOT NULL,
CantVenta_DV INT NOT NULL,
PrecioUnitario_DV DECIMAL(12,2),
CONSTRAINT PK_DetalleVentas PRIMARY KEY (codVenta_DV, codCerveza_DV),
CONSTRAINT FK_DetalleVentas_Ventas FOREIGN KEY (codVenta_DV) REFERENCES Ventas(codVenta_Ve),
CONSTRAINT FK_DetalleVentas_Cervezas FOREIGN KEY (codCerveza_DV) REFERENCES Cervezas(codCerveza_Ce)
)
GO

INSERT INTO Provincias(NombreProvincia_Pr)
VALUES
('Buenos Aires'),
('Cordoba'),
('Santa Fe'),
('Mendoza'),
('Tucuman'),
('Salta'),
('Chaco'),
('Entre Ríos'),
('Corrientes'),
('Jujuy');
GO

INSERT INTO Localidades (IdProvincia_Lo, NombreLocalidad_Lo)
VALUES
 (1, 'Tigre'),
 (1, 'Saavedra'),
 (2, 'San Isidro'),
 (2, 'Carlos Paz'),
 (3, 'Villa Maria'),
 (3, 'Rio Tercero'),
 (4, 'Rosario'),
 (4, 'Resistencia'),
 (5, 'Campo Largo'),
 (5, 'Berisso'),
 (6, 'San Fernando'),
 (6, 'San Miguel'),
 (7, 'Tres de Febrero'),
 (7, 'Cerrillos'),
 (8, 'Vaqueros'),
 (8, 'San Lorenzo'),
 (9, 'La Caldera'),
 (9, 'Alderetes'),
 (10, 'Las Talitas'),
 (10, 'Lavalle');
 GO

INSERT INTO Clientes (DNI_Cli, Nombre_Cli, Apellido_Cli, Legajo_Cli, Genero_Cli, Telefono_Cli, Contraseña_Cli, IdProvincia_Cli, IdLocalidad_Cli, Estado_Cli)
VALUES
('12345', 'Juan', 'Pérez', '001', 'MASCULINO', '1111111111', 'contra1', 1, 1, 1),
('09876', 'María', 'Gómez', '002', 'FEMENINO', '2222222222', 'contra2', 2, 3, 1),
('11223', 'Carlos', 'López', '003', 'MASCULINO', '3333333333', 'contra3', 3, 5, 1),
('51369', 'Laura', 'Martínez', '004', 'FEMENINO', '4444444444', 'contra4', 4, 7, 1),
('66778', 'José', 'Fernández', '005', 'MASCULINO', '5555555555', 'contra5', 5, 9, 1),
('77665', 'Ana', 'Ramírez', '006', 'FEMENINO', '6666666666', 'contra6', 6, 11, 1),
('88997', 'Luis', 'Sánchez', '007', 'MASCULINO', '7777777777', 'contra7', 7, 13, 1),
('99887', 'Clara', 'García', '008', 'FEMENINO', '8888888888', 'contra8', 8, 15, 1),
('11002', 'Pedro', 'Rodríguez', '009', 'MASCULINO', '9999999999', 'contra9', 9, 17, 1),
('22334', 'Marta', 'Hernández', '010', 'FEMENINO', '1010101010', 'contra10', 10, 19, 1),
('33445', 'Jorge', 'Torres', '011', 'MASCULINO', '1212121212', 'contra11', 1, 2, 1),
('44556', 'Elena', 'Vázquez', '012', 'FEMENINO', '1313131313', 'contra12', 2, 4, 1),
('55667', 'Raúl', 'Álvarez', '013', 'MASCULINO', '1414141414', 'contra13', 3, 6, 1),
('32784', 'Isabel', 'Díaz', '014', 'FEMENINO', '1515151515', 'contra14', 4, 8, 1),
('77889', 'Lucas', 'Pratto', '015', 'MASCULINO', '1616161616', 'contra15', 5, 10, 1);
GO

INSERT INTO Trabajadores (DNI_Tr, Nombre_Tr, Apellido_Tr, Legajo_Tr, Genero_Tr, Telefono_Tr, Contraseña_Tr, IdProvincia_Tr, IdLocalidad_Tr, FechaIngreso_Tr, Estado_Tr)
VALUES
('34251', 'Roberto', 'Morales', '016', 'MASCULINO', '1717171717', 'password16', 1, 1, '2020-01-01', 1),
('04753', 'Sara', 'Luna', '017', 'FEMENINO', '1818181818', 'password17', 2, 3, '2019-02-01', 1),
('22213', 'Enrique', 'Guzmán', '018', 'MASCULINO', '1919191919', 'password18', 3, 5, '2018-03-01', 1),
('44321', 'Natalia', 'Flores', '019', 'FEMENINO', '2020202020', 'password19', 4, 7, '2017-04-01', 1),
('75689', 'Andrés', 'Rojas', '020', 'MASCULINO', '2121212121', 'password20', 5, 9, '2016-05-01', 1),
('84583', 'Silvia', 'Castro', '021', 'FEMENINO', '2222222222', 'password21', 6, 11, '2015-06-01', 1),
('98073', 'Oscar', 'Pereyra', '022', 'MASCULINO', '2323232323', 'password22', 7, 13, '2014-07-01', 1),
('22315', 'Julia', 'Sosa', '023', 'FEMENINO', '2424242424', 'password23', 8, 15, '2013-08-01', 1),
('12113', 'Fernando', 'Aguilar', '024', 'MASCULINO', '2525252525', 'password24', 9, 17, '2012-09-01', 1),
('76584', 'Paula', 'Medina', '025', 'FEMENINO', '2626262626', 'password25', 10, 19, '2011-10-01', 1),
('99088', 'Esteban', 'Cabrera', '026', 'MASCULINO', '2727272727', 'password26', 1, 2, '2010-11-01', 1),
('12312', 'Verónica', 'Ruiz', '027', 'FEMENINO', '2828282828', 'password27', 2, 4, '2009-12-01', 1),
('44675', 'Gustavo', 'Mendoza', '028', 'MASCULINO', '2929292929', 'password28', 3, 6, '2008-01-01', 1),
('87967', 'Patricia', 'Ortiz', '029', 'FEMENINO', '3030303030', 'password29', 4, 8, '2007-02-01', 1),
('23144', 'Ignacio', 'Herrera', '030', 'MASCULINO', '3131313131', 'password30', 5, 10, '2006-03-01', 1);
GO

INSERT INTO Marcas_Cerveza (NombreMarca_MC)
VALUES
('Quilmes'),
('Heineken'),
('Corona'),
('Stella Artois'),
('Brahma'),
('Budweiser'),
('Patagonia'),
('Isenbeck'),
('Schneider'),
('Andes'),
('Amstel'),
('Imperial'),
('Warsteiner'),
('Antares'),
('Guinness');
GO

INSERT INTO Tipos_Cerveza (codMarca_TC, NombreTipo_TC, Descripcion_TC)
VALUES
(1, 'Rubia', 'Cerveza rubia tradicional'),
(1, 'Stout', 'Cerveza stout robusta'),
(2, 'Pilsner', 'Cerveza pilsner ligera'),
(2, 'Blonde Ale', 'Cerveza rubia ale suave'),
(3, 'Clara', 'Cerveza clara mexicana'),
(3, 'Extra', 'Cerveza extra lager'),
(4, 'Belgian Pale Ale', 'Cerveza belga estilo pale ale'),
(5, 'Pilsen', 'Cerveza pilsen brasileña'),
(5, 'Weissbier', 'Cerveza de trigo brasileña'),
(6, 'American Lager', 'Cerveza lager americana'),
(6, 'Red Lager', 'Cerveza lager roja'),
(7, 'Bohemian Pilsener', 'Cerveza pilsener bohemia'),
(7, 'Amber Ale', 'Cerveza ale ámbar'),
(7, 'Bock', 'Cerveza bock robusta'),
(8, 'Honey Lager', 'Cerveza lager con miel'),
(9, 'Weizen', 'Cerveza de trigo alemana'),
(9, 'Doppelbock', 'Cerveza doble bock'),
(10, 'Golden Ale', 'Cerveza ale dorada'),
(10, 'Session IPA', 'Cerveza IPA para sesiones'),
(11, 'Blond', 'Cerveza rubia ligera'),
(11, 'Radler', 'Cerveza con refresco de limón'),
(12, 'Cream Ale', 'Cerveza ale cremosa'),
(12, 'Porter', 'Cerveza porter intensa'),
(13, 'Pilsener', 'Cerveza pilsener alemana'),
(13, 'Dunkel', 'Cerveza dunkel oscura'),
(14, 'Irish Red Ale', 'Cerveza roja irlandesa'),
(14, 'APA', 'Cerveza pale ale americana'),
(15, 'Stout', 'Cerveza stout irlandesa'),
(15, 'Foreign Extra Stout', 'Cerveza stout extra fuerte');
GO

INSERT INTO Cervezas (codMarca_Ce, codTipo_Ce, PrecioUnitario_Ce, Stock_Ce, Url_Imagen_Ce, Estado_Ce)
VALUES
(1, 1, 120.50, 100, '~/Cervezas/1.jpg', 1),
(1, 2, 130.00, 50, '~/Cervezas/2.jpg', 1),
(2, 3, 140.75, 80, '~/Cervezas/3.jpg', 1),
(2, 4, 150.20, 60, '~/Cervezas/4.jpg', 1),
(3, 5, 125.90, 70, '~/Cervezas/5.jpg', 1),
(3, 6, 135.50, 90, '~/Cervezas/6.jpg', 1),
(4, 7, 160.00, 55, '~/Cervezas/7.jpg', 1),
(5, 8, 110.40, 120, '~/Cervezas/8.jpg', 1),
(5, 9, 115.75, 80, '~/Cervezas/9.jpg', 1),
(6, 10, 150.00, 75, '~/Cervezas/10.jpg', 1),
(6, 11, 160.00, 45, '~/Cervezas/11.jpg', 1),
(7, 12, 170.50, 50, '~/Cervezas/12.jpg', 1),
(7, 13, 180.00, 40, '~/Cervezas/13.jpg', 1),
(8, 15, 140.25, 60, '~/Cervezas/14.jpg', 1),
(9, 16, 150.00, 65, '~/Cervezas/15.jpg', 1),
(9, 17, 160.00, 70, '~/Cervezas/16.jpg', 1),
(10, 18, 135.00, 85, '~/Cervezas/17.jpg', 1),
(10, 19, 145.50, 50, '~/Cervezas/18.jpg', 1),
(11, 20, 130.00, 95, '~/Cervezas/19.jpg', 1),
(11, 21, 190.75, 35, '~/Cervezas/20.jpg', 1);
GO

INSERT INTO Ventas (DNI_Cli_Ve, DNI_Tr_Ve, TotalVenta_Ve, FechaVenta_Ve)
VALUES
('12345', '34251', 371.00, '2020-12-10'),
('09876', '34251', 140.75, '2023-02-20'),
('11223', '34251', 808.70, '2023-03-18'),
('51369', '44321', 441.60, '2022-04-25'),
('66778', '75689', 300.00, '2022-05-10'),
('77665', '84583', 350.50, '2022-09-28'),
('88997', '98073', 140.25, '2023-07-22'),
('99887', '22315', 480.00, '2020-10-26'),
('11002', '12113', 415.50, '2023-09-14'),
('22334', '76584', 130.00, '2021-12-15');
GO

INSERT INTO Detalle_Ventas (codVenta_DV, codCerveza_DV, CantVenta_DV, PrecioUnitario_DV)
VALUES
(1, 1, 2, 120.50),
(1, 2, 1, 130.00),
(2, 3, 1, 140.75),
(3, 5, 3, 125.90),
(3, 6, 2, 135.50),
(3, 7, 1, 160.00),
(4, 8, 4, 110.40),
(5, 10, 2, 150.00),
(6, 12, 1, 170.50),
(6, 13, 1, 180.00),
(7, 15, 1, 140.25),
(8, 17, 3, 160.00),
(9, 18, 2, 135.00),
(9, 19, 1, 145.50),
(10, 20, 1, 130.00);
GO

CREATE PROCEDURE sp_AgregarCliente
@DNI CHAR(10),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@Legajo VARCHAR(5),
@Genero VARCHAR(10),
@Telefono VARCHAR(15),
@Contrasenia VARCHAR(25),
@Provincia INT,
@Localidad INT
AS
BEGIN
INSERT INTO Clientes(DNI_Cli, Nombre_Cli, Apellido_Cli, Legajo_Cli, Genero_Cli, Telefono_Cli, Contraseña_Cli, IdProvincia_Cli, IdLocalidad_Cli)
VALUES(@DNI, @Nombre, @Apellido, @Legajo, @Genero, @Telefono, @Contrasenia, @Provincia, @Localidad);
END
GO

CREATE PROCEDURE sp_DarBajaCliente
@DNICliente CHAR(10)
AS
BEGIN
UPDATE Clientes
SET Estado_Cli = 0
WHERE DNI_Cli = @DNICliente;
END
GO

CREATE PROCEDURE Sp_EditarClientes
@DNI CHAR(10),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@Legajo VARCHAR(5),
@Genero VARCHAR(10),
@Telefono VARCHAR(15),
@Contrasenia VARCHAR(25),
@Provincia INT,
@Localidad INT
AS
BEGIN
UPDATE Clientes
SET Nombre_Cli = @Nombre,
Apellido_Cli = @Apellido,
Legajo_Cli = @Legajo,
Genero_Cli = @Genero,
Telefono_Cli = @Telefono,
Contraseña_Cli = @Contrasenia,
IdProvincia_Cli = @Provincia,
IdLocalidad_Cli = @Localidad
WHERE DNI_Cli = @DNI;
END
GO

CREATE PROCEDURE sp_AgregarTrabajador
@DNI CHAR(10),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@Legajo VARCHAR(5),
@Genero VARCHAR(10),
@Telefono VARCHAR(15),
@Contrasenia VARCHAR(25),
@Provincia INT,
@Localidad INT,
@FechaIngreso DATE
AS
BEGIN
INSERT INTO Trabajadores(DNI_Tr, Nombre_Tr, Apellido_Tr, Legajo_Tr, Genero_Tr, Telefono_Tr, Contraseña_Tr, IdProvincia_Tr, IdLocalidad_Tr, FechaIngreso_Tr)
VALUES(@DNI, @Nombre, @Apellido, @Legajo, @Genero, @Telefono, @Contrasenia, @Provincia, @Localidad, @FechaIngreso);
END
GO

CREATE PROCEDURE sp_DarBajaTrabajador
@DNITrabajador CHAR(10)
AS
BEGIN
UPDATE Trabajadores
SET Estado_Tr = 0  
WHERE DNI_Tr = @DNITrabajador;
END
GO

CREATE PROCEDURE Sp_EditarTrabajadores
@DNI CHAR(10),
@Nombre VARCHAR(30),
@Apellido VARCHAR(30),
@Legajo VARCHAR(5),
@Genero VARCHAR(10),
@Telefono VARCHAR(15),
@Contrasenia VARCHAR(25),
@Provincia INT,
@Localidad INT,
@FechaIngreso DATE
AS
BEGIN
UPDATE Trabajadores
SET Nombre_Tr = @Nombre,
Apellido_Tr = @Apellido,
Legajo_Tr = @Legajo,
Genero_Tr = @Genero,
Telefono_Tr = @Telefono,
Contraseña_Tr = @Contrasenia,
IdProvincia_Tr = @Provincia,
IdLocalidad_Tr = @Localidad,
FechaIngreso_Tr = @FechaIngreso
WHERE DNI_Tr = @DNI;
END
GO

CREATE PROCEDURE sp_AgregarCerveza
@CodMarca INT,
@CodTipo INT,
@PrecioUnitario DECIMAL(12, 2),
@Stock INT,
@URLImagenCerveza VARCHAR(100)
AS
BEGIN
INSERT INTO Cervezas (codMarca_Ce, codTipo_Ce, PrecioUnitario_Ce, Stock_Ce, Url_Imagen_Ce)
VALUES (@CodMarca, @CodTipo, @PrecioUnitario, @Stock, @URLImagenCerveza);
END
GO

CREATE PROCEDURE sp_DarDeBajaCerveza
    @CodCerveza INT
AS
BEGIN
    UPDATE Cervezas
    SET Estado_Ce = 0  
    WHERE codCerveza_Ce = @CodCerveza;
END
GO

CREATE PROCEDURE sp_DarDeAltaCerveza
    @CodCerveza INT
AS
BEGIN
    UPDATE Cervezas
    SET Estado_Ce = 1  
    WHERE codCerveza_Ce = @CodCerveza;
END
GO

CREATE PROCEDURE Sp_EditarCervezas
@CodCerveza INT,
@CodMarca INT,
@CodTipo INT,
@PrecioUnitario DECIMAL(12, 2),
@Stock INT,
@URLImagenCerveza VARCHAR(100)
AS
BEGIN
    UPDATE Cervezas
    SET codMarca_Ce = @CodMarca,
        codTipo_Ce = @CodTipo,
        PrecioUnitario_Ce = @PrecioUnitario,
		Stock_Ce =  @Stock,
        Url_Imagen_Ce = @URLImagenCerveza
    WHERE codCerveza_Ce = @CodCerveza;
END
GO

CREATE PROCEDURE sp_AgregarVenta
    @Dni_Cliente char(10),
	@Dni_Trabajador char(10)
AS
BEGIN
    INSERT INTO Ventas(DNI_Cli_Ve, DNI_Tr_Ve , FechaVenta_Ve)
    VALUES (@Dni_Cliente, @Dni_Trabajador, GETDATE());
END;
GO

CREATE PROCEDURE sp_AgregarDetalleVenta
	@CodCerveza int,
	@Cantidad int,
	@Precio DECIMAL(12,2)
AS
BEGIN
	DECLARE @Cod_Venta char(10)

	SET @Cod_Venta = (SELECT MAX(codVenta_Ve) FROM Ventas)

	INSERT INTO Detalle_Ventas(codVenta_DV, codCerveza_DV, CantVenta_DV, PrecioUnitario_DV)
	VALUES (@Cod_Venta, @CodCerveza, @Cantidad, @Precio)
END
GO

CREATE TRIGGER Total_De_Venta
ON Detalle_Ventas
AFTER INSERT
AS
BEGIN

    UPDATE Ventas SET TotalVenta_Ve = TotalVenta_Ve + (SELECT SUM(PrecioUnitario_DV * CantVenta_DV) FROM INSERTED) 
    WHERE codVenta_Ve = ( SELECT codVenta_DV FROM INSERTED )

END
GO

CREATE TRIGGER Actualizacion_Stock
ON Detalle_Ventas
AFTER INSERT
AS
BEGIN
    UPDATE Cervezas SET Stock_Ce = Stock_Ce - inserted.CantVenta_DV
    FROM Cervezas INNER JOIN inserted ON Cervezas.codCerveza_Ce = inserted.codCerveza_DV
END
GO

CREATE TRIGGER Actualizacion_CervezaEn0
ON Cervezas
AFTER UPDATE
AS
BEGIN
    UPDATE Cervezas SET Estado_Ce = 0
    FROM Cervezas c INNER JOIN inserted i ON c.codCerveza_Ce = i.codCerveza_Ce
    WHERE i.Stock_Ce = 0;
END
GO