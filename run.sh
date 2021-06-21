#!/bin/bash
rm -rf jpipeline
git clone git@github.com:iamhook/jpipeline.git
cd jpipeline
./gradlew jpipeline-executor:bootJar
./gradlew jpipeline-manager:bootJar
cd ../
docker build -t jpipeline/jpipeline-docker .
