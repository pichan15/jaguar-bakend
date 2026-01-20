import mysql from 'mysql2/promise';

async function checkSchema() {
    try {
        const connection = await mysql.createConnection({
            host: 'jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com',
            user: 'admin',
            password: 'kikomoreno1',
            database: 'jaguares_db'
        });

        const [rows] = await connection.execute('SHOW COLUMNS FROM categorias');
        console.log(JSON.stringify(rows, null, 2));
        await connection.end();
    } catch (error) {
        console.error('Error:', error);
    }
}

checkSchema();
