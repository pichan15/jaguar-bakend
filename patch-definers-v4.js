import fs from 'fs';

const filePath = 'fix-definers-v4.sql';

try {
    if (!fs.existsSync(filePath)) {
        console.error(`❌ Error: El archivo ${filePath} no existe.`);
        process.exit(1);
    }

    console.log(`📖 Leyendo ${filePath}...`);
    let content = fs.readFileSync(filePath, 'utf8');

    // Reemplazo robusto de DEFINER
    let fixedContent = content.replace(/DEFINER\s*=\s*`[^`]+`@`[^`]+`/gi, 'DEFINER=`admin`@`%`');
    fixedContent = fixedContent.replace(/DEFINER\s*=\s*'[^']+'@'[^']+'/gi, "DEFINER='admin'@'%'");

    // Eliminar posibles bloqueos de tablas que también causan errores en restore si faltan permisos
    fixedContent = fixedContent.replace(/LOCK TABLES/gi, '-- LOCK TABLES');
    fixedContent = fixedContent.replace(/UNLOCK TABLES/gi, '-- UNLOCK TABLES');

    fs.writeFileSync(filePath, fixedContent);
    console.log('✅ Archivo V4 parcheado correctamente.');

} catch (error) {
    console.error('❌ Error fatal parcheando V4:', error);
    process.exit(1);
}
