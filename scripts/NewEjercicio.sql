---Creacion del usuario
-- crear usuario local en la PDB
CREATE USER ventas IDENTIFIED BY ventas123
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED ON users;

-- privilegios mínimos útiles para practicar
GRANT CREATE SESSION TO ventas;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE PROCEDURE TO ventas;
-- si vas a usar sinónimos, índices, etc., otórgalos conforme los necesites

