 variable "project_id" {

} 

 variable "name" {

} 
variable "region" { 

} 

 variable "instance_subnetwork" {
 
} 
variable "network" {
 
}
 variable "instance_template" {
  description = "Instance template self_link used to create compute instances"
  // default = "test"
} 

variable "service_account" {
  default = "tcpl"
}
