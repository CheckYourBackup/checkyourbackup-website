@echo off
setlocal EnableExtensions

rem Build dist_web\ — ready-to-upload folder for Freehostia FTP.
rem Run from the project root:
rem   scripts\build_dist_web.bat

cd /d "%~dp0.."
set "ROOT=%CD%"
set "OUT=%ROOT%\dist_web"

echo ==^> Building %OUT%

if exist "%ROOT%\instagram\captures\app\screenshot-start.png" (
  echo ==^> Syncing app screenshots from instagram\captures\app\
  call "%~dp0sync_app_screenshots.bat"
)

if exist "%OUT%" rmdir /s /q "%OUT%"
mkdir "%OUT%\downloads"

copy /y "%ROOT%\index.html" "%OUT%\" >nul
copy /y "%ROOT%\robots.txt" "%OUT%\" >nul
copy /y "%ROOT%\sitemap.xml" "%OUT%\" >nul
copy /y "%ROOT%\site.webmanifest" "%OUT%\" >nul
if exist "%ROOT%\.htaccess" copy /y "%ROOT%\.htaccess" "%OUT%\" >nul

xcopy /e /i /q /y "%ROOT%\assets" "%OUT%\assets\" >nul
xcopy /e /i /q /y "%ROOT%\docs" "%OUT%\docs\" >nul
if exist "%ROOT%\blog" xcopy /e /i /q /y "%ROOT%\blog" "%OUT%\blog\" >nul

copy /y "%ROOT%\downloads\releases.js" "%OUT%\downloads\" >nul

for /f %%A in ('dir /s /b /a-d "%OUT%" ^| find /c /v ""') do set FILECOUNT=%%A

echo.
echo Done. Upload the CONTENTS of dist_web\ to:
echo   checkyourbackup.com/public_html/
echo.
echo Files: %FILECOUNT%

endlocal
