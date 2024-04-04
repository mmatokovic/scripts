# Usage info

## Linking packages scripts

Add to Windows Enviroment Variable

### link_packages.bat

* Use case: Link packages from old repository structure (all packages in one repository)
* First parameter:
  * Description: Repository from which packages are taken
  * Example: C:\Repositories\esb_test
* Second parameter:
  * Description: Directory where symbolic links are created
  * Example: C:\SoftwareAG\IntegrationServer\instances\default\packages

```bat
link_packages.bat C:\Repositories\esb_test C:\SoftwareAG\IntegrationServer\instances\default\packages
```

### link_packages_v2.bat

* Use case: Link packages from new repository structure (repository per package)
* First parameter:
  * Description: Parent folder of all cloned repositories
  * Example: C:\WMRepo
* Second parameter:
  * Description: Directory where symbolic links are created
  * Example: C:\SoftwareAG\IntegrationServer\instances\default\packages

```bat
C:\Users\mmatokovic\source\repos\scripts\link_packages\link_v2.bat C:\Users\mmatokovic\source\repos\Integration\webmethods C:\SoftwareAG\IntegrationServer\instances\default\packages v2
```

```bat
C:\Users\mmatokovic\source\repos\scripts\link_packages\link_v2.bat C:\Users\mmatokovic\source\repos\crosig\int-webmethods-project C:\SoftwareAG_10_11\IntegrationServer\instances\default\packages v2
```
