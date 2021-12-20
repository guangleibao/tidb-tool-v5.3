# For playground
#~/.tiup/bin/tiup client

source ./host-demo-env.sh

# For cluster
mysql -h ${HOST_DEMO_PRIVATE_IP} 4000 -u root
