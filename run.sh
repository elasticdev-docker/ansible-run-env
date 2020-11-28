#!/bin/bash

export SHARE_DIR=${SHARE_DIR:=/var/tmp/share}

cd $SHARE_DIR || exit 4

for i in ${ANSIBLE_EXEC_YMLS//,/ }
do
   # call your procedure/other scripts here below
   echo ""
   echo "Executing top level role $i"
   echo ""
   ansible-playbook -i hosts $i || exit 31
done
