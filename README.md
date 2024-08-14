Azure Pipelines Agent Docker Container
This repository provides a Dockerfile and PowerShell script to create a Windows container that runs an Azure Pipelines agent. This setup allows you to deploy the Azure Pipelines agent on various environments, including personal PCs, Azure VMs, or Azure Container Instances.

Overview
The provided Dockerfile builds a Windows Server Core LTSC 2022-based Docker image that installs necessary tools and configures the Azure Pipelines agent. The start.ps1 script handles the configuration and startup of the agent within the container.

Repository Structure
Dockerfile: Defines the base image and installation steps for the Azure Pipelines agent and other tools.
start.ps1: PowerShell script for configuring and running the Azure Pipelines agent.
README.md: This file, providing an overview and instructions.
Important Notes
Chicken and Egg Scenario
To effectively use this Docker image, you must first set up the Azure Pipelines agent in an environment where it can be run. This involves several manual steps, such as:

Generating a Personal Access Token (PAT): You need to create a PAT in Azure DevOps to authenticate the agent. This step is crucial because the agent uses this token to communicate with Azure DevOps.

Obtaining Your Azure DevOps Organization URL: You need the URL for your Azure DevOps organization to configure the agent. This URL is required by the agent to connect to your Azure DevOps instance.

Preparing the Deployment Environment: Before running the container, ensure that you have an environment where the Docker container can be deployed, such as a local machine, a VM in Azure, or an Azure Container Instance.

Manual Setup Steps
Create a Personal Access Token (PAT):

Go to your Azure DevOps organization.
Navigate to User Settings > Personal Access Tokens.
Create a new token with appropriate permissions (e.g., Agent Pools (Read & manage)).
Obtain Your Organization URL:

This URL typically follows the format https://dev.azure.com/{organization}.
Deploy the Container:

Build the Docker image using the provided Dockerfile.
Run the container in your chosen environment, ensuring you pass the required environment variables (ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID) and mount any necessary volumes.
Usage
Building the Docker Image
To build the Docker image, run the following command in the directory containing the Dockerfile:

sh
Copy code
docker build -t azure-pipelines-agent-container .
Running the Docker Container
To run the container, use the following command, replacing placeholders with actual values:

sh
Copy code
docker run -e ORGANIZATION_URL="https://dev.azure.com/your-organization" -e PAT="YOUR_PERSONAL_ACCESS_TOKEN" -v /path/to/start.ps1:/azp/start.ps1 azure-pipelines-agent-container
Ensure you replace /path/to/start.ps1 with the actual path to the start.ps1 script if it is located outside the container.

License
This repository is licensed under the MIT License. See the LICENSE file for details.