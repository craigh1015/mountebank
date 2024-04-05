#!/bin/sh

DOCKER_BUILDKIT=1 docker build -t mb_local .
docker run -it --name mb mb_local node_modules/grunt-cli/bin/grunt test:functional
rm *.log
docker cp mb:mb-test.log   .
docker cp mb:mb-grunt.log  .
docker rm mb
docker ps -a
# tail -200 *.log
