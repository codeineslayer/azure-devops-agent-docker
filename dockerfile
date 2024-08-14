# Use the Windows Server Core LTSC 2022 as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set environment variables for directories
ENV AGENT_DIR=C:\azp
ENV GIT_INSTALLER=GitSetup.exe

# Install PowerShell (latest stable version)
SHELL ["powershell", "-Command"]
RUN $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Uri https://aka.ms/powershell-release -OutFile PowerShellInstaller.msi; \
    Start-Process msiexec.exe -ArgumentList '/i', 'PowerShellInstaller.msi', '/quiet', '/norestart' -NoNewWindow -Wait; \
    Remove-Item -Force PowerShellInstaller.msi

# Install Git (latest version)
RUN $ErrorActionPreference = 'Stop'; \
    $GitRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/git-for-windows/git/releases/latest"; \
    $GitDownloadUrl = $GitRelease.assets | Where-Object { $_.name -like "*64-bit.exe" } | Select-Object -First 1 -ExpandProperty browser_download_url; \
    Invoke-WebRequest -Uri $GitDownloadUrl -OutFile $env:GIT_INSTALLER; \
    Start-Process -FilePath .\$env:GIT_INSTALLER -ArgumentList '/VERYSILENT', '/NORESTART' -NoNewWindow -Wait; \
    Remove-Item -Force $env:GIT_INSTALLER

# Install Azure Pipelines agent (latest version)
RUN $ErrorActionPreference = 'Stop'; \
    $AgentRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/microsoft/azure-pipelines-agent/releases/latest"; \
    $AgentVersion = $AgentRelease.tag_name; \
    Invoke-WebRequest -Uri "https://vstsagentpackage.azureedge.net/agent/$AgentVersion/vsts-agent-win-x64-$AgentVersion.zip" -OutFile agent.zip; \
    Expand-Archive -Path agent.zip -DestinationPath $env:AGENT_DIR; \
    Remove-Item -Force agent.zip

# Set up the working directory
WORKDIR $env:AGENT_DIR

# Copy the entry point script
COPY start.ps1 .

# Entry point script
ENTRYPOINT ["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", ".\\start.ps1"]
