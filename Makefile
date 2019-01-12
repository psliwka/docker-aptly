all: images tags

images: versions-to-build.txt
	make -j8 -f Makefile.per-version all

tags: versions-to-build.txt
	docker tag psliwka/aptly:$(shell head -n1 versions-to-build.txt) psliwka/aptly:latest

versions-to-build.txt:
	docker build -t aptly-temporary .
	docker run --rm aptly-temporary /bin/sh -c "apt-get update -qq && apt-cache madison aptly" \
	| cut -d "|" -f 2 \
	| tr -d " " \
	| grep -v "^0" \
	> versions-to-build.txt

login:
	printenv "DOCKER_PASSWORD" | docker login -u "psliwkadeploys" --password-stdin

push: login
	docker push psliwka/aptly

clean:
	docker images psliwka/aptly --format="{{.ID}}" | xargs docker rmi -f aptly-temporary
	rm -f versions-to-build.txt
