run:
	ansible-playbook --ask-become-pass --ask-vault-pass local.yml

pull:
	ansible-pull -U https://github.com/her0elt/computer-setup.git  --ask-become-pass --ask-vault-password
new:
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update -y
	sudo apt-get install -y curl git software-properties-common ansible
	ansible-pull --ask-become-pass --ask-vault-password -U https://github.com/her0elt/computer-setup.git

