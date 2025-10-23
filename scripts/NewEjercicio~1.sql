-- ===========================================
-- 00) LIMPIEZA SEGURA (DROP SI EXISTE)
-- ===========================================
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE detalle_pedido CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF; -- ignora "table or view does not exist"
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE pedidos CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE productos CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE clientes CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN
  IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

-- ===========================================
-- 01) TABLAS PADRE
-- ===========================================
-- Clientes
CREATE TABLE clientes (
  id_cliente NUMBER        CONSTRAINT pk_clientes PRIMARY KEY,
  nombre     VARCHAR2(50)  NOT NULL,
  ciudad     VARCHAR2(50),
  email      VARCHAR2(100) -- corregido: 'email' (antes 'emain')
);

-- Productos (¡esta faltaba!)
CREATE TABLE productos (
  id_producto NUMBER        CONSTRAINT pk_productos PRIMARY KEY,
  nombre      VARCHAR2(50)  NOT NULL,
  precio      NUMBER(10,2)  NOT NULL
);

-- ===========================================
-- 02) TABLA HIJA (1:N con clientes)
-- ===========================================
CREATE TABLE pedidos (
  id_pedido   NUMBER        CONSTRAINT pk_pedidos PRIMARY KEY,
  fecha       DATE          NOT NULL,
  total       NUMBER(10,2)  NOT NULL,
  id_cliente  NUMBER        NOT NULL,
  CONSTRAINT fk_pedidos_cliente
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- ===========================================
-- 03) TABLA N:M (entre pedidos y productos)
-- ===========================================
CREATE TABLE detalle_pedido (
  id_pedido    NUMBER       NOT NULL,
  id_producto  NUMBER       NOT NULL,
  cantidad     NUMBER       NOT NULL,
  CONSTRAINT pk_detalle_pedido PRIMARY KEY (id_pedido, id_producto),
  CONSTRAINT fk_dp_pedido
    FOREIGN KEY (id_pedido)   REFERENCES pedidos(id_pedido),
  CONSTRAINT fk_dp_producto
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ===========================================
-- 04) VERIFICACIONES RÁPIDAS
-- ===========================================
SELECT object_name, object_type, status
FROM user_objects
WHERE object_name IN ('CLIENTES','PRODUCTOS','PEDIDOS','DETALLE_PEDIDO')
ORDER BY object_name;

DESC clientes;
DESC productos;
DESC pedidos;
DESC detalle_pedido;
