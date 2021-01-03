.PHONY: update start-aws-ec2 start-vagrant-ubuntu start-vagrant-kali

.DEFAULT_GOAL := update

update:
	cd ${HOME}/.dotfiles/ && ./bin/update-dotfiles.sh

start-aws-ec2:
	cd ${HOME}/.dotfiles/environments/aws-ec2 && make

start-vagrant-ubuntu:
	cd ${HOME}/.dotfiles/environments/vagrant-ubuntu && vagrant up && vagrant ssh

start-vagrant-kali:
	cd ${HOME}/.dotfiles/environments/vagrant-kali && vagrant up && vagrant ssh
