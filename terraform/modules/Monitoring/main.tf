resource "aws_instance" "example_instance" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.type
  key_name               = var.KEY_NAME
 user_data  = templatefile("../modules/Monitoring/install-monitoring.sh", {})
    subnet_id     = var.subnet_id
  security_groups = var.sg-id

  tags = {
    Name = "Monitoring-EC2"
  }
    root_block_device {
    volume_size = 30
  
  }
}
