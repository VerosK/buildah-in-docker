#!/bin/sh

mkdir -p images

docker run --rm -it \
  -v $(pwd)/python.Dockerfile:/home/build/Dockerfile \
  -v $(pwd)/run-buildah-build.sh:/home/build/run-buildah-build.sh \
  -v $(pwd)/images:/home/build/images:Z \
  --privileged \
  --entrypoint sh \
  localhost/buildah \
  run-buildah-build.sh
