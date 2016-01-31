FROM jenkins
USER root
RUN apt-get update && apt-get install -y docker.io sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins
