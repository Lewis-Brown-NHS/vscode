# Vars
. ".vscode\Global.ps1"

# intunewin
[string]$Uri = "https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/raw/master"
[string]$Exe = "IntuneWinAppUtil.exe"

# Source content prep tool
if (-not(Test-Path -Path "$env:ProgramData\$Exe")){
    Invoke-WebRequest -Uri "$Uri/$Exe" -OutFile "$env:ProgramData\$Exe"
}

# Execute content prep tool
$processOptions = @{
    FilePath = "$env:ProgramData\$Exe"
    ArgumentList  = "-c ""$Cache"" -s ""$Cache\install.ps1"" -o ""$env:TEMP"" -q"
    WindowStyle = "Maximized"
    Wait = $true
}
Start-Process @processOptions

# Rename and prepare for upload
Move-Item -Path "$env:TEMP\install.intunewin" -Destination "$Desktop\$Application.intunewin" -Force -Verbose
explorer $Desktop

# Prepare Sandbox
@"
<Configuration>
<Networking>Enabled</Networking>
<MappedFolders>
    <MappedFolder>
    <HostFolder>$env:ProgramData\win32app</HostFolder>
    <SandboxFolder>$WDADesktop</SandboxFolder>
    <ReadOnly>true</ReadOnly>
    </MappedFolder>
</MappedFolders>
<LogonCommand>
    <Command>powershell -executionpolicy unrestricted -command "Start-Process powershell -ArgumentList ""-nologo -file $WDADesktop\Sandbox.ps1"""</Command>
</LogonCommand>
</Configuration>
"@ | Out-File "$env:ProgramData\win32app\$Application.wsb"

# Execute Sandbox
Start-Process explorer -ArgumentList "$env:ProgramData\win32app\$Application.wsb" -Verbose
