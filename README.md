# starbucks-image-packer
Infrastructure-as-Code repository to build and deploy custom Azure VM images with pre-configured Starbucks-style web application using Packer and shell provisioning.

# Starbucks Custom Azure Image

This repository contains **Infrastructure-as-Code scripts** to build custom Azure VM images pre-configured with a Starbucks-style web application using **Packer** and shell provisioning.

## Features

- Automated image creation using **Azure ARM** as the source
- Pre-installed **Nginx** web server
- Clones and deploys the **Starbucks clone application**
- Fully cleaned, deprovisioned, and ready-to-use VM image
- Compatible with **Linux (Ubuntu 22.04 LTS)**

## Usage

1. Install [Packer](https://www.packer.io/downloads) and required plugins
2. Configure Azure credentials (`client_id`, `client_secret`, `tenant_id`, `subscription_id`)
3. Run:

```bash
packer build starbucks-image.pkr.hcl

Provisioner Details

The provisioning steps include:

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y nginx git
cd /tmp
git clone https://github.com/devopsinsiders/starbucks-clone.git
sudo cp -r /tmp/starbucks-clone/* /var/www/html/
sudo /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync

Tags & Metadata
Key	Value
Dept	Engineering
Task	Image deployment
OS	Ubuntu 22.04 LTS
VM Size	Standard_D2s_v3
Contribution

Fork, improve provisioning, or add more apps — pull requests welcome!
