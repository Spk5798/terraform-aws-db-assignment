resource "aws_vpc" "main" {

 cidr_block = "10.0.0.0/16"

 tags = {

 Name="dev-vpc"

 }

}
resource "aws_subnet" "public" {

vpc_id = aws_vpc.main.id

cidr_block="10.0.1.0/24"

availability_zone="us-east-1a"


tags={

Name="public-subnet"

}

}
resource "aws_instance" "web" {


ami="ami-01a18c38ece67e620"

instance_type="t3.micro"


subnet_id=aws_subnet.public.id


tags={

Name="application-server"

}


}
resource "aws_s3_bucket" "backup" {


bucket="database-backup-demo"


}
