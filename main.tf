module "VPC" {
  source = "./tf-modules/vpc" 
  region = var.region
}
module "vm-instance" {
  source = "./tf-modules/vm-instance"
  region = var.region
  project_id = var.project_id
  
}
module "disk" {
  source = "./tf-modules/attached-multiple-disk-with-vm"
  project_id = var.project_id
}