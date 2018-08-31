:loop
for /d %%F in (dir %FolderToDelete%\sf-*) do rmdir /s /q %%F
taskkill /f /im "FabricDCA.exe"
ping -n %SleepInterval% 127.0.0.1>nul
goto loop
