variable "location" {
  description = "Localização dos recursos no Azure."
  default     = "brazilsouth"
}

variable "project_name" {
  description = "Nome base para o projeto."
  default     = "ada-spd-projeto"
}

variable "db_admin" {
  description = "Administrador do banco de dados."
  default     = "admin_ada"
}

variable "db_password" {
  description = "Senha do administrador do banco de dados."
  default     = "SenhaForte!"
}

variable "database_name" {
  description = "Nome do banco de dados."
  default     = "ada-spd-database"
}
