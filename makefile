infrastructure:
	# Get the modules, create the infrastructure.
	terraform init && terraform get && terraform apply --target=ibm_compute_ssh_key.ssh_key_openshift --target=random_id.ose_name --target=module.network --target=module.sg --target=module.bastion --target=module.masternode --target=module.appnode --target=module.infranode --target=module.towernode --auto-approve
	
	terraform init && terraform get && terraform apply --target=module.storagenode --target=module.inventory --auto-approve --parallelism=1


rhnregister:	
	@[ "${rhn_username}" ] || ( echo ">> rhn_username is not set"; exit 1 )
	@[ "${rhn_password}" ] || ( echo ">> rhn_password is not set"; exit 1 )
	@[ "${pool_id}" ] || ( echo ">> pool_id is not set"; exit 1 )


	# Register the System with redhat
	terraform init && terraform get && terraform apply --target=module.rhn_register --auto-approve -var 'rhn_username=${rhn_username}' -var 'rhn_password=${rhn_password}' -var 'pool_id=${pool_id}'

openshift:	
	# Get the modules, for the pre install steps.
	terraform init && terraform get && terraform apply --target=module.openshift --auto-approve 
	
destroy:
	# terraform init && terraform get && terraform destroy --target=module.loadbalancer --parallelism=1 --auto-approve 
	terraform init && terraform get && terraform destroy --auto-approve 
