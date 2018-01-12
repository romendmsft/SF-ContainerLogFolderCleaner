# SF-FolderCleaner
This is a Service Fabric application which deletes a folder on every SF node periodically.  It was created as a workaround for a bug in StandAlone clusters in v6.0.  This runs as admin and deletes a folder on every node, users should be careful of their configuration to not cause damage to their clusters.

Example deployment:

```
Copy-ServiceFabricApplicationPackage -ApplicationPackagePath .\SF-FolderCleaner-master\
Register-ServiceFabricApplicationType -ApplicationPathInImageStore SF-FolderCleaner-master
New-ServiceFabricApplication -ApplicationName fabric:/QueryTraceCleaner -ApplicationTypeName FolderCleanerType -ApplicationTypeVersion 1.0.0 -ApplicationParameter @{}
New-ServiceFabricService -Stateless -PartitionSchemeSingleton -ApplicationName fabric:/QueryTraceCleaner -ServiceName fabric:/QueryTraceCleaner/CleanerSvc -ServiceTypeName FolderCleanerType -InstanceCount -1
```
