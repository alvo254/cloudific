resource "aws_security_group" "cloudific" {
  name        = "cloudific"
  description = "cloudific security group"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "HTTP"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      ipv6_cidr_blocks = ["::/0"]

    },
    {
      description      = "HTTS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      ipv6_cidr_blocks = ["::/0"]

    },
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks      = ["102.216.154.26/32"] 
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]

  egress = [
    {
      description      = "outgoing traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "cloudific_sg"
  }

}
