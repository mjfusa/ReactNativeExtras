if "%1"=="" goto error

npm i %1 --save
goto end

:error
echo Usage: InstallNativeModule <path to native module project>
echo Start in React Native Project root
echo Example: InstallNativeModule c:\MyNativeModule\react-native-mydeviceinfo 
goto end

:end