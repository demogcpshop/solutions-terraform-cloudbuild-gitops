#machine_type = "${var.machine_type}"
variable "project" {}
variable "env" {}

variable "OPCO" {
    type = string
    default = "benin"
}

variable "USE_CASE" {
    type = string
    default = "fraud"
}

variable "EVA_BUCKET_NAME" {
    type = string
    default = "EVA-test"
}

variable "STATE_BUCKET" {
    type = string
    default = "terraformstateBucketname"
}