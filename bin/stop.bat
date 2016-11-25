@ECHO OFF

SET MYSQL_PORT=3336

PUSHD %~dp0..\


::
:: nginx.exe
::
cd .\nginx
nginx -s stop

::
:: php-cgi.exe
::
FOR /F "usebackq tokens=5 delims= " %%A IN (`NETSTAT -aon ^| find "LISTENING" ^| find "127.0.0.1:9001"`) DO (

  CALL :STOP_PHP %%A

)

:: TASKKILL /F /IM nginx.exe >NUL
:: TASKKILL /F /IM php-cgi.exe >NUL
cd ..\mariadb
.\bin\mysqladmin.exe -u root -P %MYSQL_PORT% shutdown >NUL

POPD
EXIT /B 0

:STOP_PHP
  SET PID=%1
  TASKLIST /FI "PID eq %PID%" | FIND "php-cgi.exe" >NUL
  IF ERRORLEVEL 0 TASKKILL /F /T /FI "PID eq %PID%" 
  GOTO :EOF