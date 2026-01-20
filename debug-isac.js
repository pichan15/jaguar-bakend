import mysql from 'mysql2/promise';

async function debugIsac() {
    try {
        const connection = await mysql.createConnection({
            host: 'jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com',
            user: 'admin',
            password: 'kikomoreno1',
            database: 'jaguares_db'
        });

        const dni = '74685232';

        console.log(`🔍 Buscando alumno con DNI: ${dni}`);
        const [alumnos] = await connection.execute('SELECT * FROM alumnos WHERE dni = ?', [dni]);

        if (alumnos.length === 0) {
            console.log('❌ Alumno no encontrado');
            return;
        }

        const alumno = alumnos[0];
        console.log('✅ Alumno encontrado:', { id: alumno.alumno_id, nombre: alumno.nombres });

        console.log('\n📋 Inscripciones:');
        const [inscripciones] = await connection.execute('SELECT * FROM inscripciones WHERE alumno_id = ?', [alumno.alumno_id]);

        for (const insc of inscripciones) {
            console.log(`- ID: ${insc.inscripcion_id}, Estado: ${insc.estado}, Fecha: ${insc.fecha_inscripcion}, Deporte: ${insc.deporte_id}`);

            const [horarios] = await connection.execute('SELECT * FROM inscripciones_horarios WHERE inscripcion_id = ?', [insc.inscripcion_id]);
            console.log(`  🕒 Horarios vinculados (${horarios.length}):`, horarios);
        }

        await connection.end();
    } catch (error) {
        console.error('Error:', error);
    }
}

debugIsac();
