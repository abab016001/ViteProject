@echo off
chcp 65001
setlocal enabledelayedexpansion

echo.
echo 【createVite】
echo.
:: ==========================================
call :step 1.確認已安裝Node.js 2.新建Vite專案
node -v
call :next

call :step 2.新建Vite專案 3.安裝相依套件
set /p projectName=請輸入專案名稱: 
if exist "%CD%\%projectName%" (call :warn 已存在%projectName%資料夾，請移除再建立專案 & goto :end)
start cmd /k "npm create vite@latest %projectName%"
call :next2

call :step 3.安裝相依套件 4.VSCode開啟專案
cd %projectName%
start cmd /k "npm install"
call :next2

call :step 4.VSCode開啟專案
code "%CD%"
goto :end

:: ==========================================
:step
echo _%1 ____預告下一動作_%2
echo.
goto :eof

:next
echo.
set /p resp=確認無誤請按Enter，結束程序請按 N。
if /i "%resp%"=="N" goto :end
echo.
echo.
goto :eof

:next2
echo.
set /p resp=確認完成請按Enter，結束程序請按 N。
if /i "%resp%"=="N" goto :end
echo.
echo.
goto :eof

:end
echo.
echo ==========================================
echo 程式結束
echo.
echo EXIT
pause > nul
exit

:warn
echo.
echo [Warn]-%1
goto :eof