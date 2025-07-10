output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "mysql_private_ip" {
  value = aws_instance.mysql.private_ip
}
