-- Seleccionar todas las columnas
SELECT * FROM clientes;

-- Seleccionar columnas con alias (más legible)
SELECT id_cliente AS id, nombre AS cliente, email, creado_en
FROM clientes;

-- Filtros básicos
SELECT * FROM productos WHERE precio >= 50;           -- comparación
SELECT * FROM clientes  WHERE email IS NULL;          -- nulos
SELECT * FROM productos WHERE nombre IN ('Mouse','Teclado'); -- conjunto
SELECT * FROM productos WHERE precio BETWEEN 15 AND 100;     -- rango

-- Búsquedas por patrón (LIKE)
SELECT * FROM clientes WHERE nombre LIKE 'A%';  -- empieza con A
SELECT * FROM clientes WHERE email  LIKE '%.com';

-- Ordenar resultados
SELECT * FROM productos ORDER BY precio DESC, nombre ASC;

-- Quitar duplicados
SELECT DISTINCT nombre FROM clientes;

-- Limitar filas (top N) en Oracle
SELECT * FROM productos ORDER BY precio DESC FETCH FIRST 2 ROWS ONLY;

-- Paginación simple: saltar N y traer M
SELECT * FROM productos
ORDER BY precio DESC
OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;

-- Agregaciones
SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT MIN(precio) AS min_precio, MAX(precio) AS max_precio, AVG(precio) AS precio_prom FROM productos;

-- GROUP BY / HAVING (sin joins, usando la propia tabla)
-- Total de ventas por ID de producto (recuerda: aquí no usamos FK)
SELECT id_producto, SUM(total) AS total_por_producto, SUM(cantidad) AS unidades
FROM ventas
GROUP BY id_producto
HAVING SUM(cantidad) >= 2       -- filtra grupos ya agregados
ORDER BY total_por_producto DESC;

-- CASE (clasificaciones en el SELECT)
SELECT nombre,
       precio,
       CASE
         WHEN precio < 50  THEN 'BARATO'
         WHEN precio < 150 THEN 'MEDIO'
         ELSE 'CARO'
       END AS rango
FROM productos;

-- Subconsulta simple (sin joins): filtrar por lista proveniente de otra consulta
SELECT * FROM productos
WHERE id_producto IN (
  SELECT id_producto
  FROM ventas
  GROUP BY id_producto
  HAVING SUM(cantidad) >= 2
);
