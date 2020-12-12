# Dockerfile inspired by
# https://github.com/containers/buildah/blob/master/docs/tutorials/05-openshift-rootless-bud.md

FROM quay.io/buildah/stable:v1.14.8

RUN touch /etc/subgid /etc/subuid \
 && chmod g=u /etc/subgid /etc/subuid /etc/passwd \
 && echo build:10000:65536 > /etc/subuid \
 && echo build:10000:65536 > /etc/subgid

# Use chroot since the default runc does not work when running rootless
RUN echo "export BUILDAH_ISOLATION=chroot" >> /home/build/.bashrc

# Use VFS since fuse does not work
RUN mkdir -p /home/build/.config/containers \
 && echo "driver=\"vfs\"" > /home/build/.config/containers/storage.conf

USER build
WORKDIR /home/build

CMD ["/bin/sh"]
