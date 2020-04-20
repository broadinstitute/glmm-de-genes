#!/bin/sh

set -ev

VERSION=`cat VERSION.txt`

docker build -t kdgosik/fastlmm:$VERSION .
docker build -t kdgosik/fastlmm:latest .
