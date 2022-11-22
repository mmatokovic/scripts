@echo off
set JAVA_HOME=C:\Program Files\Java\jdk-19
setx JAVA_HOME "%JAVA_HOME%"
set Path=%JAVA_HOME%\bin;%Path%
echo Java 19 activated as user default.
