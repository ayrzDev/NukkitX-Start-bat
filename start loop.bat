@echo off
TITLE Nukkit : Auto restart - Ayrz
cd /d %~dp0
netstat -o -n -a | findstr 0.0.0.0:19132>nul
if %ERRORLEVEL% equ 0 (
    echo Your server is running.
    goto :loop
) ELSE (
    echo Starting your Nukkit server.
    java -jar nukkit.jar
)

:loop
echo Starting Nukkit in 3 seconds...

netstat -o -n -a | findstr 0.0:19132>nul
if %ERRORLEVEL% equ 0 (
    echo Server is running.
    goto :loop
) ELSE (

    PING 127.0.0.1 -n 3 >NUL
    java -jar nukkit.jar
)

    IF EXIST nukkit.jar (
		echo ["Server Starting"]
		java -jar nukkit.jar
	) ELSE (
		ECHO [FATAL] No nukkit.jar file found!
	)

goto :loop
PAUSE