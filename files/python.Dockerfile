# This is minimal Dockerfile
# It is used for buildah testing

FROM alpine:latest

RUN apk add python3

ENTRYPOINT [ "python" ]
