# Simplest Demo for Playing with TiDB
# No containers for this version

## Preparattion steps for the "cloud guys"
1. Spin up an Ubuntu 18.04 VM in the cloud.
2. `ssh` into this VM by using `-A` option (for simple handling the `-i` and `-u` options with `tiup` tool).
3. Make sure current user has passwordless `sudo` permission.

## tikv-lab
### Manual Preparation
+ Spin up two EC2 instances, tag:Name them with `bastion` and `demo` respectively.
+ Assign read EC2 service role to above EC2 instances.
### How to Run
+ Simple setup scripts: `00`, `01`, `02`
+ Start/Stop scripts: `03`, `04`
+ Simple check: `check-cluster.sh`
+ Simple connection for MySQL interface: `connect.sh`
+ Tier down **caution**: `destroy-all.sh`
