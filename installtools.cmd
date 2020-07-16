@echo off
:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto continue 
) else ( powershell "saps -filepath %0 %1 -verb runas" >nul 2>&1)
exit /b

:continue
if NOT "%1"=="" goto %1

cd %~dp0
powershell Set-ExecutionPolicy bypass -force
powershell Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin;c:\program files\nodejs;C:\Program Files\Git\cmd"
choco feature enable -n=allowGlobalConfirmation
for %%a in (git.install, netfx-4.6.1-devpack) do choco install %%a -y

:installwindowssdk
rem Windows 10 18362
choco install windows-sdk-10-version-1903-all -y
if NOT "%1"=="" goto end


:installvs
REM choco install visualstudio2019community --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
winget install -e Microsoft.VisualStudio.Community
for %%b in (Microsoft.VisualStudioCode, Microsoft.WindowsTerminal) do winget install -e %%b
echo "NOTE: For C++ dev, also install C++/WinRT Visual Studio Extension. https://marketplace.visualstudio.com/items?itemName=CppWinRTTeam.cppwinrt101804264"
if NOT "%1"=="" goto end

:installnode
choco install nodejs.install --version=12.9.1 -y
choco install yarn -y
if NOT "%1"=="" goto end

:installrn
"%ProgramFiles(x86)%\Yarn\bin\yarn" add global react-native-cli
if NOT "%1"=="" goto end

:installChrome
winget install -e Google.Chrome
if NOT "%1"=="" goto end

goto end

:end
choco feature disable -n=allowGlobalConfirmation