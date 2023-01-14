::This script was created by Noah Boyer to help mitigate the issues with QB where the database connector does not launch correctly. This should help to restart the services associated in order to hopefully help with it getting stuck on the port. I have also allowed all ports for the quickbooks applications on the local firewall to also help with the port getting stuck. 

powershell -window hidden -command ""
@ECHO Off


::--------------This is for QB Monitor Service
net stop "QBCFMonitorService"
timeout 5 /nobreak
net start "QBCFMonitorService"



timeout 5 /nobreak



::--------------This is for QBIDPService
::net stop "QBIDPService"
::timeout 5 /nobreak
::net start "QBIDPService"


::timeout 5 /nobreak



::--------------This is for QB Database Manager
net stop "QuickBooksDB31"
timeout 5 /nobreak
net start "QuickBooksDB31"


::Creates a txt file that logs stopping and starting of services - must already have folder created


::Logging for QBCFMonitorService
echo %date% %time% QBCFMonitorService service stopped >> C:/QB-ServiceLogs/QBServices.txt
echo %date% %time% QBCFMonitorService service started >> C:/QB-ServiceLogs/QBServices.txt

::Logging for QuickBooksDB31
echo %date% %time% QuickBooksDB31 service stopped >> C:/QB-ServiceLogs/QBServices.txt
echo %date% %time% QuickBooksDB31 service started >> C:/QB-ServiceLogs/QBServices.txt

::Logging for QBIDPService but at the moment is not needed. 
::echo %date% %time% QBIDPService service stopped >> C:/QB-ServiceLogs/QBServices.txt
::echo %date% %time% QBIDPService service started >> C:/QB-ServiceLogs/QBServices.txt