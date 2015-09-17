#version 0.0.1
FROM centos:latest #基础镜像
MAINTAINER frank "joyoak@163.com"

RUN yum -y groupinstall "development tools"
RUN yum -y install git rpm rpm-build rpmdevtools rng-tools
RUN yum -y install passwd
RUN yum -y install wget
RUN yum -y install vim
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
CMD /etc/init.d/sshd reload
CMD /etc/init.d/sshd restart
CMD service sshd start

EXPOSE 22