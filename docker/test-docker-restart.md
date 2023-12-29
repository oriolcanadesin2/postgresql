# Script: test-docker-restart.sh

1. Create a Script to stop and delete all containers and resources created by docker-compose, and then run the docker-compose command to create the container again.

```bash
#!/bin/bash
# This script is used to bring down the docker containers and remove the volumes.
# It is used to test the docker-compose.yml file.
# It is not used in production.

# bring down the containers and remove the volumes
docker-compose down -v

# Remove all images
# shellcheck disable=SC2046
docker rmi $(docker-compose images -q)

# Remove all volumes
# shellcheck disable=SC2046
docker volume rm $(docker volume ls -q)

# Once it is down and removed, we can bring it back up
docker-compose up -d
```

2. Make the script executable.

```bash
chmod +x test-docker-restart.sh
```

3. Validate permissions.

```bash
ls -l test-docker-restart.sh
```

4. Run the script.

```bash
./test-docker-restart.sh
```
