#!/bin/bash

[ $DEBUG ] && set -x

KANBAN_REDIS_ADDR=${REDIS_HOST:-127.0.0.1}:${REDIS_PORT:-6379}

# test redis connection
for i in {30..0}; do
  if nc -w 1  -v $REDIS_HOST $REDIS_PORT; then
  break
  fi
  echo 'Waiting redis start...'
  sleep 1
done

/opt/kanban/kanban server
