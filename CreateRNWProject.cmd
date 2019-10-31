@echo off
if "%1"=="" goto error

:start
cmd /c react-native init %1 --version 0.60.6

:windows
cd %1
cmd /c yarn add rnpm-plugin-windows
cmd /c react-native windows --template vnext
goto end

:error
echo Usage: CreateRNProject ProjectName

:end

