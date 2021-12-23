# Simplest Demo for Playing with TiDB
# No containers for this version

## Preparattion steps for the "cloud guys"
1. Spin up an Ubuntu 18.04 VM in the cloud.
2. `ssh` into this VM by using `-A` option (for simple handling the `-i` and `-u` options with `tiup` tool).
3. Make sure current user has passwordless `sudo` permission.

## general-lab folder
### Concept
+ `general-lab` will deploy an all-in-one cluster on single EC2 instance.
+ No replication for any components.
### Manual Preparation
+ N/A
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect.sh`
+ Tier down **caution**: `destroy-all.sh`

## tidb-lab folder
### Concept
+ `tikv-lab` will deploy an all-in-one cluster on single EC2 instance.
+ 2 tidb servers will be deployed.
### Manual Preparation
+ N/A
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect-4000.sh` or `connect-4001.sh`
+ Tier down **caution**: `destroy-all.sh`

## tikv-lab folder
### Concept
+ Currently scripts are designed for AWS
+ `tikv-lab` will deploy a hybrid cluster across two EC2 instances.
+ 3 tikv servers will be deployed.
### Manual Preparation
+ Spin up two EC2 instances, tag:Name them with `bastion` and `demo` respectively.
+ Assign read EC2 service role to above EC2 instances.
+ Smooth the network traffics between them.
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect-demo.sh` and `connect-bastion.sh`
+ Tier down **caution**: `destroy-all.sh`
