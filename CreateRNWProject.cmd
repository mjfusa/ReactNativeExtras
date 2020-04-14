:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto continue 
) else ( goto needElevation)
exit /b

:continue
rem ^0.61.5 == Beta
rem ^0.60.0 == Stable
set RN_VERSION=^0.61.0
set RN_VERSION_INIT=^0.61
if "%1"=="" goto error
:start
cmd /c npx --ignore-existing react-native init %1 --template react-native@%RN_VERSION_INIT%

:windows
cd %1
REM cmd /c yarn add rnpm-plugin-windows --dev
REM if "%2" NEQ "" cmd /c npx react-native windows --template beta
REM if "%2" == "" cmd /c react-native windows
cmd /c npx react-native-windows-init
goto end

:error
echo Usage: CreateRNProject ProjectName
goto end

:needElevation
echo Error: Requires Admin Privileges
goto end


:end
set RN_VERSION=
set RN_VERSION_INIT=
set curpath=

