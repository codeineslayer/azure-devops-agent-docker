# Set the agent configuration variables
$agentName = "azp-aci-01" # Adjust the agent name as needed
$agentPool = "Default" # Adjust the agent pool name as needed
$organization = "https://dev.azure.com/your-organization" # Replace with your Azure DevOps organization URL
$personalAccessToken = "YOUR_PERSONAL_ACCESS_TOKEN" # Replace with your PAT

# Configure the Azure Pipelines agent
Write-Host "Configuring Azure Pipelines Agent..."
Start-Process -FilePath "$env:AGENT_DIR\config.cmd" -ArgumentList `
    "/url $organization", `
    "/auth PAT", `
    "/token $personalAccessToken", `
    "/pool $agentPool", `
    "/agent $agentName", `
    "/runAsService" `
    -NoNewWindow -Wait

# Start the Azure Pipelines agent
Write-Host "Starting Azure Pipelines Agent..."
Start-Process -FilePath "$env:AGENT_DIR\run.cmd" -NoNewWindow -Wait
