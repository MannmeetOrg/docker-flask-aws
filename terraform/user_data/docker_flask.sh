#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
docker login -u cloudmahir19 -p <DOCKER_HUB_PASSWORD>
docker pull cloudmahir19/flaskapp:latest
docker run -d --name flask_app -p 80:5000 \
  -e FLASK_ENV=production \
  -e FLASK_SECRET_KEY=<FLASK_SECRET_KEY> \
  -e DB_HOST=<DB_HOST> \
  -e DB_PORT=3306 \
  -e DB_NAME=flask_app_db \
  -e DB_USER=flask_user \
  -e DB_PASSWORD=Flask@1234 \
  -e DEBUG=False \
  cloudmahir19/flaskapp:latest
