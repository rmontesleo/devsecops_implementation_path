module dev {
  source = "../../modules"

  vpc_name = "terraform_dev"

  subnet_name = "main"
  subnet_zone = "us-east-1a"
  ec2_ami     = "ami-07ebfd5b3428b6f4d"
  ec2_size    = "t2.micro"
  ec2_count   = 1

  tags = {
    Module = true
  }
}

