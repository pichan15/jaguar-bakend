import mysql from 'mysql2/promise';

async function listTriggers() {
    try {
        const connection = await mysql.createConnection({
            host: 'jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com',
            user: 'admin',
            password: 'kikomoreno1',
            database: 'jaguares_db'
        });

        const [triggers] = await connection.execute('SHOW TRIGGERS');
        console.log("Triggers encontrados:");
        triggers.forEach(t => {
            console.log(`- Trigger: ${t.Trigger}, Definer: ${t.Definer}, Event: ${t.Event}, Table: ${t.Table}`);
            console.log(`  Statement: ${t.Statement}`);
        });

        await connection.end();
    } catch (error) {
        console.error('Error:', error);
    }
}

listTriggers();
