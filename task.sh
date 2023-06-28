#!/bin/bash

docker -v
if echo $? = 0 ; then
    echo "The program 'docker' is currently not installed."
	sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add - sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main" sudo apt-get update
	sudo apt-get -y install docker-engine # add current user to docker group so there is no need to use sudo when running docker
	sudo usermod -aG docker $(whoami)
	sudo systemctl enable docker
	printf '\nDocker installed successfully\n\n'
else
    echo "Continuing with dockerized way"
fi

docker-compose -v
if echo $? = 0 ; then
	echo "The program 'docker-compose' is currently not installed."
    sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"
	sudo chmod +x /usr/local/bin/docker-compose
	sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
	printf '\nDocker Compose installed successfully\n\n'
else
    echo "Continuing with dockerized way"
fi

docker-compose -f compose.yml up -d

echo "127.0.0.1  example.com" >> /etc/hosts
google-chrome http://localhost

docker rm $(docker ps -a -q)