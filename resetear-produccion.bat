@echo off
REM ====================================================================
REM RESETEAR PRODUCCION (LIMPIAR DATOS DE PRUEBA)
REM ====================================================================
REM Borra Alumnos, Pagos e Inscripciones. Mantiene configuraciones.
REM ====================================================================

color 4F
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║           ¡PELIGRO! BORRADO DE DATOS DE PRUEBA             ║
echo ║        JAGUARES - BASE DE DATOS DE PRODUCCION (AWS)        ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo ESTAS A PUNTO DE BORRAR:
echo   - TODOS los Alumnos registrados
echo   - TODAS las Inscripciones
echo   - TODOS los Pagos
echo.
echo   * Se conservaran: Deportes, Horarios, Categorias y Admins.
echo.
echo ⚠️  ASEGURATE DE TENER UN BACKUP ANTES DE CONTINUAR ⚠️
echo.

set /p CONFIRM=Escribe "BORRAR" (mayusculas) para confirmar: 

if "%CONFIRM%"=="BORRAR" (
    echo.
    echo 🔄 Conectando a AWS RDS y limpiando datos...
    
    cmd /c "mysql -h jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com -u admin -pkikomoreno1 jaguares_db < limpiar-datos-prueba.sql"
    
    echo.
    echo ✅ LIMPIEZA COMPLETADA. El sistema esta como nuevo.
    echo.
) else (
    echo.
    echo ❌ Accion cancelada. No se borro nada.
    echo.
)

pause
