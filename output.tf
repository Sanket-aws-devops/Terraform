output "ec2_id" {
  value = module.my_ec2.instance_id
}

output "vpc_id" {
    value = module.vpc.vpc_id
}
