# SF-FolderCleaner
This is a Service Fabric application which was created as a workaround for a bug in SF clusters running containers, until a fix is released. It deletes sf-* folders under a specified directory (default: D:\SvcFab\Log\Containers\) every specified period of time (default: 12h) and then kills FabricDCA.exe process. It was created as a workaround for a bug in StandAlone clusters in v6.0.  This runs as admin to delete folders and restart the FabricDCA.exe process, users should be careful of their configuration to not cause damage to their clusters.

Example deployment:

```
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath .\SF-FolderCleaner-master\
Register-ServiceFabricApplicationType -ApplicationPathInImageStore SF-FolderCleaner-master
New-ServiceFabricApplication -ApplicationName fabric:/QueryTraceCleaner -ApplicationTypeName FolderCleanerType -ApplicationTypeVersion 1.0.0 -ApplicationParameter @{}
New-ServiceFabricService -Stateless -PartitionSchemeSingleton -ApplicationName fabric:/QueryTraceCleaner -ServiceName fabric:/QueryTraceCleaner/CleanerSvc -ServiceTypeName FolderCleanerType -InstanceCount -1
```
