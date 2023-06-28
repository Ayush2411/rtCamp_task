# rtCamp_task

The project contains two files:
1. compose.yaml
2. task.sh

Points to remember to run the script.
* Clone the repository in a folder and open terminal inside it and run .\task.sh
* The script contains bash commands to check the respective versions of Docker and Docker compose in the system. If they don't exist then it automatically installs the latest versions.
* Once installed, the docker-compose file will be triggered to create the containers of mysql db and wordpress using the latest images from Docker Hub.
* After successfull container creation, the script will add localhost to the host file of the system and prompg user to open Google Chrome browser to check the application.
* Once all these operations are performed, the script will stop and remove the running containers.
  
