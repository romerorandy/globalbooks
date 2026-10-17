USE globalbooks_dw;


-- ======================================================
-- A. ANTES DEL RESPALDO: contar filas
-- ======================================================
SELECT COUNT(*) AS filas_antes FROM ventas_despues;


-- ======================================================
-- B. DESASTRE: borrar la tabla (solo DESPUES del respaldo)
-- ======================================================
DROP TABLE ventas_despues;


-- ======================================================
-- C. VERIFICAR: contar filas
-- ======================================================
SELECT COUNT(*) AS filas_verificacion FROM ventas_despues;


-- ======================================================
-- D. VER LOS DATOS RESTAURADOS
-- ======================================================
SELECT * FROM ventas_despues ORDER BY id_transaccion;
