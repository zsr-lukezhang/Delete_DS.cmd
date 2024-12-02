@echo off
setlocal

REM Check if folder path is provided
if "%~1"=="" (
    set /p targetFolder=Please enter the folder path:
) else (
    set "targetFolder=%~1"
)

REM Remove quotes from the target folder path if they exist
set targetFolder=%targetFolder:"=%

REM Check if the target folder exists
if not exist "%targetFolder%" (
    echo Folder does not exist: "%targetFolder%"
    exit /b 1
)

REM Delete all .DS_Store files
for /r "%targetFolder%" %%f in (.DS_Store) do (
    if exist "%%f" (
        echo Deleting file: "%%f"
        del "%%f"
    )
)

echo Done.
endlocal