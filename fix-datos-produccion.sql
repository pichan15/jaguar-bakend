-- Reparar Fechas NULL
UPDATE inscripciones SET fecha_inscripcion = NOW() WHERE fecha_inscripcion IS NULL;
UPDATE alumnos SET created_at = NOW() WHERE created_at IS NULL;

-- Reparar Estados de Inscripción
-- Si el alumno tiene pago 'confirmado', sus inscripciones pendientes deben pasar a 'activa'
UPDATE inscripciones i
JOIN alumnos a ON i.alumno_id = a.alumno_id
SET i.estado = 'activa', i.updated_at = NOW()
WHERE a.estado_pago = 'confirmado' 
  AND i.estado = 'pendiente';

SELECT ROW_COUNT() as 'InscripcionesActivadas';
