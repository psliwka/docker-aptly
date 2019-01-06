all: latest

latest:
	docker build -t psliwka/aptly .

login:
	printenv "DOCKER_PASSWORD" | docker login -u "psliwkadeploys" --password-stdin

push: login
	docker push psliwka/aptly

clean:
	docker rmi psliwka/aptly

.PHONY: latest login push
