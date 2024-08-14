# Azure Pipelines Agent Docker Container Overview

This repository contains the necessary files to build a Docker container for running Azure Pipelines agents on Windows Server Core LTSC 2022. The container includes pre-installed tools like PowerShell and Git and is configured to run Azure Pipelines agents effectively.

## Repository Structure

- **Dockerfile**: Defines the Docker image configuration, including the installation of required software and setup of the Azure Pipelines agent.
- **start.ps1**: PowerShell script to configure and start the Azure Pipelines agent within the container.

## Getting Started

### Prerequisites

- **Azure DevOps Organization**: Ensure you have an Azure DevOps organization and have generated a Personal Access Token (PAT) with appropriate permissions.
- **Docker**: Install Docker on your machine or server.
- **PowerShell**: Ensure PowerShell is available for script execution.

### Steps to Build and Run the Container

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourusername/your-repo-name.git
    cd your-repo-name
    ```

2. **Build the Docker Image**

    ```bash
    docker build -t azure-pipelines-agent .
    ```

3. **Run the Docker Container**

    ```php
    docker run -e ARM_CLIENT_ID= -e ARM_CLIENT_SECRET= -e ARM_SUBSCRIPTION_ID= -e ARM_TENANT_ID= -e AZURE_DEVOPS_PAT= -e AZURE_DEVOPS_ORG_URL= azure-pipelines-agent
    ```

    Replace `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`, `AZURE_DEVOPS_PAT`, and `AZURE_DEVOPS_ORG_URL` with your actual Azure service principal credentials and Azure DevOps details.

## Configuration

- **Dockerfile**: Configures the image with Windows Server Core LTSC 2022, installs PowerShell, Git, and the Azure Pipelines agent.
- **start.ps1**: Sets up and starts the Azure Pipelines agent. Ensure to replace placeholder values with your Azure DevOps organization URL and PAT in the script.

## Securing Sensitive Information

- **Personal Access Token (PAT)**: Store your PAT securely and avoid hardcoding it directly into scripts or Dockerfiles. Use environment variables or secure vault solutions to manage this sensitive information.
- **Azure DevOps Organization Name**: Similarly, store your Azure DevOps organization URL as a secret to prevent exposure of your organization details.

## Manual Setup Steps

1. **Generate Personal Access Token (PAT)**: Follow Azure DevOps documentation to create a PAT with the necessary scopes.
2. **Configure Azure DevOps Organization**: Ensure your organization URL and PAT are securely configured in the `start.ps1` script and Docker container environment variables.

## Additional Notes

This setup is designed for running Azure Pipelines agents in various environments, including personal PCs, virtual machines, and Azure Container Instances. Modify the Dockerfile and `start.ps1` script as needed to fit your specific use case or environment requirements.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue if you have suggestions or improvements.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
