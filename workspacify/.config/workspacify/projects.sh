#!/usr/bin/bash

source variables.sh

declare -A PROJECTS

for directory in $(ls -d ${PATH_PREFIX}/*); do
    PROJECT_NAME="$(basename $directory)"
    PROJECTS[${PROJECT_NAME}]="${PATH_PREFIX}/${PROJECT_NAME}"
done
