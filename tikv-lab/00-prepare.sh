#!/bin/bash
sudo apt update -y
sudo apt install ntp mysql-client -y
sudo systemctl restart ntp
sudo apt install awscli -y

REGION_CODE=`curl http://169.254.169.254/latest/meta-data/placement/region`

echo export REGION_CODE=${REGION_CODE} > ./cloud-env.sh

HOST_DEMO_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_BASTION_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=bastion" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

echo export HOST_BASTION_PRIVATE_IP=${HOST_BASTION_PRIVATE_IP} > ./host-bastion-env.sh
chmod +x ./host-bastion-env.sh
echo export HOST_DEMO_PRIVATE_IP=${HOST_DEMO_PRIVATE_IP} > ./host-demo-env.sh
chmod +x ./host-demo-env.sh
