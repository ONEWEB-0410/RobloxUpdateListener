@echo off

setlocal

cd /d %~dp0

Set _a=%
Set _b=%userprofile%

Call :UnZipFile "%_a%%_b%%_a%\Downloads\" "%_a%%_b%%_a%\Downloads\RobloxPlayer.zip"


exit /b


:UnZipFile <ExtractTo> <newzipfile>

set vbs="%temp%\_.vbs"

if exist %vbs% del /f /q %vbs%

>>%vbs% echo Set fso = CreateObject("Scripting.FileSystemObject")

>>%vbs% echo If NOT fso.FolderExists(%1) Then

>>%vbs% echo fso.CreateFolder(%1)

>>%vbs% echo End If

>>%vbs% echo set objShell = CreateObject("Shell.Application")

>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items

>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)

>>%vbs% echo Set fso = Nothing

>>%vbs% echo Set objShell = Nothing

cscript //nologo %vbs%


if exist %vbs% del /f /q %vbs%

FOR /F "delims=" %%i IN ('dir "%_a%%_b%%_a%\AppData\Local\Roblox\Versions" /b /ad-h /t:c /od') DO SET a=%%i


if exist %_a%%_b%%_a%\AppData\Local\Roblox\Versions\%a% (echo "Loading...") else (echo "ERROR!")

del %_a%%_b%%_a%\AppData\Local\Roblox\Versions\%a%\RobloxPlayerBeta.exe

copy "%_a%%_b%%_a%\Downloads\RobloxPlayerBeta.exe" "%_a%%_b%%_a%\AppData\Local\Roblox\Versions\%a%" 

del %_a%%_b%%_a%\Downloads\RobloxPlayer.zip
del %_a%%_b%%_a%\Downloads\COPYRIGHT.txt
del %_a%%_b%%_a%\Downloads\RobloxPlayerBeta.exe

echo "Replaced succesfully !"

pause