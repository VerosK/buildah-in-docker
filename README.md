#  Buildah in Docker playground

**Objectives**: Test building Container images with buildah in Docker containers.

It works:

### How to use

1. Start the VM (possibly change distribution in `Vagrantfile`) with Docker

       vagrant up
       
2. Enter the VM with
 
       vagrant ssh       

3. Build `buildah` Docker image with `docker build`

      ./prepare-buildah-container.sh
      
4. Create python image based on `alpine` and save it 

       ./test-buildah.sh
       
   The image is going to be saved int `/home/vagrant/images`


### Links 

* *Best practices for running Buildah in a container (2019-04)*
    https://developers.redhat.com/blog/2019/08/14/best-practices-for-running-buildah-in-a-container/

* *Rootless build (2020-09)*
  https://github.com/containers/buildah/blob/master/docs/tutorials/05-openshift-rootless-bud.md

### Why?

We have some VMs running Docker and we need to build container images
on them without accessing Docker daemon from the container.
