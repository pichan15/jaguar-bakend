import fs from 'fs';

const filePath = 'triggers-fix-v2.sql';

try {
    if (!fs.existsSync(filePath)) {
        console.error(`❌ Error: El archivo ${filePath} no existe.`);
        process.exit(1);
    }

    let content = fs.readFileSync(filePath, 'utf8');

    // Reemplazar definers problemáticos
    // Buscamos cualquier DEFINER=... y lo forzamos a admin@%
    const fixedContent = content
        .replace(/DEFINER=`[^`]+`@`[^`]+`/gi, 'DEFINER=`admin`@`%`')
        .replace(/DEFINER = '[^']+'@'[^']+'/gi, "DEFINER = 'admin'@'%'");

    fs.writeFileSync(filePath, fixedContent);
    console.log('✅ Triggers V2 corregidos: DEFINER actualizado a admin@%');

} catch (error) {
    console.error('❌ Error procesando el archivo:', error);
    process.exit(1);
}
