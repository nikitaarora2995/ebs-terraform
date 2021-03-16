provider "aws" {
  region = "us-west-2"
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-west-2c"
  size              = 8
  type              = "gp2"

  tags = {
    Name = "ebs-volume-terraform-demo"
  }
}

resource "aws_volume_attachment" "ebc_volume_attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = "i-088e5dcbf8d9d2766"
}

data "template_file" "init" {
  template = "${file("volume.sh")}"

 }