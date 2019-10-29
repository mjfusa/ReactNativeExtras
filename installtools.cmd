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
choco install windows-sdk-10-version-1809-all -y

:installvs
choco install visualstudio2019community --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"

:installnode
choco install nodejs.install --version=12.9.1 -y
choco install yarn -y
"%ProgramFiles(x86)%\Yarn\bin\yarn" add global react-native-cli

goto end

rem cmd /c PowerShell [Environment]::SetEnvironmentVariable('VCTargetsPath', 'C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140', 'User')
rem SET VCTargetsPath=C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\V140

:end
choco feature disable -n=allowGlobalConfirmation
