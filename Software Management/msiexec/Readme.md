# install
### From unc path
```
msiexec /i "\\file\Softbank\Manage Engine Patch Manager\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
```

### from local path
```
msiexec /i "C:\Users\r.abedi.FARADIS\Desktop\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
```

### From Current path
```
msiexec /i "UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt
```

### log in diffrent path
```
msiexec.exe /i "\\Server\Share\Setup.msi" /QN /L*V "C:\Temp\msilog.log"
```
# uninstall

### uninstall with msi path
```
msiexec /x <path to the MSI file> /l*v <path to the log file>
```

### uninstall with ProductCode (also known as Product GUID)
```
 Get-WmiObject Win32_Product | Where-Object { $_.Name -like "*ManageEngine*" } | Select-Object Name, IdentifyingNumber
```
<img width="524" height="46" alt="image" src="https://github.com/user-attachments/assets/5a3105dd-cc30-40a0-b874-1f2ab209e25d" />

```
msiexec /x <{ProductCode}> /qn
```
# How to uninstall an MSI via PowerShell Start-Process cmdlet
```
Start-Process "C:\Windows\System32\msiexec.exe" -ArgumentList "/x <ProductCode> /qn /l*v <path to the log file" -Wait
```

