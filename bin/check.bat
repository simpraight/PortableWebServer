@ECHO OFF

SET NGINX_STARTED=0
SET MYSQL_STARTED=0
SET PHP_STARTED=0


::
:: nginx.exe
::

FOR /F "usebackq tokens=5 delims= " %%A IN (`NETSTAT -aon ^| find "LISTENING" ^| find "0.0.0.0:8000"`) DO (

  CALL :CHK_NGINX %%A

)


::
:: mysqld.exe
::
FOR /F "usebackq tokens=5 delims= " %%A IN (`NETSTAT -aon ^| find "LISTENING" ^| find "0.0.0.0:3336"`) DO (

  CALL :CHK_MYSQL %%A

)


::
:: php-cgi.exe
::

FOR /F "usebackq tokens=5 delims= " %%A IN (`NETSTAT -aon ^| find "LISTENING" ^| find "127.0.0.1:9001"`) DO (

  CALL :CHK_PHP %%A

)


SET /A STARTED=0 + NGINX_STARTED * MYSQL_STARTED * PHP_STARTED

EXIT /b %STARTED%



:CHK_NGINX

  SET PID=%1
  TASKLIST /FI "PID eq %PID%" | FIND "nginx.exe" >NUL
  IF ERRORLEVEL 0 SET NGINX_STARTED=1
  GOTO :EOF


:CHK_MYSQL

  SET PID=%1
  TASKLIST /FI "PID eq %PID%" | FIND "mysqld.exe" >NUL
  IF ERRORLEVEL 0 SET MYSQL_STARTED=1
  GOTO :EOF


:CHK_PHP

  SET PID=%1
  TASKLIST /FI "PID eq %PID%" | FIND "php-cgi.exe" >NUL
  IF ERRORLEVEL 0 SET PHP_STARTED=1
  GOTO :EOF
