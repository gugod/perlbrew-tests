#!/bin/bash
set -x

export PERLBREW_DOCKER_MACHINE_NAME=perlbrew-test

docker-machine inspect ${PERLBREW_DOCKER_MACHINE_NAME} >/dev/null
if [[ $? != 0 ]] 
then
    docker-machine create --driver virtualbox ${PERLBREW_DOCKER_MACHINE_NAME}
fi

docker-machine start ${PERLBREW_DOCKER_MACHINE_NAME}

eval $(docker-machine env ${PERLBREW_DOCKER_MACHINE_NAME})

cd $(dirname $0)/docker-images
for f in */Dockerfile
do
    tag=$(basename $(dirname $f))
    docker build -t perlbrew-test-in-$tag $tag
done
