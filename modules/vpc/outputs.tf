output "vpc_id" {
  value = aws_vpc.cloudific.id
}

output "pub_sub1" {
  value = aws_subnet.public_subnet1.id
}