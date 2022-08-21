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
code -r win32app
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

8. Prepare devops.

- [.vscode\Build.ps1](https://github.com/cgerke/vscode/edit/master/.vscode/Build.ps1)
- [.vscode\Global.ps1](https://github.com/cgerke/vscode/edit/master/.vscode/Global.ps1)
- [.vscode\LogonCommand.ps1](https://github.com/cgerke/vscode/edit/master/.vscode/LogonCommand.ps1)
- [.vscode\Sandbox.ps1](https://github.com/cgerke/vscode/edit/master/.vscode/Sandbox.ps1)
- [.vscode\tasks.json](https://github.com/cgerke/vscode/edit/master/.vscode/tasks.json)

9. Speed up ops
- [.vscode\Intune.code-snippets.json](https://github.com/cgerke/vscode/edit/master/.vscode/Intune.code-snippets.json)

### Other interesting ideas.

- [Preload winget into the Sandbox base image](https://github.com/microsoft/winget-pkgs/discussions/56530) by [Trenly](https://github.com/Trenly)
- [Automate the upload to Intune](https://github.com/FlorianSLZ/scloud/tree/main/intune-win32-deployment) by [FlorianSLZ](https://github.com/FlorianSLZ)
