USE jaguares_db;

-- 1. Eliminar Triggers corruptos (root)
DROP TRIGGER IF EXISTS after_inscripcion_horario_insert;
DROP TRIGGER IF EXISTS after_inscripcion_horario_delete;
DROP TRIGGER IF EXISTS after_inscripcion_update;

-- 2. Recrear Triggers con usuario ADMIN (AWS RDS)
DELIMITER ;;

CREATE DEFINER=`admin`@`%` TRIGGER `after_inscripcion_horario_insert` AFTER INSERT ON `inscripcion_horarios` FOR EACH ROW BEGIN
    IF (SELECT estado FROM inscripciones WHERE inscripcion_id = NEW.inscripcion_id) != 'cancelada' THEN
        UPDATE horarios 
        SET cupos_ocupados = cupos_ocupados + 1
        WHERE horario_id = NEW.horario_id;
    END IF;
END;;

CREATE DEFINER=`admin`@`%` TRIGGER `after_inscripcion_horario_delete` AFTER DELETE ON `inscripcion_horarios` FOR EACH ROW BEGIN
    IF (SELECT estado FROM inscripciones WHERE inscripcion_id = OLD.inscripcion_id) != 'cancelada' THEN
        UPDATE horarios 
        SET cupos_ocupados = GREATEST(cupos_ocupados - 1, 0)
        WHERE horario_id = OLD.horario_id;
    END IF;
END;;

CREATE DEFINER=`admin`@`%` TRIGGER `after_inscripcion_update` AFTER UPDATE ON `inscripciones` FOR EACH ROW BEGIN
    IF OLD.estado != 'cancelada' AND NEW.estado = 'cancelada' THEN
        UPDATE horarios h
        JOIN inscripcion_horarios ih ON h.horario_id = ih.horario_id
        SET h.cupos_ocupados = GREATEST(h.cupos_ocupados - 1, 0)
        WHERE ih.inscripcion_id = NEW.inscripcion_id;
    END IF;
    
    IF OLD.estado = 'cancelada' AND NEW.estado != 'cancelada' THEN
        UPDATE horarios h
        JOIN inscripcion_horarios ih ON h.horario_id = ih.horario_id
        SET h.cupos_ocupados = h.cupos_ocupados + 1
        WHERE ih.inscripcion_id = NEW.inscripcion_id;
    END IF;
END;;

DELIMITER ;

SELECT "Triggers reparados exitosamente con usuario admin" as Status;
