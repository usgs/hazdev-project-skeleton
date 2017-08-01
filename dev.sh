#! /bin/bash

## BASH script to build "dev" version of container
## these commands can be run on any platform with docker and docker-compose,

# work from this directory
pushd $(dirname $0)

# do initial build before docker-compose up
echo "## Building project using \"grunt build\""
docker-compose run --rm grunt /bin/bash --login -c "grunt build"

# run dev environment
echo
echo "## Starting dev environment"
docker-compose up

# switch back to original directory
popd
