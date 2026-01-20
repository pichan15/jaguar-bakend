-- SCRIPT DE LIMPIEZA DE DATOS DE PRUEBA
-- ADVERTENCIA: ESTO BORRARÁ TODOS LOS ALUMNOS, INSCRIPCIONES Y PAGOS
-- Mantiene: Administradores, Deportes, Categorías y Horarios

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Limpiar tablas transaccionales
TRUNCATE TABLE pagos;
TRUNCATE TABLE inscripciones;
TRUNCATE TABLE alumnos;

-- 2. Resetear contadores de cupos en horarios
UPDATE horarios SET cupos_ocupados = 0;

SET FOREIGN_KEY_CHECKS = 1;

SELECT "Limpieza completada. El sistema esta listo para produccion real." as Mensaje;
