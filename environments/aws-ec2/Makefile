.PHONY: run deploy ssh prepare-ssh start-instance stop-instance destroy

.DEFAULT_GOAL := run

run: deploy start-instance ssh

deploy:
	yarn
	direnv exec . yarn cdk deploy

ssh: prepare-ssh
	direnv exec . ssh -v lamb-sbx-ec2

prepare-ssh:
	direnv exec . .bin/prepare-ssh

start-instance:
	direnv exec . aws ec2 start-instances --instance-ids $(shell direnv exec . .bin/get-instance-id)
	sleep 60

stop-instance:
	direnv exec . aws ec2 stop-instances --instance-ids $(shell direnv exec . .bin/get-instance-id)

destroy:
	yarn
	direnv exec . yarn cdk destroy
