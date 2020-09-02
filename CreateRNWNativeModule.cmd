if "%1"=="" goto error
set RN_VERSION=^^0.63.0
set RN_VERSION_INIT=^^0.63
:start
cmd /c yarn global add create-react-native-module
cmd /c npx create-react-native-module %1

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
echo Usage: CreateRNWNativeModule ProjectName
goto end


:end
echo Now Create your Window Runtime Component
set RN_VERSION=
set RN_VERSION_INIT=

