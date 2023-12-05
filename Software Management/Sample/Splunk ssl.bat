@echo
cd C:\Program Files\SplunkUniversalForwarder\etc\system\local
type server.conf >> "server.conf.back"
echo [sslConfig] >server2.conf
echo sslRootCAPath = C:\Program Files\SplunkUniversalForwarder\etc\auth\cacert.pem >server3.conf
type server3.conf >> "server2.conf"
type server2.conf >> "server.conf"
del /f "server2.conf"
del /f "server3.conf"
