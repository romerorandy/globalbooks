USE globalbooks_dw;


-- ======================================================
-- 1. LIMPIAR TABLAS DE DESTINO
-- ======================================================
TRUNCATE TABLE ventas_antes;
TRUNCATE TABLE ventas_despues;


-- ======================================================
-- 2. ETL ANTES (sin controles)
-- ======================================================
INSERT INTO ventas_antes
SELECT * FROM stg_ventas;


-- ======================================================
-- 3. ETL DESPUES (con clave primaria)
-- ======================================================
INSERT IGNORE INTO ventas_despues
SELECT * FROM stg_ventas;


-- ======================================================
-- 4. COMPARACION ANTES / DESPUES
-- ======================================================
SELECT 'ANTES' AS modelo,
       COUNT(*) AS filas,
       COUNT(*) - COUNT(DISTINCT id_transaccion) AS duplicados
FROM ventas_antes
UNION ALL
SELECT 'DESPUES',
       COUNT(*),
       COUNT(*) - COUNT(DISTINCT id_transaccion)
FROM ventas_despues;


-- ======================================================
-- 5. DATOS FINALES EN LA TABLA DESPUES
-- ======================================================
SELECT * FROM ventas_despues ORDER BY id_transaccion;
