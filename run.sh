#!/bin/sh

export SHARE_DIR=${SHARE_DIR:=/var/tmp/share}
export EXEC_DIR=${EXEC_DIR:=/var/tmp/share/var/tmp/ansible}

cd $EXEC_DIR || exit 4

echo ""
echo ""
echo "the configuration files in exec_dir $EXEC_DIR"
find .
echo ""
echo ""

for i in ${ANSIBLE_EXEC_YMLS//,/ }
do
   # call your procedure/other scripts here below
   echo ""
   echo "Executing top level role $i from exec_dir $EXEC_DIR"
   echo ""
   ansible-playbook -i hosts $i || exit 31
done
