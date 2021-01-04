# React Native Extras

Batch files to help with getting started with React Native for Windows. Derived from the React Native for Windows documentation: https://microsoft.github.io/react-native-windows/docs/getting-started

### Windows Native Modules

|Filename|Description|
|--|--|
|**installtools.cmd**| Installs all tools for creating React Native for Windows Apps |
|**CreateRNWProject.cmd**|Create a C++ main app project|
|**CreateRNWNativeModule.cmd**|Create a C++ native module with C++ templates for native module and native UI module|
|**InstallNativeModule.cmd**|Installs created RNW native module into existing RNW project|
|**AddRNWNativeModule.cmd**|Adds RNW support into existing native module project|

### Optional Packages

|Filename|Description|
|--|--|
|**createRelatedSetBundle.cmd**|Convert msix to msixbundle adding bundle manifest|
|**InstallApp.ps1**|Installs app|

### Usage: CreateRNWProject.cmd

Create React Native for Windows main app with **CreateRNWNativeModule.cmd**

  ```
  CreateRNWProject MyMainApp
  ```

  Note: Output is in folder .\MyMainApp
  
### Usage: RNWNativeModule.cmd
1. Create native module with **CreateRNWNativeModule.cmd**. Start in Project folder (i.e. .\MyMainApp)

  ```
  cd MyMainApp
  CreateRNWNativeModule mynativemodule
  ```
  
  Note: Output is in folder .\react-native-mynativemodule
  
2. Build native module using Visual Studio

  ```
  .\react-native-mynativemodule\windows\NativeModule\NativeModule.sln
  ```
  
3. Install native module in to main app source tree with **InstallNativemodule.cmd** C:\path to native module

  ```
  InstallNativeModule c:\react-native-mynativemodule
  ```
  
  Note: Output is in folder *MyMainAp\node_modules\react-native-mynativemodule*
  
5. Open Main App Project in Visual Studio and add the Native Module Project to solution

  
  ```
  Start in MyMainApp
  CD Windows
  MyMainApp.sln

  Project to add:
  .\node_modules\react-native-mynativemodule\windows\NativeModule\NativeModule.vcxproj

Add a reference to NativeModule to your main application project. From Visual Studio:

Right-click main application project > Add > Reference...
Check NativeModule from Solution Projects

Update the pch.h file
Add #include "winrt/NativeModule.h".

Register the package:
Add PackageProviders().Append(winrt::NativeModule::ReactPackageProvider()); before InitializeComponent();.

  ```
  
Note: If you get a linker error related to ```Microsoft.ReactNative.pdb```, you may need to remove the reference to ```Microsoft.ReactNative``` in the NativeModule project and replace with the reference to ```Microsoft.ReactNative``` as used in the Main app project. 

6. Test with JSX found here: reactnativeextras\templates\jsx

## Sample:
See here to see the results: https://github.com/mjfusa/react-native-windows-module-sample

