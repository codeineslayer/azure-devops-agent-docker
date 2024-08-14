# Azure Pipelines Agent Docker Container

## Overview

This repository contains the necessary files to build a Docker container for running Azure Pipelines agents on Windows Server Core LTSC 2022. The container includes pre-installed tools like PowerShell and Git, and is configured to run Azure Pipelines agents effectively.

## Repository Structure

- **`Dockerfile`**: Defines the Docker image configuration, including the installation of required software and setup of the Azure Pipelines agent.
- **`start.ps1`**: PowerShell script to configure and start the Azure Pipelines agent within the container.

## Getting Started

### Prerequisites

1. **Azure DevOps Organization**: Ensure you have an Azure DevOps organization and have generated a Personal Access Token (PAT) with appropriate permissions.
2. **Docker**: Install Docker on your machine or server.
3. **PowerShell**: Ensure PowerShell is available for script execution.

### Steps to Build and Run the Container

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
Build the Docker Image

bash
Copy code
docker build -t azure-pipelines-agent .
Run the Docker Container

bash
Copy code
docker run -e ARM_CLIENT_ID=<your-client-id> -e ARM_CLIENT_SECRET=<your-client-secret> -e ARM_SUBSCRIPTION_ID=<your-subscription-id> -e ARM_TENANT_ID=<your-tenant-id> -e AZURE_DEVOPS_PAT=<your-pat> -e AZURE_DEVOPS_ORG_URL=<your-org-url> azure-pipelines-agent
Replace <your-client-id>, <your-client-secret>, <your-subscription-id>, <your-tenant-id>, <your-pat>, and <your-org-url> with your actual Azure service principal credentials and Azure DevOps details.

Configuration
Dockerfile: Configures the image with Windows Server Core LTSC 2022, installs PowerShell, Git, and the Azure Pipelines agent.
start.ps1: Sets up and starts the Azure Pipelines agent. Ensure to replace placeholder values with your Azure DevOps organization URL and PAT in the script.
Securing Sensitive Information
Personal Access Token (PAT): Store your PAT securely and avoid hardcoding it directly into scripts or Dockerfiles. Use environment variables or secure vault solutions to manage this sensitive information.
Azure DevOps Organization Name: Similarly, store your Azure DevOps organization URL as a secret to prevent exposure of your organization details.
Manual Setup Steps
Generate Personal Access Token (PAT): Follow Azure DevOps documentation to create a PAT with the necessary scopes.
Configure Azure DevOps Organization: Ensure your organization URL and PAT are securely configured in the start.ps1 script and Docker container environment variables.
Additional Notes
This setup is designed for running Azure Pipelines agents in various environments, including personal PCs, virtual machines, and Azure Container Instances.
Modify the Dockerfile and start.ps1 script as needed to fit your specific use case or environment requirements.
Contributing
Contributions are welcome! Please submit a pull request or open an issue if you have suggestions or improvements.

License
This project is licensed under the MIT License. See the LICENSE file for details.

