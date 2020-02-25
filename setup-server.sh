#!/usr/bin/env bash
set -euxo pipefail

curl -X POST ssrg:5060/register -d "instance=$POD_NAME&ip=$POD_IP" > nodeid.txt

curl ssrg:5060/config > config/hosts.config
cat config/hosts.config

ID=$(<nodeid.txt)

NUM_NODES=$(wc -l config/hosts.config | cut -d' ' -f1)

SEQ=$(seq -s, 0 $(($NUM_NODES-1)))

sed -i "s/system.initial.view.*/system.initial.view = $SEQ/" config/system.config
grep "system.initial.view" config/system.config