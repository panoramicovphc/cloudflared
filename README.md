# Deploy Cloudflared with GitHub Actions and Ansible

This repository contains a setup for deploying Cloudflared using GitHub Actions and Ansible. The deployment process includes copying the necessary files, running Ansible playbooks, and setting up Docker containers.

## Repository Structure

```
.github/
  workflows/
    main.yaml
ansible/
  playbooks/
    deploy-cloudflared.yml
docker/
  docker-compose.yml
```

- **.github/workflows/main.yaml**: GitHub Actions workflow for deploying Cloudflared.
- **ansible/playbooks/deploy-cloudflared.yml**: Ansible playbook for deploying Cloudflared.
- **docker/docker-compose.yml**: Docker Compose file for setting up Cloudflared.

## Prerequisites

- GitHub repository with GitHub Actions enabled.
- Ansible installed on the target nodes.
- Docker installed on the target nodes.

## Setup

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
   ```

2. **Configure GitHub Secrets**:
   - `ANSIBLE_PROJECT_PATH`: Path to the Ansible project on the target nodes.
   - `CURRENT_PROJECT_PATH`: Path to the Cloudflared project on the target nodes.
   - `CF_TUNNEL_TOKEN`: Cloudflare Tunnel token for the Docker container.

3. **Update Inventory File**:
   Update the `inventory/hosts.ini` file in your Ansible project with the target nodes.

## Usage

1. **Push Changes**:
   Push changes to the `main` branch to trigger the GitHub Actions workflow.

2. **GitHub Actions Workflow**:
   The workflow will:
   - Checkout the repository.
   - Copy the Docker files to the Ansible drop folder.
   - Run the Ansible playbook to deploy Cloudflared.

## Ansible Playbook

The Ansible playbook performs the following tasks:

- Publishes the Cloudflared project to remote nodes.
- Cleans and publishes the Cloudflared project to remote nodes.
- Installs Docker if not already installed.
- Deploys Cloudflared using Docker Compose.

## Docker Compose

The Docker Compose file sets up a Cloudflared container with the necessary environment variables and network configuration.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
