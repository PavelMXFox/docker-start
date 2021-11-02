#!/bin/sh

find /opt/containers/ -maxdepth 1 -type l -exec bash -c "\
    test -f '{}/docker-compose.yml' \
    && cd '{}' \
    && docker-compose -f '{}/docker-compose.yml' down -v" \;

find /opt/containers/ -maxdepth 1 -type d -exec bash -c "\
    test -f '{}/docker-compose.yml' \
    && cd '{}' \
    && docker-compose -f '{}/docker-compose.yml' down -v" \;

echo "Stoped. Press Ctrl+C to cancel NOW";
sleep 1;

find /opt/containers/ -maxdepth 1 -type l -exec bash -c "test -f '{}/docker-compose.yml'  && cd '{}' && docker-compose -f '{}/docker-compose.yml' up -d" \;
find /opt/containers/ -maxdepth 1 -type d -exec bash -c "test -f '{}/docker-compose.yml'  && cd '{}' && docker-compose -f '{}/docker-compose.yml' up -d" \;
