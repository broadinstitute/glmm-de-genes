#!/bin/sh

set -ev

VERSION=`cat VERSION.txt`

docker push kdgosik/fastlmm:${VERSION}
docker push kdgosik/fastlmm:latest
