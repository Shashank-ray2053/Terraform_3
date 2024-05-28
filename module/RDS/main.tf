

resource "aws_db_subnet_group" "shashank_db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [var.skr_private_subnet_1,var.skr_private_subnet_2]

  tags = {
    Name = "shashank_db_subnet_group"
   
  }
}



resource "aws_db_instance" "shashank_db" {
    allocated_storage    = 10
  db_name              = "Players"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin123"
  password             = "admin123"
  db_subnet_group_name = aws_subnet_group.shashank_db_subnet_group
  skip_final_snapshot  = false
  multi_az = true
  
}