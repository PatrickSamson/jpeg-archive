@echo off
set UserDesktop=%UserProfile%\Desktop
set CurrentDirectory=%~dp0

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)

Set DestinationFolder=%UserDesktop%\Compressed %mydate%_%mytime%
if not exist "%DestinationFolder%" mkdir "%DestinationFolder%"

if [%1]==[] goto :eof
:loop
For %%A in (%1) do (
    Set FileFolder=%%~dpA
    Set FileName=%%~nxA
)
Set DestinationFile=%DestinationFolder%\%FileName%
@echo %1
@echo %DestinationFile%
"%CurrentDirectory%jpeg-recompress.exe" %1 %1
shift
if not [%1]==[] goto loop
@pause
