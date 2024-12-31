/*
variable "AWS_ACCESS_KEY_ID" {
  description = "value of AWS_ACCESS_KEY_ID"
  type = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "value of AWS_SECRET_ACCESS"
  type = string
  sensitive = true
}
*/

variable "AWS_DEFAULT_REGION" {
  description = "value of AWS_DEFAULT_REGION"
  type    = string
  default = "us-east-1"
}