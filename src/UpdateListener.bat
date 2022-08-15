@echo off & setlocal


setlocal EnableDelayedExpansion

set multiLine=^

Get the latest version of the RobloxPlayerBeta.exe automatically^
  


echo !multiLine!




echo.>"_a%%_b%%_a%\Downloads\file.txt"
echo.>"_a%%_b%%_a%\Downloads\file2.txt"
echo.>"_a%%_b%%_a%\Downloads\file3.txt"
echo.>"_a%%_b%%_a%\Downloads\file4.txt"



Set _a=%
Set _b=%userprofile%

curl.exe -o %_a%%_b%%_a%\Downloads\file.txt http://setup.roblox.com/DeployHistory.txt 


FindStr /I  "WindowsPlayer" "%_a%%_b%%_a%\Downloads\file.txt" > "%_a%%_b%%_a%\Downloads\file2.txt"
FindStr /I  "RCCService" "%_a%%_b%%_a%\Downloads\file.txt" > "%_a%%_b%%_a%\Downloads\file3.txt"
FindStr /I  "Studio64" "%_a%%_b%%_a%\Downloads\file.txt" > "%_a%%_b%%_a%\Downloads\file4.txt"

For /F "UseBackQ Delims==" %%A In ("%_a%%_b%%_a%\Downloads\file2.txt") Do Set "lastline=%%A"

For /F "UseBackQ Delims==" %%A In ("%_a%%_b%%_a%\Downloads\file3.txt") Do Set "lastline2=%%A"

For /F "UseBackQ Delims==" %%A In ("%_a%%_b%%_a%\Downloads\file4.txt") Do Set "lastline3=%%A"

del %_a%%_b%%_a%\Downloads\file.txt
del %_a%%_b%%_a%\Downloads\file2.txt
del %_a%%_b%%_a%\Downloads\file3.txt
del %_a%%_b%%_a%\Downloads\file4.txt

:echo %lastline%
echo %lastline:~26,16%
:echo %lastline2%
echo %lastline2:~23,16%
:echo %lastline3%
echo %lastline3:~21,16%


curl.exe -o %_a%%_b%%_a%\Downloads\RobloxPlayer.zip http://setup.roblox.com/version-%lastline:~26,16%-RobloxApp.zip


pause

