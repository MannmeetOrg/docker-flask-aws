resource "aws_launch_template" "flask_app" {
  name_prefix   = "flask-app-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair

  user_data = filebase64("user_data/docker_flask.sh")

  security_group_names = [aws_security_group.web_sg.name]
}

resource "aws_autoscaling_group" "flask_app" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 2
  vpc_zone_identifier  = [aws_subnet.public.id]
  launch_template {
    id      = aws_launch_template.flask_app.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.flask_app.arn]
  health_check_type = "EC2"
  tags = [
    {
      key                 = "Name"
      value               = "flask-app"
      propagate_at_launch = true
    }
  ]
}
