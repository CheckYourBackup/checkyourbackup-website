@echo off
setlocal EnableExtensions
set "ROOT=%~dp0.."
set "SRC=%ROOT%assets\img\app-screenshots"
set "DST=%ROOT%assets\img"

if not exist "%SRC%\screenshot-start.png" (
  echo Missing: %SRC%\screenshot-start.png
  echo Export from the desktop app. See assets\img\app-screenshots\README.md
  exit /b 1
)
if not exist "%SRC%\screenshot-results.png" (
  echo Missing: %SRC%\screenshot-results.png
  exit /b 1
)

copy /y "%SRC%\screenshot-start.png" "%DST%\screenshot-start.png" >nul
copy /y "%SRC%\screenshot-results.png" "%DST%\screenshot-results.png" >nul
echo Updated assets\img\screenshot-start.png and screenshot-results.png
echo Done. Run: scripts\build_dist_web.bat
endlocal
