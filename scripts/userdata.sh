#!/bin/bash
set -e

# Replace {YOUR_GIT_REOPO_URL} with your actual Git repository URL
GIT_REPO_URL="https://github.com/agent-xlvii/django-aws-asg-alb-r53-ssl.git"
#GIT_REPO_URL="https://<your_username>:<your_PAT>@github.com/codewithmuh/django-aws-ec2-autoscaling.git"

# Replace {YOUR_PROJECT_MAIN_DIR_NAME} with your actual project directory name
PROJECT_MAIN_DIR_NAME="django_aws"

# Clone repository
git clone "$GIT_REPO_URL" "/home/ubuntu/$PROJECT_MAIN_DIR_NAME"

cd "/home/ubuntu/$PROJECT_MAIN_DIR_NAME"

# Make all .sh files executable
chmod +x scripts/*.sh

# Execute scripts for OS dependencies, Python dependencies, Gunicorn, Nginx, and starting the application
./scripts/instance_os_dependencies.sh
./scripts/python_dependencies.sh
./scripts/gunicorn.sh
./scripts/start_app.sh