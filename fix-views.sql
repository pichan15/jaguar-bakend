USE jaguares_db;

-- 1. Eliminar vista con definer incorrecto
DROP VIEW IF EXISTS vista_inscripciones_activas;

-- 2. Recrear vista con definer correcto
CREATE DEFINER=`admin`@`%` VIEW `vista_inscripciones_activas` AS
SELECT 
    i.inscripcion_id,
    a.nombres,
    a.apellido_paterno,
    a.dni,
    d.nombre as deporte,
    i.estado
FROM inscripciones i
JOIN alumnos a ON i.alumno_id = a.alumno_id
JOIN deportes d ON i.deporte_id = d.deporte_id
WHERE i.estado = 'activa';

SELECT "Vista reparada exitosamente y asignada a admin" as Status;
