variable "instance_type" {
  # default = "t3.micro"
  type = string
}

variable "ami" {
  # default = "ami-01a00762f46d584a1"
  type = string
}

variable "volume_size" {
  # default = 13
  type = string
}
variable "volume_type" {
  # default = "gp3"
  type = string
}