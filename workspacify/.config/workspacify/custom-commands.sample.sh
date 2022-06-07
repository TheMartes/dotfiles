#!/usr/bin/sh

declare -A custom_commands

custom_commands[project] = './scripts/run_project.sh' 

# App will fallback to this when no docker-compose is found
# so make sure to add here apps you are not starting with docker-compose
