variable "project" {}
#${var.project}

variable "env" {}
#${var.env}

variable "zone" {
    type = string
    default = "us-west1-a"
}
#${var.zone}

variable "region" {
    type = string
    default = "us-west1"
}
#${var.region}

variable "machine_type" {
    type = string
    default = "e2-micro"
}
#${var.machine_type}