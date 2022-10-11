rem arduino安装路径转短路径，可以修改到Arduino的安装路径
for %%A in ("D:\Program Files\Arduino") do set varArduino=%%~sA

rem 当前路径转短路径，该路径包含了MAKE的路径跟mksketch的路
for %%A in ("%cd%") do set varCd=%%~sA

rem 添加arduino路径
setx ARDUINO_PATH %varArduino%

rem 添加avr相关编译器的路径
setx AVR_HOME "%%ARDUINO_PATH%%\hardware\tools\avr\bin;%%ARDUINO_PATH%%\hardware\tools\avr\avr\bin"

rem 添加make程序路径
setx MAKE_HOME "%varCd%\MAKE"

rem 添加mksketch路径
setx MKSKETCH_HOME "%varCd%\mksketch"

rem 添加arduino上传时用到的配置文件路径
setx AVRDUDE_CONF_PATH "%%ARDUINO_PATH%%\hardware\tools\avr\etc\avrdude.conf"

@echo off
setlocal enabledelayedexpansion

set key="HKEY_CURRENT_USER\Environment"

rem 获取用户现有的Path环境变量
set pp=""
for /f "tokens=3" %%i in ('reg query %key% /v "Path"') do (
	set pp=%%i
)

rem Path环境变量添加AVR_HOME
echo %%pp%% | findstr /i /c:"%%AVR_HOME%%"  > nul &&(echo found AVR_HOME)||(set pp=!pp!;%%AVR_HOME%%)

rem Path环境变量添加MAKE_HOME
echo %%pp%% | findstr /i /c:"%%MAKE_HOMEE%%"  > nul &&(echo found MAKE_HOME)||(set pp=!pp!;%%MAKE_HOME%%)

rem Path环境变量添加MKSKETCH_HOME
echo %%pp%% | findstr /i /c:"%%MKSKETCH_HOME%%"  > nul &&(echo found MKSKETCH_HOME)||(set pp=!pp!;%%MKSKETCH_HOME%%)

reg add %key% /v "Path" /t REG_EXPAND_SZ /d %pp% /f

rem OK!

pause