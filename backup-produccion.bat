@echo off
REM ====================================================================
REM SCRIPT DE BACKUP PRODUCCIÓN - JAGUARES (AWS RDS)
REM ====================================================================
REM Este script conecta a AWS RDS y descarga una copia completa de la DB
REM ====================================================================

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║          BACKUP PRODUCCIÓN AWS RDS - JAGUARES              ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Configuración AWS RDS
set DB_USER=admin
set DB_PASS=kikomoreno1
set DB_HOST=jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com
set DB_PORT=3306
set DB_NAME=jaguares_db

REM Crear carpeta de backups si no existe
if not exist "backups-prod" mkdir backups-prod

REM Generar nombre de archivo con fecha y hora
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set FECHA=%datetime:~0,8%
set HORA=%datetime:~8,6%
set TIMESTAMP=%FECHA%-%HORA%

set BACKUP_FILE=backups-prod\backup-jaguares-PROD-%TIMESTAMP%.sql

echo 📅 Fecha: %FECHA:~0,4%-%FECHA:~4,2%-%FECHA:~6,2%
echo ⏰ Hora: %HORA:~0,2%:%HORA:~2,2%:%HORA:~4,2%
echo 🌐 Conectando a AWS RDS...
echo 📁 Archivo destino: %BACKUP_FILE%
echo.
echo 🔄 Descargando datos... (Esto puede tardar unos segundos)
echo.

REM Ejecutar mysqldump con opciones de compatibilidad RDS
mysqldump -u %DB_USER% -p%DB_PASS% -h %DB_HOST% -P %DB_PORT% ^
  --databases %DB_NAME% ^
  --routines ^
  --triggers ^
  --events ^
  --single-transaction ^
  --set-gtid-purged=OFF ^
  --column-statistics=0 ^
  --no-tablespaces ^
  --result-file="%BACKUP_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ BACKUP DE PRODUCCIÓN COMPLETADO EXITOSAMENTE
    echo.
    echo 📊 Información del backup:
    for %%A in ("%BACKUP_FILE%") do (
        echo    Tamaño: %%~zA bytes
        echo    Ubicación: %%~fA
    )
    echo.
) else (
    echo.
    echo ❌ ERROR AL CREAR BACKUP REMOTO
    echo    Verifica tu conexión a internet y acceso a AWS.
    echo.
)

echo Presiona cualquier tecla para salir...
pause >nul
