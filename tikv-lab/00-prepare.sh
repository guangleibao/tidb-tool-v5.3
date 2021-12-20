#!/bin/bash

# Install
sudo apt update -y
sudo apt install ntp mysql-client -y
sudo systemctl restart ntp
sudo apt install awscli -y

# Setup Region
REGION_CODE=`curl http://169.254.169.254/latest/meta-data/placement/region`

echo export REGION_CODE=${REGION_CODE} > ./cloud-env.sh

# Setup Demo Host Info
HOST_DEMO_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

echo export HOST_DEMO_PRIVATE_IP=${HOST_DEMO_PRIVATE_IP} > ./host-demo-env.sh
echo ssh -A ${HOST_DEMO_PRIVATE_IP} > ./ssh-to-demo.sh

# Setup Bastion Host Info
HOST_BASTION_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:Name,Values=bastion" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

echo export HOST_BASTION_PRIVATE_IP=${HOST_BASTION_PRIVATE_IP} > ./host-bastion-env.sh
echo ssh -A ${HOST_BASTION_PRIVATE_IP} > ./ssh-to-bastion.sh

# Setup hybrid.yaml
cp ./hybrid-template.yaml ./hybrid.yaml
sed -i '' -e "s/<HOST_BASTION_PRIVATE_IP>/${HOST_BASTION_PRIVATE_IP}/g" ./hybrid.yaml 2>/dev/null
sed -i '' -e "s/<HOST_DEMO_PRIVATE_IP>/${HOST_DEMO_PRIVATE_IP}/g" ./hybrid.yaml 2>/dev/null
echo hybrid.yaml for cluster prepared

# Conslusion
chmod +x ./*.sh