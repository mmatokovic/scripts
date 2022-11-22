@echo off
set JAVA_HOME=C:\Program Files\Java\jdk-20
setx JAVA_HOME "%JAVA_HOME%" /M
set Path=%JAVA_HOME%\bin;%Path%
echo Java 20 activated as system-wide default.
