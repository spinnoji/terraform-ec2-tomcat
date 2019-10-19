resource "aws_instance" "example123" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "mumbai"

  provisioner "file" {
    source      = "conf/"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    user        = "${var.INSTANCE_USERNAME}"
    type        = "ssh"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
