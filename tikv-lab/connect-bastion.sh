#!/bin/bash

# For playground
#~/.tiup/bin/tiup client

source ./host-bastion-env.sh

# For cluster
mysql -h ${HOST_BASTION_PRIVATE_IP} -P 4000 -u root
