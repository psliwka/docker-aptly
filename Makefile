build:
	# placeholder

login:
	printenv "DOCKER_PASSWORD" | docker login -u "psliwkadeploys" --password-stdin

push: login
	docker push psliwka/aptly

.PHONY: login push
