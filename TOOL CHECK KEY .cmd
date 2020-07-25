goto :begin >nul

:begin
cls
@echo off&set local&color f3&title Tool Check Key Using Api Huyphung.com By : NguyenPhamAn-PepJimmy&cls&echo.
echo off 
echo Press 1: Check for update
echo Press 2: Check Key
choice /c:12 /n /m ">_"
if errorlevel 1 goto check
if errorlevel 2 goto key
:check
echo Dowloading...
cd.
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://codeload.github.com/an8amc/Tool-Check-Key/zip/master', ' Check-key.zip') }
@echo Done!
cls 
goto begin
:key
echo Thank you for using tool "Check key". Please insert the key you want to check below.
Set /p "key1=  - Your Key : "
echo Checking key
for /f "tokens=*" %%b in ('powershell -Command "$req = [System.Net.WebRequest]::Create('https://huyphung.com/public-api/check-key?key=%key1%&token=gAAAAABfGobY9lyp_7XAz5FgrJSaf--0EUizjmFUkl2eI1EhC994zZGlkXpYMBrtJMJ_t0hVIB_KqCT7A1R4v-BNW_NOWwezv7IprnhIO4lceYJxAusOL-E=');$resp = New-Object System.IO.StreamReader $req.GetResponse().GetResponseStream(); $resp.ReadToEnd()"') do set Key=%%b
goto :phase1

:phase1
echo %key% |findstr Count
if %errorlevel% EQU 0 (goto :resultmak)
if %errorlevel% EQU 1 (goto :phase2)

:phase2
echo %key% |findstr invalid
cls
if %errorlevel% EQU 0 (echo Key is invalid or not supported. Please try checking another key & pause & goto :begin)
if %errorlevel% EQU 1 (goto :resultother)

:resultmak
for /f "tokens=2 delims=\" %%a in ('echo %key%') do set Desc=%%a
for /f "tokens=3 delims=\" %%b in ('echo %key%') do set Sub=%%b
for /f "tokens=4 delims=\" %%c in ('echo %key%') do set count=%%c
for /f "tokens=5 delims=\" %%d in ('echo %key%') do set Error=%%d
for /f "tokens=6 delims=\" %%e in ('echo %key%') do set Time=%%e

set Description=%Desc:~1,1000% >nul
set Subtype=%Sub:~1,1000% >nul
set count1=%count:~1,1000% >nul
set Errorcode=%Error:~1,1000% >nul
set Timecheck=%Time:~1,1000% >nul

cls
echo ====================================================
echo Key: %key1%
echo %Description%
echo %Subtype%
echo %count1%
echo %Errorcode%
echo %Timecheck%
echo ====================================================
echo What would you like to do?
echo Check another key			Press (A)    
echo Exit					Press (B)
echo ====================================================
Choice /N /C ABC /M "*Please enter your choice:
if ERRORLEVEL 2 (exit)
if ERRORLEVEL 1 (goto :begin)

:resultother
for /f "tokens=2 delims=\" %%a in ('echo %key%') do set Desc=%%a
for /f "tokens=3 delims=\" %%b in ('echo %key%') do set Sub=%%b
for /f "tokens=4 delims=\" %%d in ('echo %key%') do set Error=%%d
for /f "tokens=5 delims=\" %%e in ('echo %key%') do set Time=%%e

set Description=%Desc:~1,1000% >nul
set Subtype=%Sub:~1,1000% >nul
set Errorcode=%Error:~1,1000% >nul
set Timecheck=%Time:~1,1000% >nul

cls
echo ====================================================
echo Key: %key1%
echo %Description%
echo %Subtype%
echo %Errorcode%
echo %Timecheck%
echo ====================================================
echo What would you like to do?
echo Check another key			Press (A)    
echo Exit					Press (B)
echo ====================================================
Choice /N /C ABC /M "*Please enter your choice:
if ERRORLEVEL 2 (exit)
if ERRORLEVEL 1 (goto :begin)

