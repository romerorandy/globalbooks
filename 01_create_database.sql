-- ======================================================
-- 0. REINICIO
-- ======================================================
DROP DATABASE IF EXISTS globalbooks_dw;
CREATE DATABASE globalbooks_dw;
USE globalbooks_dw;


-- ======================================================
-- 1. TABLA DE ENTRADA (datos crudos)
-- ======================================================
CREATE TABLE stg_ventas (
    id_transaccion  VARCHAR(10),
    fecha_venta     DATE,
    cliente         VARCHAR(50),
    pais            VARCHAR(30),
    libro           VARCHAR(60),
    cantidad        INT,
    precio          DECIMAL(10,2)
);


-- ======================================================
-- 2. TABLA ANTES (sin controles)
-- ======================================================
CREATE TABLE ventas_antes (
    id_transaccion  VARCHAR(10),
    fecha_venta     DATE,
    cliente         VARCHAR(50),
    pais            VARCHAR(30),
    libro           VARCHAR(60),
    cantidad        INT,
    precio          DECIMAL(10,2)
);


-- ======================================================
-- 3. TABLA DESPUES (con controles)
-- ======================================================
CREATE TABLE ventas_despues (
    id_transaccion  VARCHAR(10) PRIMARY KEY,
    fecha_venta     DATE NOT NULL,
    cliente         VARCHAR(50) NOT NULL,
    pais            VARCHAR(30) NOT NULL,
    libro           VARCHAR(60) NOT NULL,
    cantidad        INT NOT NULL,
    precio          DECIMAL(10,2) NOT NULL,
    KEY idx_fecha (fecha_venta),
    KEY idx_pais (pais)
);


-- ======================================================
-- 4. VERIFICACION
-- ======================================================
SHOW TABLES;
