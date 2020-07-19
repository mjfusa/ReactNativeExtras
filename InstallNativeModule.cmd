if "%1"=="" goto error

npm i %cd%\%1 --save
goto end

:error
echo Usage: InstallNativeModule ProjectName
echo Start in React Native Project root
echo Example: InstallNativeModule react-native-mydeviceinfo 
goto end

:end