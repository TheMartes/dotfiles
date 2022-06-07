#!/usr/bin/sh

source custom-commands.private.sh

run_project() {
    # Shortcut for custom command
    CC=${custom_commands[$(basename "$1")]}

    # If it's docker project
    DOCKERFILE="$1/Dockerfile"

    if [ -f "$DOCKERFILE" ] && [ -z "$CC" ]; then
        cd "$1" && docker-compose up
    else
        # If not fallback to custom command
        if [ -n "$CC" ]; then
            cd "$1" && eval "$CC"
        fi
    fi

}
