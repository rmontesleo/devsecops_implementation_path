output vpc_id {
  value = module.prod.vpc_id
}

output subnet_id {
  value = module.prod.subnet_id
}

output ec2_instance_private_ip {
  value = module.prod.ec2_instance_private_ip
}