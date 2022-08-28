locals {
  env = "dev"
}

provider "google" {
  project = "${var.project}"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = "${var.project}"
  env     = "${local.env}"
  }
module "http_server" {
  source  = "../../modules/http_server"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}

module "firewall" {
  source  = "../../modules/firewall"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}

# module "infrastructure" {
#   source  = "../../modules/infra_management"
#   project = "${var.project}"
#   env     = "${local.env}"
#   }

#module "notebook" {
#  source  = "../../modules/vertex_ai"
#  project = "${var.project}"
#  env     = "${local.env}"
#  #subnet  = "${module.vpc.subnet}"
#}

#module "compute" {
# source  = "../../modules/compute"
# project = "${var.project}"
# env     = "${local.env}"
#}

#module "storage" {
#source  = "../../modules/storage"
#project = "${var.project}"
#env     = "${local.env}"
#}