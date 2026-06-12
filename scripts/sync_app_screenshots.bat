@echo off
setlocal EnableExtensions
set "ROOT=%~dp0.."
set "SRC=%ROOT%instagram\captures\app"
set "FALLBACK=%ROOT%assets\img\app-screenshots"
set "DST=%ROOT%assets\img"

if not exist "%SRC%\screenshot-start.png" (
  if exist "%FALLBACK%\screenshot-start.png" (
    set "SRC=%FALLBACK%"
    echo Using fallback: assets\img\app-screenshots\
  ) else (
    echo Missing: %ROOT%instagram\captures\app\screenshot-start.png
    echo Save app PNGs in instagram\captures\app\
    exit /b 1
  )
) else (
  echo Source: instagram\captures\app\
)

set "MISSING=0"
if not exist "%SRC%\screenshot-start.png" (echo Missing screenshot-start.png & set "MISSING=1")
if not exist "%SRC%\screenshot-results.png" (echo Missing screenshot-results.png & set "MISSING=1")
if not exist "%SRC%\report-pdf.png" (echo Missing report-pdf.png & set "MISSING=1")
if "%MISSING%"=="1" exit /b 1

copy /y "%SRC%\screenshot-start.png" "%DST%\screenshot-start.png" >nul
copy /y "%SRC%\screenshot-results.png" "%DST%\screenshot-results.png" >nul
copy /y "%SRC%\report-pdf.png" "%DST%\report-pdf.png" >nul

echo Updated assets\img\screenshot-start.png
echo Updated assets\img\screenshot-results.png
echo Updated assets\img\report-pdf.png
echo Done. Run: scripts\build_dist_web.bat
endlocal
