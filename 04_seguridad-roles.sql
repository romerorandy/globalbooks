USE globalbooks_dw;


-- ======================================================
-- 1. LIMPIAR (para poder repetir el script)
-- ======================================================
DROP USER IF EXISTS 'usr_admin'@'localhost', 'usr_etl'@'localhost', 'usr_analista'@'localhost';
DROP ROLE IF EXISTS 'rol_admin', 'rol_etl', 'rol_analista';


-- ======================================================
-- 2. CREAR ROLES
-- ======================================================
CREATE ROLE 'rol_admin', 'rol_etl', 'rol_analista';


-- ======================================================
-- 3. PERMISOS DE CADA ROL
-- ======================================================
GRANT ALL PRIVILEGES ON globalbooks_dw.* TO 'rol_admin';

GRANT SELECT, INSERT ON globalbooks_dw.stg_ventas     TO 'rol_etl';
GRANT SELECT, INSERT ON globalbooks_dw.ventas_despues TO 'rol_etl';

GRANT SELECT ON globalbooks_dw.ventas_despues TO 'rol_analista';


-- ======================================================
-- 4. CREAR USUARIOS DE PRUEBA
-- ======================================================
CREATE USER 'usr_admin'@'localhost'    IDENTIFIED BY 'Admin_2026!';
CREATE USER 'usr_etl'@'localhost'      IDENTIFIED BY 'Etl_2026!';
CREATE USER 'usr_analista'@'localhost' IDENTIFIED BY 'Analista_2026!';


-- ======================================================
-- 5. ASIGNAR ROL A CADA USUARIO
-- ======================================================
GRANT 'rol_admin'    TO 'usr_admin'@'localhost';
GRANT 'rol_etl'      TO 'usr_etl'@'localhost';
GRANT 'rol_analista' TO 'usr_analista'@'localhost';

SET DEFAULT ROLE 'rol_admin'    TO 'usr_admin'@'localhost';
SET DEFAULT ROLE 'rol_etl'      TO 'usr_etl'@'localhost';
SET DEFAULT ROLE 'rol_analista' TO 'usr_analista'@'localhost';


-- ======================================================
-- 6. VERIFICACION
-- ======================================================
SHOW GRANTS FOR 'rol_admin';
SHOW GRANTS FOR 'rol_etl';
SHOW GRANTS FOR 'rol_analista';
