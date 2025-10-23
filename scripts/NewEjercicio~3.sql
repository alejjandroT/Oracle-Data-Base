--===================
--CONSULTAS SIMPLES
--====================

--==========================
--MOSTRAR TODOS LOS CLIENTES
--===========================

SELECT * FROM clientes;

--===========
--MOSTRAR PRDUCTOS CON PRECIO MAYOR
--==========================
SELECT nombre, precio FROM productos WHERE precio > 20;


--============
--PEDIDIDOS DE UN CLIENTE EN ESPECIFICO
--======================
 
SELECT p.id_pedido, p.total
FROM pedidos p
JOIN clientes ON p.id_cliente = c.id_cliente
WHERE C.NOMBRE = 'Ana Lopez';
 
 --===================
 --TOTAL DE PRODUCTOS VENDIDIDOS
 --========================

 SELECT pr.nombre, SUM(dp.cantidad) AS total_vendidos
 FROM detalle_pedido dp
 JOIN productos pr ON dp.id_producto = pr.id_producto
 GROUP BY pr.nombre;
 
 --==============
-- CLIENTES QUE HICIERON PEDIDOS
--================

SELECT DISTINCT c.nombre
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente;
 