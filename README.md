# docker-flask-aws
Dockerized Flask App with AWS with Terraform, Ansible and Github CI/CD


flask-aws-ci-cd/
├── ansible/
│   ├── inventory
│   ├── deploy_blue_green.yml
│   ├── setup_mysql.yml
│   ├── setup_docker.yml
│   └── group_vars/
│       ├── all.yml
│       └── blue_green_group.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── ec2.tf
│   ├── security_groups.tf
│   ├── asg.tf
│   ├── alb.tf
│   ├── user_data/
│   │   ├── jenkins.sh
│   │   └── mysql.sh
├── jenkins/
│   └── Jenkinsfile
├── flask_app/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── ...
└── README.md


