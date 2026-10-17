USE globalbooks_dw;


-- ======================================================
-- 1. LIMPIAR TABLA DE ENTRADA
-- ======================================================
TRUNCATE TABLE stg_ventas;


-- ======================================================
-- 2. CARGAR 10 VENTAS (3 REPETIDAS)
-- ======================================================
INSERT INTO stg_ventas
    (id_transaccion, fecha_venta, cliente, pais, libro, cantidad, precio)
VALUES
    ('V001', '2026-01-10', 'Ana Torres',   'Colombia',       'Cien años de soledad', 1, 35.00),
    ('V002', '2026-01-15', 'Luis Pérez',   'España',         'Don Quijote',          2, 28.50),
    ('V003', '2026-02-03', 'María Gómez',  'México',         'El principito',        3, 15.00),
    ('V004', '2026-02-20', 'Carlos Ruiz',  'Colombia',       'Rayuela',              1, 32.00),
    ('V005', '2026-03-05', 'Sofía Müller', 'Alemania',       'Cien años de soledad', 2, 35.00),
    ('V006', '2026-03-18', 'John Smith',   'Estados Unidos', 'El principito',        1, 15.00),
    ('V007', '2026-04-02', 'Laura Díaz',   'Colombia',       'Don Quijote',          1, 28.50),
    ('V002', '2026-01-15', 'Luis Pérez',   'España',         'Don Quijote',          2, 28.50),
    ('V004', '2026-02-20', 'Carlos Ruiz',  'Colombia',       'Rayuela',              1, 32.00),
    ('V006', '2026-03-18', 'John Smith',   'Estados Unidos', 'El principito',        1, 15.00);


-- ======================================================
-- 3. VER LOS DATOS
-- ======================================================
SELECT * FROM stg_ventas ORDER BY id_transaccion;


-- ======================================================
-- 4. CONTAR DUPLICADOS
-- ======================================================
SELECT COUNT(*)                                  AS filas_totales,
       COUNT(DISTINCT id_transaccion)            AS ventas_unicas,
       COUNT(*) - COUNT(DISTINCT id_transaccion) AS duplicados
FROM stg_ventas;
