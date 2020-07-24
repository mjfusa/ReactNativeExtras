if "%1"=="" goto error
set RN_VERSION=^^0.62.2
set RN_VERSION_INIT=^^0.62

:windows
cd react-native-%1
cmd /c yarn add react-native@%RN_VERSION_INIT% --dev
cmd /c yarn add react-native-windows@%RN_VERSION_INIT% --peer

:expandtemplate
md windows
cd windows
powershell Expand-Archive C:\P\reactnativeextras\ReactNativeExtras\Templates\NativeModule\NativeModule.zip
powershell Expand-Archive C:\P\reactnativeextras\ReactNativeExtras\Templates\NativeUIModule\NativeUIModule.zip
goto end

:error
echo Usage: AddRNWNativeModule ProjectName
goto end

:end
echo Now Build your React Native module in Visual Studio.
set RN_VERSION=
set RN_VERSION_INIT=

