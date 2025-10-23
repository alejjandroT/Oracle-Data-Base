-- UPDATE: cambiar datos
UPDATE productos
SET precio = precio * 1.10  -- +10%
WHERE nombre = 'Teclado';

-- DELETE: borrar filas
DELETE FROM clientes
WHERE email IS NULL;        -- ejemplo: limpiar registros sin email

-- Confirmar o revertir
COMMIT;     -- guarda cambios
-- ROLLBACK; -- revierte cambios no confirmados
