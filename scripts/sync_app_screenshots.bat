@echo off
setlocal EnableExtensions
set "ROOT=%~dp0.."
set "SRC=%ROOT%assets\img\app-screenshots"
set "DST=%ROOT%assets\img"

set "MISSING=0"
if not exist "%SRC%\screenshot-start.png" (echo Missing: %SRC%\screenshot-start.png & set "MISSING=1")
if not exist "%SRC%\screenshot-results.png" (echo Missing: %SRC%\screenshot-results.png & set "MISSING=1")
if not exist "%SRC%\report-pdf.png" (echo Missing: %SRC%\report-pdf.png & set "MISSING=1")

if "%MISSING%"=="1" (
  echo Save PNG exports from the app. See assets\img\app-screenshots\README.md
  exit /b 1
)

copy /y "%SRC%\screenshot-start.png" "%DST%\screenshot-start.png" >nul
copy /y "%SRC%\screenshot-results.png" "%DST%\screenshot-results.png" >nul
copy /y "%SRC%\report-pdf.png" "%DST%\report-pdf.png" >nul

echo Updated screenshot-start.png, screenshot-results.png, report-pdf.png
echo Done. Run: scripts\build_dist_web.bat
endlocal
