# Java Version Script

[Java SE](https://www.oracle.com/java/technologies/java-se-glance.html)
[Java JDK](https://jdk.java.net/)

Check Your Java Version on Windows

```Bash
echo %JAVA_HOME% #$env:JAVA_HOME
java -version
```

Windows then offers "Edit the system environment variables"
Click on "Environment Variables…" and the following window opens:

As the default version, I recommend the current release version, Java 21

* The top list **("User variables")** should not contain any Java-related entries.
* The lower list **("System variables")** should contain an entry "`JAVA_HOME = C:\Program Files\Java\jdk-21`". If this entry does not exist, you can add it with "New…". If it exists but points to another directory, you can change it with "Edit…".
* Delete the following entries under "Path" (if they exist):
  * `C:\ProgramData\Oracle\Java\javapath`
  * `C:\Program Files (x86)\Common Files\Oracle\Java\javapath`
* Insert the following entry instead:
  * `%JAVA_HOME%\bin` entry ensures that Path and JAVA_HOME are automatically consistent.


## Installing Multiple Java Versions

First Download the Java version and save to `C:\Program Files\Java\`

Unpack the scripts to `C:\Program Files\Java\scripts`

To be able to call the scripts from anywhere, you have to add the directory to the "Path" environment variable (just like you did with "%JAVA_HOME%\bin" in the second step):

* Adding `C:\Program Files\Java\scripts` to the "Path" system variable
* Change java version `java20`

> The commands presented up to this point only affect the currently opened command line or PowerShell. As soon as you open another command line, the default version defined in step 2 is active again (Java 20, if you have not changed anything). **If you want to change the Java version permanently, just add the parameter "perm" to the corresponding command, e.g.**- `java21 perm`
