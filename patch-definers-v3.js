import fs from 'fs';

const filePath = 'fix-definers.sql';

try {
    if (!fs.existsSync(filePath)) {
        console.error(`❌ Error: El archivo ${filePath} no existe.`);
        process.exit(1);
    }

    console.log(`📖 Leyendo ${filePath}...`);
    let content = fs.readFileSync(filePath, 'utf8');

    // 1. Eliminar cualquier DEFINER existente para que MySQL use el usuario actual (admin)
    //    o reemplazarlo explícitamente por admin.
    //    Regex explicada: DEFINER = (cualquier cosa entre comillas o backticks) @ (cualquier cosa entre comillas o backticks)

    let fixedContent = content.replace(/DEFINER\s*=\s*`[^`]+`@`[^`]+`/gi, 'DEFINER=`admin`@`%`');
    fixedContent = fixedContent.replace(/DEFINER\s*=\s*'[^']+'@'[^']+'/gi, "DEFINER='admin'@'%'");

    // Seguridad adicional: Asegurar que no quede ningún root@localhost suelto
    fixedContent = fixedContent.replace(/root@localhost/gi, 'admin@%');

    fs.writeFileSync(filePath, fixedContent);
    console.log('✅ Archivo parcheado correctamente. DEFINERs actualizados a admin@%');

} catch (error) {
    console.error('❌ Error fatal parcheando el archivo:', error);
    process.exit(1);
}
