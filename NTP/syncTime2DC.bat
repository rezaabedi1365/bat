@echo off
w32tm /config /syncfromflags:DOMHIER /reliable:YES /update
w32tm /resync /nowait
net stop w32time
net start w32time 
EOF
