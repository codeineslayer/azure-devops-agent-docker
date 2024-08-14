# Use the Windows Server Core LTSC 2022 as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set environment variables for directories
ENV AGENT_DIR=C:\azp

# Install PowerShell (latest stable version)
SHELL ["powershell", "-Command"]
RUN $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Uri https://aka.ms/powershell-release -OutFile PowerShellInstaller.msi; \
    Start-Process msiexec.exe -ArgumentList '/i', 'PowerShellInstaller.msi', '/quiet', '/norestart' -NoNewWindow -Wait; \
    Remove-Item -Force PowerShellInstaller.msi

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
