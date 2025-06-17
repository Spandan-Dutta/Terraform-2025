terraform {
    required_version = ">= 0.12"
}

resource "aws_instance" "ec2_module_1" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "terraform-key"
    vpc_security_group_ids = [aws_security_group.main-sg.id] 
    tags = {
        Name = "EC2-webserver-1"
    }
    
    user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update -y
        sudo apt-get install -y apache2
        sudo systemctl status apache2
        sudo systemctl enable apache2
        sudo systemctl start apache2
        sudo chown -R $USER:$USER /var/www/html
        sudo echo "<h1>Welcome to Jhooq Module 1 Guysss!!!!!</h1> > /var/www/html/index.html
        EOF
}

resource "aws_security_group" "main-sg" {
    name = "EC2-webserver-SG-1"
    description = "Webserver Security Group for EC2 Module 1"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["213.4.127.18/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_key_pair" "terraform_key" {
    key_name = "terraform-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDsEkqGSbIkpLgu5iF2y7y7H0CD8uTEkpo1KfZ512AFm8P31Eb/ixi8Sx8CT0PVXlNaTSPkzyUqJ8suLWuj9zcTJpnz2saDcctzD31kaBqBbg/YkBrBa+8GXfRMkojhTIO0wEA9tL/uSl2pU9IG/IA1wGWpw3MKIirjrqGkR9JKfFpKNLOb82GsOEdz+f2bq0zKDgzmSY9I8BLMEaHa4olCFyDxgUiySnjRUYrgCcYeBJm1mNAKsA6Otp2YSyZbbSbUyyaaFjFM0h0HR8BzUZtZJ9EOTHsFpTuLJF252tnE19CDKR9VqmX0yqykE6Dhm/Q7tqgILBm5esHUd7uO/CO72/MWdgQFpNBHOw0FcmM2eYWPzNPQq5enpKYsTl4MWqpLEkjwV3UU1lHbzIfXAsWmhFos/Pj5dlgGIzqCiSarG0WQLqBmFzw3xec6t3NzCHerj/Pxre9Gv0tEyaF26GoxAXZ2L3XUzT+OZwxI70fHErxV1Vte3N5QPnOJS60qxPb49pZgqSA75R78ypCkbpzVq317mvqWo83aeTGnqqWZSf/3ZoGHnCSaajxsuX/DQ9QSaLv2NRAczHu8yBYsST10WSYMUfadp9Zly/AI9XNV8wnjrPZ4oVYk5viHguJsP5xi3ueMhTRx8RZZoB82nQiWrn3KnwGfjKtmbNoUXuYV3w== spandandutta@Spandans-MacBook-Air.local"
}