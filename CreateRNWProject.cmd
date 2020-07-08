:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto continue 
) else ( goto needElevation)
exit /b

:continue
REM
rem ^0.61.9 == Latest
rem ^0.60.0 == Stable
if "%1"=="" goto error
if "%RN_VERSION%"=="" set RN_VERSION=^^0.62.2
if "%RN_VERSION_INIT%"=="" set RN_VERSION_INIT=^^0.62
if "%1"=="" goto error
:start
cmd /c npx --ignore-existing react-native init %1 --version ^^%RN_VERSION%
rem --template react-native@^^%RN_VERSION_INIT%

:windows
cd %1
REM cmd /c yarn add rnpm-plugin-windows --dev
REM if "%2" NEQ "" cmd /c npx react-native windows --template beta
REM if "%2" == "" cmd /c react-native windows
cmd /c npx react-native-windows-init --overwrite
goto end

:error
echo Usage: CreateRNProject ProjectName
goto end

:needElevation
echo Error: Requires Admin Privileges
goto end


:end
rem set RN_VERSION=
rem set RN_VERSION_INIT=

