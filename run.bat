@echo off
rem Usage: run.bat [sample] [args...]   e.g. run.bat game_ui shot modal
cd /d "%~dp0"
set SAMPLE=%~1
if "%SAMPLE%"=="" set SAMPLE=basic
if not exist ".\src\%SAMPLE%\main.odin" exit /b 1
set ARGS=
for /f "tokens=1,* delims= " %%a in ("%*") do set ARGS=%%b
if not exist build mkdir build
odin build ".\src\%SAMPLE%" -collection:olib=..\olib -out:"build\%SAMPLE%.exe"
if errorlevel 1 exit /b %errorlevel%
"build\%SAMPLE%.exe" %ARGS%
