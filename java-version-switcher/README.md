# Java Version Script

## Installing Multiple Java Versions

### Manually Setting the Java Environment Variables

Click on "Environment Variables…" and the following window opens:

    As the default version, I recommend the current release version, Java 19. Accordingly, you should make the following settings:

The top list ("User variables") should not contain any Java-related entries.
The lower list ("System variables") should contain an entry "JAVA_HOME = C:\Program Files\Java\jdk-19". If this entry does not exist, you can add it with "New…". If it exists but points to another directory, you can change it with "Edit…".
Delete the following entries under "Path" (if they exist):
C:\ProgramData\Oracle\Java\javapath
C:\Program Files (x86)\Common Files\Oracle\Java\javapath
Insert the following entry instead:
%JAVA_HOME%\bin

The last entry ensures that Path and JAVA_HOME are automatically consistent.

Attention: this only works for the default setting configured here. If you change JAVA_HOME via the command line, you have to adjust Path accordingly. But don't worry – the scripts you can download in the next step will do that automatically.

```
echo %JAVA_HOME%
java -version
```


To be able to call the scripts from anywhere, you have to add the directory to the "Path" environment variable (just like you did with "%JAVA_HOME%\bin" in the second step):


That is why there are not one but three scripts for each Java version:

* java<version>: Activates the Java version in the current command line.
* java<version>-user: Sets the Java version as the default version for your user account.
* java<version>-system: Sets the Java version as the default version for the entire system-

*Attention*: To set the system-wide Java version, you must open the command line as an administrator. Otherwise, you will get the error message "ERROR: Access to the registry path is denied.
