import fs from 'fs';

const filePath = 'triggers-fix.sql';

try {
    if (!fs.existsSync(filePath)) {
        console.error(`❌ Error: El archivo ${filePath} no existe.`);
        process.exit(1);
    }

    let content = fs.readFileSync(filePath, 'utf8');

    // Limpieza agresiva de DEFINERs
    // Reemplaza DEFINER=`root`@`localhost` y variantes por DEFINER=`admin`@`%`
    const fixedContent = content
        .replace(/DEFINER=`[^`]+`@`[^`]+`/g, 'DEFINER=`admin`@`%`')
        .replace(/DEFINER = 'root'@'localhost'/g, "DEFINER = 'admin'@'%'");

    fs.writeFileSync(filePath, fixedContent);
    console.log('✅ Triggers corregidos: DEFINER actualizado a admin@%');

} catch (error) {
    console.error('❌ Error procesando el archivo:', error);
    process.exit(1);
}
