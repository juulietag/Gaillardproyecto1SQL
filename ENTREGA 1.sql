Create database Entrega1_Gaillard;
USE Entrega1_Gaillard;

CREATE TABLE CODPOSTAL (
ID_CP int NOT NULL,
Ciudad varchar(50) NOT NULL,
PRIMARY KEY (ID_CP));

CREATE TABLE PROVEEDORES (
ID_proveedor int NOT NULL auto_increment,
nombre varchar(50) NOT NULL	,
direccion varchar(50) NOT NULL,
CODPOSTAL int NOT NULL,
Contacto varchar(50) NOT NULL,
Rubro text(20) NOT NULL,
PRIMARY KEY (ID_proveedor),
FOREIGN KEY (CODPOSTAL) REFERENCES CODPOSTAL(ID_CP));

CREATE TABLE USUARIO (
ID_empleado int NOT NULL,
Nombreyapellido text(100) NOT NULL,
Area text(50) NOT NULL,
PRIMARY KEY (ID_empleado));

CREATE TABLE PRODUCTO (
ID_producto int NOT NULL auto_increment,
ID_proveedor int NOT NULL,
Descripción varchar(100) NOT NULL,
Caracteristicas varchar(100) NOT NULL,
PRIMARY KEY (ID_producto),
FOREIGN KEY (ID_proveedor) REFERENCES PROVEEDORES(ID_proveedor));	

CREATE TABLE ORDEN_DE_COMPRA (
ID_producto int NOT NULL,
ID_pedido int NOT NULL auto_increment,
Precio int NOT NULL,
unit int NOT NULL,
cantidad int NOT NULL,
UM varchar(2) NOT NULL,
Especificaciones text(100) NOT NULL,
usuario int NOT NULL,
PRIMARY KEY (ID_pedido),
FOREIGN KEY (ID_producto) REFERENCES PRODUCTO(ID_producto),
FOREIGN KEY (usuario) REFERENCES USUARIO(ID_empleado));

CREATE TABLE CONDICION_PAGO (
ID_plazo varchar(5) NOT NULL,
Condicion varchar(50) NOT NULL,
PRIMARY KEY (ID_plazo));

CREATE TABLE FACTURA (
ID_producto int NOT NULL,
ID_proveedor int NOT NULL,
ID_factura int NOT NULL,
precio int NOT NULL,
plazo_de_pago varchar(5) NOT NULL,
cantidad int NOT NULL,
IVA DECIMAL(18,2) NOT NULL,
moneda text(3) NOT NULL,
PRIMARY KEY (ID_factura),
FOREIGN KEY (ID_producto) REFERENCES PRODUCTO(ID_producto),
FOREIGN KEY (ID_proveedor) REFERENCES PROVEEDORES(ID_proveedor),
FOREIGN KEY (plazo_de_pago) REFERENCES CONDICION_PAGO(ID_plazo));

CREATE TABLE CTACTE_PROVEEDOR (
ID_Ctacte int NOT NULL auto_increment,
ID_proveedor int NOT NULL,
ID_factura int NOT NULL,
CBU int NOT NULL,
BANCO varchar(50) NOT NULL,
PRIMARY KEY (ID_Ctacte),
FOREIGN KEY (ID_proveedor) REFERENCES PROVEEDORES(ID_proveedor),
FOREIGN KEY (ID_factura) REFERENCES FACTURA(ID_factura));
	
CREATE TABLE METODO_DE_PAGO (
ID_factura int NOT NULL ,
ID_pago int NOT NULL auto_increment ,
Fecha_pago DATE NOT NULL,
monto int NOT NULL,
moneda varchar(3) NOT NULL,
Ctacte_proveedor int NOT NULL, 
PRIMARY KEY (ID_pago),
FOREIGN KEY (ID_factura) REFERENCES FACTURA(ID_factura),
FOREIGN KEY (Ctacte_proveedor) REFERENCES CTACTE_PROVEEDOR(ID_Ctacte));    
							 
CREATE TABLE Fact_prod (
ID_factura int NOT NULL,
ID_producto int NOT NULL,
Cantidadpedida int NOT NULL,
primary key (ID_factura,ID_producto),
FOREIGN KEY (ID_factura) REFERENCES FACTURA(ID_factura),
FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto));
		