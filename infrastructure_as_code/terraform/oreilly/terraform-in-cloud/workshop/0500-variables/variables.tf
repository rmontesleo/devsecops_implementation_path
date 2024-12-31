/*
variable "AWS_ACCESS_KEY_ID" {
  description = "The AWS access key ID"
  type = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "value of the AWS secret access key"
  type = string
  sensitive = true
}
*/

# This Variable, the value will be assign in the terraform.tfvars file
variable "AWS_DEFAULT_REGION" {
  description = "value of the AWS region"
  type = string
  #default = "us-east-1"
}

# TODO
# define a new variable called 'tier' of type 'string' to specify the env
# and use that in your EC2 instance.
#  Default it to 'dev'
variable "tier" {
  description = "value of the tier"
  type = string
  default = "dev"  
}