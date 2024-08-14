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
