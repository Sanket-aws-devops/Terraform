output "lb_dns_name" {
  description = "Load Balancer DNS name"
  value       = aws_lb.test.dns_name
}
