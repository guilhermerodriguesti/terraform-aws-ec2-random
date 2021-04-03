
provider "aws" {
  region = "us-east-1"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"

}

provider "random" {}

resource "random_pet" "name" {}

resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")

  tags = {
    Name = random_pet.name.id
  }
}


