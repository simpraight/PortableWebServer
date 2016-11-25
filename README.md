Portable Web Server
===================

1.Overview
-----------
This is a program that can be used by launching a web server using PHP and MariaDB in a portable storage such as a USB memory in a Windows environment.
Since it is only a simple structure, please deploy various binaries in the folder for actual use.

2. How to use
--------------
First of all, please deploy binaries for Windows of each middleware (PHP, Mysql, Nginx) in the folder.
Be careful not to overwrite the originally prepared configuration file at that time.

When you are ready, execute "start.bat" in the bin folder and start up the portable server.
To stop the server, please execute "stop.bat".

By default, the following ports are used.

- php-fcgi 9001
- MariaDB 3336
- Nginx 8000

To use a different port, please modify each setting file and "start.bat", "stop.bat".

3. Application installation
----------------------------
The "web \ public" folder is the document root. Please create an entry point of your web application in this folder.
When creating the application, please do not write the code using the absolute path, always try to use the relative path.
Then, in many cases, even if you bring it to another environment, you should be able to move it as it is.