all: images tags

images: aptly-versions.txt
	make -j8 -f Makefile.per-version all

tags: aptly-versions.txt
	docker tag psliwka/aptly:$(shell head -n1 aptly-versions.txt) psliwka/aptly:latest

aptly-versions.txt:
	docker build -t aptly-temporary .
	docker run --rm aptly-temporary /bin/sh -c "apt-get update -qq && apt-cache madison aptly" \
	| cut -d "|" -f 2 \
	| tr -d " " \
	| grep -v "^0" \
	> aptly-versions.txt

login:
	printenv "DOCKER_PASSWORD" | docker login -u "psliwkadeploys" --password-stdin

push: login
	docker push psliwka/aptly

clean:
	docker rmi -f aptly-temporary
	docker rmi -f psliwka/aptly
	rm -f aptly-versions.txt
