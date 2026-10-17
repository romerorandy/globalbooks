# GlobalBooks – Simulación de Data Warehousing

Scripts en MySQL de la actividad de Administración de Bases de Datos (UNIMINUTO). Con un ejemplo pequeño, simulan cómo mejorar el ETL, la seguridad y los respaldos de GlobalBooks, una distribuidora de libros físicos y digitales.

## Qué hay aquí

| Archivo | Qué hace |
|---|---|
| `01_create_database.sql` | Crea la base `globalbooks_dw` y tres tablas: entrada, "antes" y "después" |
| `02_datos_prueba.sql` | Carga 10 ventas, 3 repetidas a propósito |
| `03_ETL.sql` | Pasa los datos por las dos tablas y compara los duplicados |
| `04_seguridad-roles.sql` | Crea 3 roles (admin, ETL y analista) con sus permisos |
| `05_respaldo.sql` | Consultas para simular un desastre y verificar la restauración |

## Cómo correrlo

Necesitas MySQL 8.0 o superior, MySQL Workbench y un usuario administrador (por ejemplo `root`).

1. Descarga el repositorio (Code → Download ZIP) y descomprímelo.
2. En Workbench abre cada archivo con File → Open SQL Script, en orden del 01 al 05.
3. Ejecuta cada uno completo con Ctrl + Shift + Enter.
4. El 05 se corre por bloques (seleccionas y Ctrl + Enter), porque entre uno y otro se hace el respaldo con Server → Data Export y la restauración con Server → Data Import.

## Qué debería salir

- **02:** 10 filas, 7 ventas únicas y 3 duplicadas.
- **03:** antes, 10 filas con 3 duplicados; después, 7 filas y 0 duplicados.
- **04:** 3 roles con permisos distintos.
- **05:** se borra `ventas_despues` y se recupera con sus 7 ventas.

## Ojo

- El 01 borra y vuelve a crear la base `globalbooks_dw`.
- El 04 crea usuarios de prueba con contraseñas de ejemplo.
- Es una simulación pequeña, por eso no mide tiempos de carga.
