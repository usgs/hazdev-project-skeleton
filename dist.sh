#! /bin/bash

## BASH script to build "dist" version of container with minified JS and CSS
## these commands can be run on any platform with docker and docker-compose,
## by substituting environment variables defined in the ".env" file


# work from this directory
pushd $(dirname $0)

# load environment file
source ".env"

# build dist target
echo "## Building distribution using \"grunt builddist\""
docker-compose run grunt /bin/bash --login -c "grunt builddist"

# build image
echo
echo "## Creating container tag \"usgs/${APP_NAME}:latest\""
docker build -t usgs/${APP_NAME}:latest --build-arg APP_NAME=${APP_NAME} .

# output example command to run built image
echo
echo "## Run container using the following command"
echo "docker run --rm -p ${EXPOSE_PORT}:80 --env-file .env usgs/${APP_NAME}:latest"

# revert to original directory
popd
