@ECHO OFF

DEL /F /Q "%~dp0..\mariadb\data\aria_log*"
DEL /F /Q "%~dp0..\mariadb\data\mysql-bin.*"
DEL /F /Q "%~dp0..\mariadb\data\*.err"
DEL /F /Q "%~dp0..\mariadb\data\*.log"
DEL /F /Q "%~dp0..\php\logs\*.log"
DEL /F /Q "%~dp0..\nginx\logs\*.log"
DEL /F /Q "%~dp0..\nginx\logs\*.old"

EXIT /B 0