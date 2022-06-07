#!/usr/bin/bash

source projects.sh
source runner.sh

PROJECT_NAME=''
CUSTOM_COMMAND=''

print_usage() {
    printf "Usage:
    -p - Project name
    -c - Custom Command : If different thant docker-compose up
"
}

while getopts "p:c:" flag; do
    case "${flag}" in
    p) PROJECT_NAME="${OPTARG}" ;;
    c) CUSTOM_COMMAND="${OPTARG}" ;;
    *)
        print_usage
        exit 1
        ;;
    esac
done

if [ $# -eq 0 ]; then
    print_usage
    exit 1
fi

if [ ! -z "$PROJECT_NAME" ]; then
    run_project ${PROJECTS[$PROJECT_NAME]}
fi
