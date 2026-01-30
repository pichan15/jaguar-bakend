USE jaguares_db;

-- Eliminar horarios asociados a inscripciones de prueba (DNI 99...)
DELETE FROM inscripciones_horarios 
WHERE inscripcion_id IN (
    SELECT inscripcion_id FROM inscripciones 
    WHERE alumno_id IN (SELECT alumno_id FROM alumnos WHERE dni LIKE '99%')
);

-- Eliminar inscripciones de prueba
DELETE FROM inscripciones 
WHERE alumno_id IN (SELECT alumno_id FROM alumnos WHERE dni LIKE '99%');

-- Eliminar alumnos de prueba
DELETE FROM alumnos WHERE dni LIKE '99%';

SELECT "Limpieza completada: Alumnos de prueba (DNI 99%) eliminados." as Status;
