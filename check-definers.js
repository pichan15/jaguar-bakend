import mysql from 'mysql2/promise';

async function checkDefiners() {
    try {
        const connection = await mysql.createConnection({
            host: 'jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com',
            user: 'admin',
            password: 'kikomoreno1',
            database: 'jaguares_db'
        });

        console.log("🔍 Escaneando 'DEFINER' incorrectos (root@localhost)...");

        // 1. Verificar Triggers
        const [triggers] = await connection.execute(`
            SELECT TRIGGER_NAME, DEFINER 
            FROM information_schema.TRIGGERS 
            WHERE DEFINER LIKE '%root%' AND TRIGGER_SCHEMA = 'jaguares_db'
        `);

        // 2. Verificar Rutinas (Procedures/Functions)
        const [routines] = await connection.execute(`
            SELECT ROUTINE_NAME, ROUTINE_TYPE, DEFINER 
            FROM information_schema.ROUTINES 
            WHERE DEFINER LIKE '%root%' AND ROUTINE_SCHEMA = 'jaguares_db'
        `);

        // 3. Verificar Vistas
        const [views] = await connection.execute(`
            SELECT TABLE_NAME, DEFINER 
            FROM information_schema.VIEWS 
            WHERE DEFINER LIKE '%root%' AND TABLE_SCHEMA = 'jaguares_db'
        `);

        if (triggers.length === 0 && routines.length === 0 && views.length === 0) {
            console.log("✅ TODO CORRECTO: No existen objetos definidos por 'root'.");
        } else {
            console.log("⚠️ ADVERTENCIA: Se encontraron objetos con definer incorrecto:");
            if (triggers.length > 0) console.log("Triggers:", triggers);
            if (routines.length > 0) console.log("Rutinas:", routines);
            if (views.length > 0) console.log("Vistas:", views);
        }

        await connection.end();
    } catch (error) {
        console.error('❌ Error de conexión:', error);
    }
}

checkDefiners();
