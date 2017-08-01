#! /bin/bash

## BASH script to build "dev" version of container
## these commands can be run on any platform with docker and docker-compose,

# work from this directory
pushd $(dirname $0)

# remove build and/or dist directories
rm -rf build dist

# revert to original directory
popd
