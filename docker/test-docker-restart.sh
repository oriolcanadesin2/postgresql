#!/bin/bash
# This script is used to bring down the docker containers and remove the volumes.
# It is used to test the docker-compose.yml file.
# It is not used in production.

# bring down the containers and remove the volumes
docker-compose down -v

# Remove Postgres volume, if any
POSTGRES_VOLUME="postgres"
if docker volume ls | grep -q $POSTGRES_VOLUME; then
    docker volume rm $POSTGRES_VOLUME
fi

# Remove all other volumes used by docker-compose, if any
# shellcheck disable=SC2046
VOLUMES=$(docker volume ls -qf dangling=true)
if [ -n "$VOLUMES" ]; then
    docker volume rm "$VOLUMES"
fi

# Optional: Download the latest images
docker-compose pull

# Optional: Build the docker-compose images
docker-compose up -d
