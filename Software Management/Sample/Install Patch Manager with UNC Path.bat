@echo
msiexec /i "\\file\Softbank\Manage Engine Patch Manager\localsetup\UEMSAgent.msi" /qn TRANSFORMS="UEMSAgent.mst" ENABLESILENT=yes REBOOT=ReallySuppress INSTALLSOURCE=Manual SERVER_ROOT_CRT="%cd%\DMRootCA-Server.crt" DS_ROOT_CRT="%cd%\DMRootCA.crt" /l*v "C:\Agentinstalllog.txt
