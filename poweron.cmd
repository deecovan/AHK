@rem QRes.exe /x:1366 /y:768
@rem cls
@rem powercfg /s 6781f8b6-d310-490a-941d-85800813dc7b
netsh interface set interface "Wi-Fi" admin=enable
timeout /t 05 /nobreak
ping youtube.com -n 1
timeout /t 05 /nobreak
ping bing.com -n 1
pause
