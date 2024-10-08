output "alb-secgroup" {
  value = aws_security_group.alb-secgroup.id
}

output "vpc" {
  value = aws_vpc.my-vpc.id
}

output "subnet-1" {
  value = aws_subnet.subnet-1.id
}

output "subnet-2" {
  value = aws_subnet.subnet-2.id
}

output "subnet-3" {
  value = aws_subnet.subnet-3.id
}

output "internet-gateway" {
  value = aws_internet_gateway.my-internet-gate.id
}