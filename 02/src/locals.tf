locals {
  env_web = "web"
  env_db  = "db"
  vm_web_name = "netology-develop-platform-${local.env_web}"
  vm_db_name  = "netology-develop-platform-${local.env_db}"
}