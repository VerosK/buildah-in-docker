#!/bin/sh

buildah build-using-dockerfile -t localhost/python -f .
buildah push localhost/python docker-archive:images/python-image.tar

# Alternative targets
# https://github.com/containers/buildah/blob/master/docs/buildah-push.md#destination

