Yet another Docker image for aptly
==================================
[![build status](https://travis-ci.org/psliwka/docker-aptly.svg?branch=master)](https://travis-ci.org/psliwka/docker-aptly)
[![latest version](https://images.microbadger.com/badges/version/psliwka/aptly.svg)](https://hub.docker.com/r/psliwka/aptly/tags)

This repo houses scripts building [docker](https://www.docker.com/) images for
[aptly](https://www.aptly.info/). Images are built daily with
[Travis CI](https://travis-ci.org/psliwka/docker-aptly) and uploaded to
[Dockerhub](https://hub.docker.com/r/psliwka/aptly).

Available tags
--------------

Currently, there are separate tags for every aptly version since 1.0.0. New
releases should be added automatically within 24 hours.

Please note that **all** tags are rebuilt daily, to ensure that they are based
on up-to-date Debian image.

Usage
-----

At this moment, this image does not wrap any actual Aptly functionality (no
configuration, no custom entrypoint, etc.). After you pull the image with
`docker pull psliwka/aptly`, it's up to you to configure it and run it in a way
that matches your needs.

Similar projects
----------------

Aptly's readme lists at least two other projects packing it into Docker images:
* [mikepurvis/aptly-docker](mikepurvis/aptly-docker), which looks dead at the
  time of writing this;
* [urpylka/docker-aptly](urpylka/docker-aptly), which has some nifty features,
  but it was overly complex for my use-case. Additionally, it seems not to be
  updated on par with its base image.
