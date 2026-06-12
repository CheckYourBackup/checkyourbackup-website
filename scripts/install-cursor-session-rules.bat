@echo off
setlocal EnableExtensions

rem Copy hola/adios Cursor rules to another project.
rem Usage: scripts\install-cursor-session-rules.bat C:\path\to\target-project [--with-website-project-rule]

if "%~1"=="" (
  echo Usage: %~nx0 C:\path\to\target-project [--with-website-project-rule]
  exit /b 1
)

set "TARGET=%~1"
set "SOURCE=%~dp0.."
set "RULES=%TARGET%\.cursor\rules"

if not exist "%SOURCE%\.cursor\rules\hola-adios-global.mdc" (
  echo Error: missing hola-adios-global.mdc
  exit /b 1
)

if not exist "%RULES%" mkdir "%RULES%"

copy /y "%SOURCE%\.cursor\rules\hola-adios-global.mdc" "%RULES%\" >nul

if /i "%~2"=="--with-website-project-rule" (
  copy /y "%SOURCE%\.cursor\rules\hola-adios-project.mdc" "%RULES%\" >nul
  echo Installed: hola-adios-global.mdc + hola-adios-project.mdc ^(website^)
) else (
  echo Installed: hola-adios-global.mdc only
  echo Tip: add --with-website-project-rule to copy the website overlay
)

echo Target: %RULES%
echo Next: cd "%TARGET%" ^&^& git add .cursor/rules ^&^& git commit -m "Add hola/adios Cursor session workflow rules"

endlocal
