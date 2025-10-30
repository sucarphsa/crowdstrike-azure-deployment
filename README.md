# CrowdStrike Azure Deployment

This repository provides a fully automated way to deploy CrowdStrike Falcon Sensor to Azure Linux VMs (RHEL 8/9) using Custom Script Extension and ARM templates.

## Features
- Supports RHEL 8 and 9
- Fully automated installation via ARM templates
- DevOps / CI/CD ready
- Secure handling of CrowdStrike CID

## Usage
1. Upload `install-falcon.sh` to a secure Azure Blob Storage.
2. Update `arm-templates/parameters.json` with VM details and your Falcon CID.
3. Deploy via Azure CLI:
```bash
az deployment group create \  --resource-group MyResourceGroup \  --template-file arm-templates/mainTemplate.json \  --parameters @arm-templates/parameters.json
```

## Diagram
See `deployment-diagram.png` for a comparison between VMApplications and Custom Script Extension.
<img width="800" height="400" alt="image" src="https://github.com/user-attachments/assets/095aee66-aad0-493c-ad11-767cc065cb88" />
