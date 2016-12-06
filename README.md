# JenkinsWithDocker

Based on the popular [Jenkins Docker](https://github.com/jenkinsci/docker) image... but with Docker available for builds.

For easy reference:

# Usage

```
docker run -p 8080:8080 -p 50000:50000 jenkins
```

NOTE: read below the _build executors_ part for the role of the `50000` port mapping.

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration.
You will probably want to make that an explicit volume so you can manage it and attach to another container for upgrades :

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins
```

this will automatically create a 'jenkins_home' volume on docker host, that will survive container stop/restart/deletion. 


## Note

Perhaps you want to run your own little docker commands inside the container, then you would need to:
* add the jenkins user to the docker group (inside the container you run: _sudo usermod -aG docker $(whoami)_ )
* mount the /var/run/docker.sock from the host to the container as part of the _docker run_

```
docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock --name docker-jenkins iw-bp/jenkins-docker:latest
```
