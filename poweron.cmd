powercfg /s 6781f8b6-d310-490a-941d-85800813dc7b
QRes.exe /x:1366 /y:768
netsh interface set interface "Wi-Fi" admin=enable
timeout /t 5 /nobreak
ping youtube.com
