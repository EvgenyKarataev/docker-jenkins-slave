FROM ubuntu:14.04
MAINTAINER Evgeny Karataev <Karataev.Evgeny@gmail.com>

RUN apt-get update && apt-get install -y \
    openssh-server \
    openjdk-7-jdk \
    curl \
    unzip \
    wget

RUN mkdir -p /var/run/sshd

ENV MAVEN_VERSION 3.2.5


RUN useradd -d /home/jenkins jenkins
RUN mkdir -p /home/jenkins
RUN chown jenkins /home/jenkins

RUN echo "jenkins:jenkins" | chpasswd

VOLUME /var/jenkins

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

USER jenkins