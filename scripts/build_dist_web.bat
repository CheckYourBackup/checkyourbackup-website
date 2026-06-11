@echo off
setlocal EnableExtensions

rem Build dist_web\ — ready-to-upload folder for Freehostia FTP.
rem Run from the project root:
rem   scripts\build_dist_web.bat

cd /d "%~dp0.."
set "ROOT=%CD%"
set "OUT=%ROOT%\dist_web"

echo ==^> Building %OUT%

if exist "%OUT%" rmdir /s /q "%OUT%"
mkdir "%OUT%\downloads"

copy /y "%ROOT%\index.html" "%OUT%\" >nul
copy /y "%ROOT%\robots.txt" "%OUT%\" >nul
copy /y "%ROOT%\sitemap.xml" "%OUT%\" >nul
if exist "%ROOT%\sitemap.php" copy /y "%ROOT%\sitemap.php" "%OUT%\" >nul
copy /y "%ROOT%\site.webmanifest" "%OUT%\" >nul
if exist "%ROOT%\.htaccess" copy /y "%ROOT%\.htaccess" "%OUT%\" >nul

xcopy /e /i /q /y "%ROOT%\assets" "%OUT%\assets\" >nul
xcopy /e /i /q /y "%ROOT%\docs" "%OUT%\docs\" >nul
if exist "%ROOT%\blog" xcopy /e /i /q /y "%ROOT%\blog" "%OUT%\blog\" >nul

copy /y "%ROOT%\downloads\releases.js" "%OUT%\downloads\" >nul

> "%OUT%\LEEME-FTP.txt" (
echo CARPETA LISTA PARA SUBIR - Check Your Backup
echo ============================================
echo.
echo Sube TODO el contenido de esta carpeta ^(dist_web/^) al directorio
echo publico de tu dominio en Freehostia:
echo.
echo   checkyourbackup.com/public_html/
echo.
echo NO subas la carpeta "dist_web" en si: sube lo que hay DENTRO
echo ^(index.html, assets/, docs/, downloads/, etc.^).
echo.
echo Estructura que debe quedar en el servidor:
echo   public_html/
echo   +-- .htaccess
echo   +-- index.html
echo   +-- robots.txt
echo   +-- sitemap.xml
echo   +-- sitemap.php
echo   +-- site.webmanifest
echo   +-- assets/          ^(css, js, img incl. blog/^)
echo   +-- docs/            ^(user-guide, about, changelog^)
echo   +-- blog/            ^(articles and blog index^)
echo   +-- downloads/
echo       +-- releases.js  ^(metadatos de descarga - imprescindible^)
echo.
echo NO incluido a proposito:
echo   - CheckYourBackup-macOS-1.0.0.zip  ^(se descarga desde GitHub^)
echo   - AGENTS.md, README.md, etc.       ^(notas de desarrollo^)
echo.
echo Regenerar esta carpeta tras cambios en la web:
echo   scripts\build_dist_web.bat   ^(Windows^)
echo   bash scripts/build_dist_web.sh
echo.
echo Tras subir, comprueba:
echo   https://checkyourbackup.com/
echo   https://checkyourbackup.com/downloads/releases.js
)

for /f %%A in ('dir /s /b /a-d "%OUT%" ^| find /c /v ""') do set FILECOUNT=%%A

echo.
echo Done. Upload the CONTENTS of dist_web\ to:
echo   checkyourbackup.com/public_html/
echo.
echo Files: %FILECOUNT%

endlocal
