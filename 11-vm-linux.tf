resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

# =================== public_ip =========================
resource "azurerm_public_ip" "public_ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  allocation_method   = "Dynamic"
}


resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = "vm-name"
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  disable_password_authentication = false
  admin_password = "Ekiadmin1234%^&*"

  # disable_password_authentication = false
  # admin_ssh_key {
  #   username   = "adminuser"
  #   # public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}



# ============= OUTPUT ================

# output "vm-linux_ip" {
#   value = azurerm_linux_virtual_machine.vm_linux.public_ip_address
#   description = "The Public IP address of the VM."
# }

output "ssh" {
    value = "${azurerm_linux_virtual_machine.vm_linux.admin_username}@${azurerm_linux_virtual_machine.vm_linux.public_ip_address}"
    description = "run ssh admin@ip-addr to login the VM"
}

output "password" {
  sensitive = true
  value = azurerm_linux_virtual_machine.vm_linux.admin_password
}