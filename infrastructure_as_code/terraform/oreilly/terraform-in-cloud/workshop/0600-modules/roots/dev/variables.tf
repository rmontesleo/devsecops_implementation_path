/*
variable "AWS_ACCESS_KEY_ID" {
  type = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  sensitive = true
}
*/

variable "AWS_DEFAULT_REGION" {
  type    = string
  default = "us-east-1"
}