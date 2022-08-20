# VSCode for win32app Devops

1. Install [Sandbox](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview) with powershell.
```powershell
Get-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online
Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online
```

2. Install [VSCode](https://code.visualstudio.com/) with [Winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/)
```powershell
winget install Microsoft.VisualStudioCode
```

3. Install [GitHub CLI](https://cli.github.com/) with [Winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/)
```powershell
winget install GitHub.cli
```

4. Open VSCode and initiate a Terminal `(CTRL + J)`
5. Install [GitHub CLI](https://cli.github.com/) with [Winget](https://docs.microsoft.com/en-us/windows/package-manager/winget/). Initialise the repo and clone it locally. *(optional, just demo showing possiblities)*
```powershell
# Install cli
winget install GitHub.cli

# Create a repo and clone it locally
gh repo create win32app --public --clone

# Open the clone in vscode
code win32app
```

6. Initialise the workspace
```powershell
# Workspace settings including build tasks
New-Item -Path ".vscode" -ItemType Directory

# Will contain our win32app source files
New-Item -Path "app" -ItemType Directory
```

7. Setup the win32app core
```powershell
code .\app\install.ps1
code .\app\detection.ps1
code .\app\requirement.ps1
code .\app\uninstall.ps1
```

8. Prepare .vscode\tasks.json
9. Prepare .vscode\build.ps1 logic
10. Prepare .vscode\sandbox.ps1 logic

Other interesting ideas.

- [Preload winget into the Sandbox base image](https://github.com/microsoft/winget-pkgs/discussions/56530) by [Trenly](https://github.com/Trenly)
- [Automate the upload to Intune](https://github.com/FlorianSLZ/scloud/tree/main/intune-win32-deployment) by [FlorianSLZ](https://github.com/FlorianSLZ)