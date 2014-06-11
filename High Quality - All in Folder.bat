@echo off
set CurrentDirectory=%~dp0

For /R %1 %%X in (*.jpg *.jpeg) DO ("%CurrentDirectory%jpeg-recompress.exe" "%%X" "%%X" -q high)

@pause
