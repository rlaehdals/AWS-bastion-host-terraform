resource "aws_instance" "dev_ec2"{
    ami = data.aws_ami.amazon_linux_2.id

    instance_type = var.instance_type

    subnet_id = var.subnet_id

    vpc_security_group_ids = var.aws_security_group_ids

    key_name = var.key_name

}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}