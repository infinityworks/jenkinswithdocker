# Use the 'https://github.com/jenkinsci/docker' image
FROM jenkins
USER root
RUN apt-get update && apt-get install -y sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Installing docker is now much more sane
RUN curl -sSL https://get.docker.com/ | sh

USER jenkins

# Install the plugins specified in the 'plugins.txt'
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
