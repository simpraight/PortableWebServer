@ECHO OFF

set PHP_PATH=%~dp0..\php
set PHP_PORT=9001
set NGINX_PATH=%~dp0..\nginx
set NGINX_PORT=8000
set MYSQL_PATH=%~dp0..\mariadb
set MYSQL_PORT=3336
set PHP_FCGI_MAX_REQUESTS=0

CD %~dp0..

.\bin\hstart /NOCONSOLE """%MYSQL_PATH%\bin\mysqld.exe"" --datadir=""%MYSQL_PATH%\data"" --innodb_data_home_dir=""%MYSQL_PATH%\data"" --innodb_log_group_home_dir=""%MYSQL_PATH%\data"" --init-file ""%MYSQL_PATH%\my.ini"""

.\bin\hstart /NOCONSOLE """%PHP_PATH%\php-cgi.exe"" -b 127.0.0.1:%PHP_PORT% -c ""%PHP_PATH%\php.ini"""

.\bin\hstart """%NGINX_PATH%\nginx.exe"" -p ""%NGINX_PATH%"""


:MYSQLCHECK
"%MYSQL_PATH%\bin\mysqladmin.exe" -P %MYSQL_PORT% ping >NUL

IF ERRORLEVEL 1 GOTO MYSQLCHECK


exit /b 0