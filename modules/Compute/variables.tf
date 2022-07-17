variable "project" {}
variable "env" {}

variable "zone" {
    type = string
    default = "us-west1"
}

variable "machine_type" {
    type = string
    default = "e2-micro"
}