@echo off
mode con: cols=85 lines=35
title Flir crack
color 0f
:: C:\ProgramData\FLIR Systems\FLIR Reporter\Licensing\flir reporter.lic
:: C:\ProgramData\FLIR Systems\FLIR Reporter\Licensing\Backup\flir reporter.lic
:: C:\ProgramData\Package Cache\0D86A07760C6C5C2A239AC7A19B68598BAF9E361\flir\licensing\flir reporter.lic
:: registro da licenÃ§a HKEY_CURRENT_USER\Software\Microsoft\Lptr e Computador\HKEY_LOCAL_MACHINE\Software\Microsoft\Lptr
set lic=flir reporter.lic
set dirlic=C:\ProgramData\FLIR Systems\FLIR Reporter\Licensing\
set dirlic2=C:\ProgramData\Package Cache\0D86A07760C6C5C2A239AC7A19B68598BAF9E361\flir\licensing\
set dirlicbk=C:\ProgramData\FLIR Systems\FLIR Reporter\Licensing\Backup\
set licprotector=HKCU\Software\Microsoft\Lptr
set licprotector2=HKLM\Software\Microsoft\Lptr

echo               ____________________________________________________
echo              /                                                    \
echo             ^|    ______________________________________________    ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|  C:\^> _ Aguarde.....                         ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|______________________________________________^|   ^|
echo             ^|                                                      ^|
echo              \_____________________________________________________/
echo                     \_______________________________________/
echo                   _______________________________________________
echo                _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
echo             _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
echo          _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
echo       _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
echo   :-----------------------------------------------------------------------------:

:: este set /p=<nul ‚ igual a echo mas com a proxima saida na mesma linha
set /p=<nul ">   Verificando instala‡Æo do Flir Reporter....." 
wmic product get name | findstr /c:"FLIR Reporter" 2>&1 >nul || call :fail "FLIR Reporter"
timeout /t 3 2>1>nul
echo  OK
set /p=<nul ">   Verificando instala‡Æo do Microsoft word...."
wmic product get name | findstr /c:"Microsoft Word" 2>&1 >nul || call :fail "Microsoft Wod"
timeout /t 3 2>1>nul
echo  OK
timeout /t 3 2>1>nul
tasklist | find /i "word" 2>&1 >nul
if %errorlevel% == 0 (
	echo.
	echo ^>    O Word est  em execu‡Æo e ser  encerrado.
	echo ^>    Salve seu trabalho e aperte qualquer tecla para continuar.
	pause>nul
	taskkill /IM WINWORD.EXE 2>1>nul
)
if exist "%dirlic%%lic%" ( 
move "%dirlic%%lic%" "%dirlicbk%%date:/=-%_%lic%" 2>nul >nul || goto erro

)
if exist "%dirlic2%%lic%" ( 
move "%dirlic2%%lic%" "%dirlicbk%%date:/=-%_%lic%" 2>nul >nul || goto erro

)
copy /V /Y "%~dp0%lic%" "%dirlic2%" > nul 2>&1 || goto erro
copy /V /Y "%~dp0%lic%" "%dirlic%" > nul 2>&1
reg delete "%licprotector%" /va /f >nul
cls
mode con: cols=85 lines=29
color 1f
echo               ____________________________________________________
echo              /                                                    \
echo             ^|    ______________________________________________    ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|  C:\^> _ Licença renovada com sucesso         ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|            Desenvolvido por:                 ^|   ^|
echo             ^|   ^|            Fabricio E. Marcal                ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|                                              ^|   ^|
echo             ^|   ^|______________________________________________^|   ^|
echo             ^|                                                      ^|
echo              \_____________________________________________________/
echo                     \_______________________________________/
echo                   _______________________________________________
echo                _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
echo             _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
echo          _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
echo       _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
echo    _-'.-.-.-.-.-. .---.-. .-----------------------------. .-.---. .---.-.-.-.`-_
echo   :-----------------------------------------------------------------------------:

pause >nul
exit /b 0

:fail
cls
color 47
echo.
echo. 
echo ">    %~1 nÆo localizado."
echo ">    Instale o %~1 e execute novamente este crack."
pause>nul
exit /b 1
:erro
echo.
echo.
echo ^>    Erro ao mover ou copiar a licen‡a
echo ^>    certifique de executar este crack com administrador
pause >nul
exit /b 1