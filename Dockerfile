FROM jenkins
USER root
RUN apt-get update && apt-get install -y sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN wget -O /usr/bin/docker "https://get.docker.com/builds/Linux/x86_64/docker-latest" && chmod +x /usr/bin/docker
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
