FROM jenkinsci/slave
USER root

#docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce

#node 8 environment
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install nodejs -y

#maven
RUN apt-cache search maven
RUN apt-get install maven -y



VOLUME root/.m2