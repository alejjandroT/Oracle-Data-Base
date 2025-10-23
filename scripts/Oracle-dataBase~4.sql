no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila
no se ha seleccionado ninguna fila

TOTAL_CLIENTES
--------------
             0


MIN_PRECIO MAX_PRECIO PRECIO_PROM
---------- ---------- -----------
                                 


Error que empieza en la línea: 38 del comando -
SELECT id_producto, SUM(total) AS total_por_producto, SUM(cantidad) AS unidades
FROM ventas
GROUP BY id_producto
HAVING SUM(cantidad) >= 2       -- filtra grupos ya agregados
ORDER BY total_por_producto DESC
Error en la línea de comandos : 39 Columna : 6
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.

More Details :
https://docs.oracle.com/error-help/db/ora-00942/
no se ha seleccionado ninguna fila

Error que empieza en la línea: 55 del comando -
SELECT * FROM productos
WHERE id_producto IN (
  SELECT id_producto
  FROM ventas
  GROUP BY id_producto
  HAVING SUM(cantidad) >= 2
)
Error en la línea de comandos : 58 Columna : 8
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe

https://docs.oracle.com/error-help/db/ora-00942/00942. 00000 -  "table or view%s does not exist"
*Cause:    The specified table or view did not exist, or a synonym
           pointed to a table or view that did not exist.
           To find existing user tables and views, query the
           ALL_TABLES and ALL_VIEWS data dictionary views. Certain
           privileges may be required to access the table. If an
           application returned this message, then the table that the
           application tried to access did not exist in the database, or
           the application did not have access to it.
*Action:   Check each of the following
           - The spelling of the table or view name is correct.
           - The referenced table or view name does exist.
           - The synonym points to an existing table or view.

More Details :
https://docs.oracle.com/error-help/db/ora-00942/
