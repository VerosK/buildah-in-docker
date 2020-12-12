import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_docker_installed(host):
    docker = host.file("/usr/bin/docker")
    assert docker.is_file


def test_docker_compose_installed(host):
    docker_compose = host.file("/usr/bin/docker-compose")
    assert docker_compose.is_file
