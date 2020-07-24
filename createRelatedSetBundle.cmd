if "%2" NEQ "" goto release
REM Debug
MakeAppx.exe bundle  /o /p AppPackages\out.msixbundle /f Bundle.Mapping.txt
goto sign
:release
REM Release
MakeAppx.exe bundle  /o /p AppPackages\out.msixbundle /f Release.Bundle.Mapping.txt
:sign
signtool.exe sign  -f TemporaryKey.pfx -fd SHA256 -v AppPackages\out.msixbundle
powershell -f .\installApp.ps1