####################install################################
#https://www.manageengine.com/products/desktop-central/silent-agent-installation.html

#From unc path
msiexec /i "\\file\Softbank\Manage Engine Patch Manager\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt

#from local path
msiexec /i "C:\Users\r.abedi.FARADIS\Desktop\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt

#From Current path
msiexec /i "UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /lv "Agentinstalllog.txt


#log in diffrent path
msiexec.exe /i "\\Server\Share\Setup.msi" /QN /L*V "C:\Temp\msilog.log"
####################uninstall##############################
https://www.advancedinstaller.com/how-to-uninstall-msi-package.html

msiexec /x <path to the MSI file> /l*v <path to the log file>

# How to uninstall the MSI with msiexec using the ProductCode (also known as Product GUID)
msiexec /x <{ProductCode}>

# How to uninstall an MSI via PowerShell Start-Process cmdlet
Start-Process "C:\Windows\System32\msiexec.exe" -ArgumentList "/x <ProductCode> /qn /l*v <path to the log file" -Wait

# How to silently uninstall an MSI package?
 msiexec /x <{ProductCode}> /qn
