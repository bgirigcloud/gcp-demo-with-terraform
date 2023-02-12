
module "multiple-vm" {

  source = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/instances"
  
  
  
  //project = var.project_id
}

/*
module "tf-attached-disk-with-vm" {

 source = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/attached-disk-with-vm"  

}
*/
/*
module "tf-internal-lb" {

 source = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/internal-lb"    
 region       = var.region
  name         = "group2-ilb"
  ports        = ["80"]
  health_check = var.health_check
  source_tags  = ["allow-group1"]
  target_tags  = ["allow-group2", "allow-group3"]
  backends     = [
    { group = module.mig2.instance_group, description = "", failover = false },
    { group = module.mig3.instance_group, description = "", failover = false },
  ]
  
}


module "load_balancer" {
  source = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/tcp-lb"

  //version      = "~> 2.0.0"
  region       = var.region
  name         = "load-balancer"
  service_port = 80
  target_tags  = ["allow-lb-service"]
  network      = var.network
}

module "instance_template" {

  source          = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/template"
  service_account = var.service_account
}



module "managed_instance_group" {
  source = "C:/Users/Bisuchinu/hello-world/multi-vm-creation/mig"

  //version           = "~> 1.0.0"
  region            = var.region
  target_size       = 2
  hostname          = "mig-simple"
  instance_template = "teststtststststtsts"
  

  //target_pools = [module.load_balancer.target_pool]

  named_ports = [{
    name = "http"
    port = 80
  }]
}



 */