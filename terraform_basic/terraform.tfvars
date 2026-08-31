ami           = "ami-01a00762f46d584a1"
instance_type = "t3.micro"

volume_size = 20
volume_type = "gp3"

instances = {
  "web1" = {
    instance_type = "t3.micro"
    name = "web-server-1"
  }
  "web2" = {
    instance_type = "t3.micro"
    name = "web-server-2"
  }
  "web3" = {
    instance_type = "t3.micro"
    name = "web-server-3"
  }
}
