--============
--INCERTAR DATOS
--=============

--=============
--CLIENTES
--=============

INSERT INTO clientes VALUES (1, 'Ana Lopez', 'Madrid', 'ana@corrreo.com');
INSERT INTO clientes VALUES (2, 'Carlos Paz', 'Barcelona', 'car@correo.com');

--==========
--PRODUCTOS
--==========

INSERT INTO productos VALUES (1, 'Teclado', 25);
INSERT INTO productos Values (2, 'Monitor', 31);
INSERT INTO productos VALUES (3, 'Mouse', 11);

--========
--PEDIDDOS
--=========

INSERT INTO pedidos VALUES (100, SYSDATE, 16.50, 1);
INSERT INTO pedidos VALUES (101, SYSDATE, 15.22, 2);

--========
--DETALLES
--=========

INSERT INTO detalle_pedido VALUES (100, 1, 2);
INSERT INTO detalle_pedido VALUES (100, 3, 1);
INSERT INTO detalle_pedido VALUES (101,2,1);


