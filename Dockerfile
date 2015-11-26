# Latest version of centos

FROM centos:centos7

MAINTAINER Toshio Kuratomi <tkuratomi@ansible.com>

# install dependencies
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip

# create Ansible directory and add playbooks
RUN mkdir -p /etc/ansible/playbooks/
ADD etc/ansible/playbooks /etc/ansible/playbooks

# create Ansible hosts file
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

# install Ansible
RUN pip install ansible
