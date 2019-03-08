

######### Install OCP and its prerequisits

rm -fr /var/cache/yum/*

yum clean all

yum install -y wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct

yum install -y vim

yum install -y tmux

yum update -y

yum install -y  openshift-ansible

cp /tmp/scripts/version_check.yml /usr/share/ansible/openshift-ansible/roles/openshift_storage_glusterfs/tasks/version_check.yml


###### Define the bastian as Gateway for all other nodes (disabled by Red Hat):

#sysctl net.ipv4.ip_forward=1
