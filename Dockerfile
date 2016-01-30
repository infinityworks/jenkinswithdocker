FROM jenkins
USER root
RUN apt-get update && apt-get install -y docker.io sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins
ADD startup.sh /usr/local/bin/startup.sh
RUN sudo chmod +x /usr/local/bin/startup.sh
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/startup.sh"]
