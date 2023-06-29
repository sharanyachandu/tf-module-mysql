resource "aws_instance" "schema" {
 
 
  provisioner "local-exec" {
    command = <<EOF
    cd /tmp
    curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
    unzip mysql.zip
    cd mysql-main
    mysql -h ${aws_db_instance.mysql.address} -uadmin1 -pRoboShop1 < shipping.sql
    EOF
  }

}