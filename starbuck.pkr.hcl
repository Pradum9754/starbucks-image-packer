source "azure-arm" "Starbuck" {
  azure_tags = {
    dept = "Engineering"
    task = "Image deployment"
  }
  client_id                         = "ef5228c7-8fd2-4c05-b036-3e361be4d69e"
  client_secret                     = "~zv8Q~8GdHFNK7ZT_YFrI-c2R0r2_CjKdZoq_aa0"
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "canonical"
  image_sku                         = "22_04-lts"
  location                          = "centralindia"
  managed_image_name                = "Starbuck-image"
  managed_image_resource_group_name = "custom-image-rg"
  os_type                           = "Linux"
  subscription_id                   = "02e2bf71-710c-4170-b8d6-c0cf2ca7551b"
  tenant_id                         = "9163791f-e051-4aec-a16a-7731b001737e"
  vm_size                           = "Standard_D2s_v3"
}

build {
  sources = ["source.azure-arm.Starbuck"]

# provisioner "shell" {
#   inline = [
#     "sudo apt-get update",
#     "sudo apt-get upgrade -y",
#     "sudo apt-get install -y nginx git",
#     "cd /tmp",
#     "git clone https://github.com/devopsinsiders/StreamFlix.git",
#     "sudo cp -r /tmp/StreamFlix/* /var/www/html/",
#     "sudo /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
#   ]
# }

provisioner "shell" {
  inline = [
    "sudo rm -rf /var/lib/apt/lists/*",                # clean old cache
    "sudo apt-get clean",
    "sudo apt-get update -y",
    "sudo apt-get install -y software-properties-common",
    "sudo add-apt-repository universe -y",
    "sudo apt-get update -y",
    "sudo apt-get upgrade -y",
    "sudo apt-get install -y nginx git",
    "cd /tmp",
    "git clone https://github.com/devopsinsiders/starbucks-clone.git",
    "sudo cp -r /tmp/starbucks-clone/* /var/www/html/",
    "sudo /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
  ]
}
}

packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 2"
    }
  }
}
