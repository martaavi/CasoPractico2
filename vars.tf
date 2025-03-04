variable "location" {
  type = string
  description = "Region de azure donde creo mi infraestructura"
  default = "West Europe"
}

variable "vm_size" {
    type = string
    description = "Tamaño de la máquina virtual"
    default = "Standard_D2s_v3" 
}

variable "appID" {
    type = string
        description = "Usuario service principal"
        default = ""
}

variable "password" {
    type = string
    description = "Contraseña service principal"
    default = ""
}
