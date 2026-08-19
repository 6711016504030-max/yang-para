@echo off
chcp 65001 >nul
title ระบบเซิร์ฟเวอร์สมาคมยางพาราไทย
echo ========================================================
echo   กำลังตรวจสอบและเริ่มต้นระบบเว็บสมาคมยางพาราไทย...
echo ========================================================

:: 1. ตรวจสอบและเริ่มการทำงานของ MySQL
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [OK] MySQL กำลังทำงานอยู่แล้ว
) else (
    echo [STARTING] กำลังเปิดบริการ MySQL...
    start "" /B "C:\xampp 1\mysql\bin\mysqld.exe" --defaults-file="C:\xampp 1\mysql\bin\my.ini"
)

:: 2. ตรวจสอบและเริ่มการทำงานของ Apache
tasklist /FI "IMAGENAME eq httpd.exe" 2>NUL | find /I /N "httpd.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [OK] Apache Web Server กำลังทำงานอยู่แล้ว
) else (
    echo [STARTING] กำลังเปิดบริการ Apache...
    start "" /B "C:\xampp 1\apache\bin\httpd.exe"
)

:: รอ 1 วินาทีให้เซิร์ฟเวอร์พร้อม
timeout /t 1 /nobreak >nul

echo ========================================================
echo   ระบบพร้อมใช้งานแล้ว! กำลังเปิดหน้าเว็บไซต์...
echo ========================================================

:: 3. เปิดเว็บเบราว์เซอร์อัตโนมัติ
start http://localhost/thai-rubber/

exit