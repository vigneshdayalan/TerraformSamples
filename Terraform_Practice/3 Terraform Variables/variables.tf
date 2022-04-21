variable "elb_name" {
  type    = string
  default = "elbterra"
}

variable "av_zones" {
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
  type    = list(any)
}

variable "instance_port" {
  type    = number
  default = 8000
}
