/*variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  //default = "value"

}
*/
variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "uklabs14052022"
}
/*
variable "instance_subnetwork" {
  description = "Name of the buckets to create."
  type        = string
  default     = ""
}
*/
/**
variable "region" {

}

variable "health_check" {


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
*/