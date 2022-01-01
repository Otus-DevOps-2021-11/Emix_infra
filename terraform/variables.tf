variable cloud_id {
  description = "Cloud"
  default     = ""
}

variable folder_id {
  description = "Folder"
  default     = "b1gp647crcieb51rtl3i"
}

variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-c"
}

variable "zone_id" {
  description = "Zone ID"
  default = "ru-central1"
}

variable "instance_count" {
  description = "Count of instances"
  default = 1
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
  default     = "~/.ssh/id_rsa"
}

variable image_id {
  description = "Disk image"
}


variable "token" {
  description = "YC token"
}