#Creo la Maquina Virtual
resource "azurerm_linux_virtual_machine" "myVM1" {
  name                  = "my-first-azure-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.vm_size
  admin_username        = "adminUsername"
  network_interface_ids = [azurerm_network_interface.myNic1.id]
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminUsername"
    public_key = file("C:/Users/marta/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  #Comento la parte de plan porque al hacer el terraform apply me indica que la imagen que quiero descargar
  #para mi máquina virtual no necesita la parte de plan
  //plan {
    //name = "ubuntu-pro"
    //product = "ubuntu-24_04-lts"
    //publisher = "Canonical"
  //}

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
  }

  tags = {
    environment = "CP2"
  }
}