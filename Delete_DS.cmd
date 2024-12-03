@echo off
setlocal

REM Welcome & Information
echo.
echo Welcome!
echo DELETE_DS.CMD
echo GitHub repo: github.com/zsr-lukezhang/Delete_DS.cmd
echo by Luke Zhang
echo v1.1
echo.
echo How to use
echo The folder is C:\Folder for example.
echo Method 1 - Command Prompt
echo Run this command in the command prompt, NOT HERE:
echo Delete_DS.cmd "C:\Folder"
echo or
echo Delete_DS.cmd "C:\Folder\"
echo Method 2 - In-Script Input
echo Just type in the folder path, like:
echo "C:\Folder"
echo or
echo "C:\Folder\"
echo.
echo WARNING
echo Be careful! You MUST enter the path with the quotation marks if the path has spacing or other special symbols in the path!
echo.
echo TERMS OF USE
echo Although the creater of this script thinks this script will not delete any other data except .DS_Store file, you should backup the files. The creater is NOT responsible for any damage. Only the RUNNER of this script, YOU, is responsible for any damage you make.
echo If you agree with the terms, please press any key to continue; otherwise, close this window.
echo Agree?
pause>nul

REM Check if folder path is provided
if "%~1"=="" (
    set /p targetFolder=Please enter the folder path, or just press Enter for the current path:
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
echo Press any key to exit...
pause>nul
endlocal