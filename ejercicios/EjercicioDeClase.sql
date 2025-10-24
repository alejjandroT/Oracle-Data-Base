-- *** 1. Permisos y Cuotas (Ejecutar solo una vez por usuario) ***
-- Se asume que el usuario USUARIOLUIS ya existe.
GRANT CREATE TABLE TO USUARIOLUIS;
ALTER USER USUARIOLUIS QUOTA UNLIMITED ON USERS;
-- Opcional: Si quieres conectarte directamente, usa: CONNECT USUARIOLUIS/password;

--------------------------------------------------------------------------------

-- *** 2. Creación de Tablas (Ordenado por dependencias) ***

-- 2.1. Tablas Sin Dependencias Externas (Base)
CREATE TABLE DEPARTAMENTOS (
  DEP_ID NUMBER(4) PRIMARY KEY,
  DEP_NOMBRE VARCHAR2(30) NOT NULL,
  DEP_LOCALIZACION VARCHAR2(30) NOT NULL
);

CREATE TABLE PRODUCTOS(
  PRO_ID NUMBER PRIMARY KEY,
  -- CORRECCIÓN: VARCHAR debe tener un tamaño para funcionar en Oracle.
  PRO_NOMBRE VARCHAR2(50) NOT NULL 
);

--------------------------------------------------------------------------------

-- 2.2. Tablas que dependen de DEPARTAMENTOS y PRODUCTOS
CREATE TABLE EMPLEADOS (
  EMP_ID NUMBER(4) PRIMARY KEY,
  DEP_ID NUMBER(4) NOT NULL,
  EMP_NOMBRE VARCHAR2(50) NOT NULL, -- Tamaño ampliado, 10 es muy pequeño para nombres
  EMP_CARGO VARCHAR2(30) NOT NULL, -- Tamaño ampliado
  EMP_FECHACONTRATO DATE NOT NULL,
  EMP_SALARIO NUMBER(11,2) NOT NULL,
  EMP_COMISION NUMBER(11,2),
  FOREIGN KEY (DEP_ID) REFERENCES DEPARTAMENTOS(DEP_ID)
);

CREATE TABLE PRECIOS (
  PRE_ID NUMBER PRIMARY KEY,
  PRO_ID NUMBER NOT NULL,
  PRE_FECHAINICIO DATE NOT NULL,
  PRE_FECHAFIN DATE NOT NULL,
  PRE_ESTANDAR NUMBER(11,2) NOT NULL,
  PRE_MINIMO NUMBER(11,2) NOT NULL,
  FOREIGN KEY (PRO_ID) REFERENCES PRODUCTOS(PRO_ID)
);

--------------------------------------------------------------------------------

-- 2.3. Tablas que dependen de EMPLEADOS
CREATE TABLE CLIENTES (
  CLI_ID NUMBER(8) PRIMARY KEY,
  EMP_ID NUMBER(4) NOT NULL,
  CLI_NOMBRE VARCHAR2(45) NOT NULL,
  CLI_DIRECCION VARCHAR2(40) NOT NULL,
  CLI_CIUDAD VARCHAR2(30) NOT NULL,
  CLI_DEPARTAMENTO VARCHAR2(20) NOT NULL,
  CLI_TELEFONO VARCHAR2(10) NOT NULL,
  CLI_CREDITOLIMITE NUMBER(11,2) NOT NULL,
  CLI_OBSERVACIONES CLOB,
  FOREIGN KEY (EMP_ID) REFERENCES EMPLEADOS(EMP_ID)
);

--------------------------------------------------------------------------------

-- 2.4. Tablas que dependen de CLIENTES y EMPLEADOS
CREATE TABLE ORDENES (
  ORD_ID NUMBER PRIMARY KEY,
  CLI_ID NUMBER(8) NOT NULL,
  EMP_ID NUMBER(4) NOT NULL,
  ORD_FECHA DATE NOT NULL,
  ORD_PLANCOMISION VARCHAR2(20) NOT NULL,
  ORD_FECHAENTREGA DATE NOT NULL,
  ORD_TOTAL NUMBER(11,2) NOT NULL,
  FOREIGN KEY (CLI_ID) REFERENCES CLIENTES(CLI_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLEADOS(EMP_ID)
);

--------------------------------------------------------------------------------

-- 2.5. Tablas que dependen de ORDENES y PRODUCTOS
CREATE TABLE PRODUCTOSPORORDEN (
  PFO_ID NUMBER PRIMARY KEY,
  ORD_ID NUMBER NOT NULL,
  PRO_ID NUMBER NOT NULL,
  PFO_PRECIOACTUAL NUMBER(11,2) NOT NULL,
  PFO_CANTIDAD NUMBER(8) NOT NULL,
  PFO_TOTALLINEA NUMBER(11,2) NOT NULL,
  FOREIGN KEY (ORD_ID) REFERENCES ORDENES(ORD_ID),
  FOREIGN KEY (PRO_ID) REFERENCES PRODUCTOS(PRO_ID)
);

--------------------------------------------------------------------------------

-- *** 3. Confirmación ***
-- Se recomienda hacer un COMMIT explícito al final
COMMIT;