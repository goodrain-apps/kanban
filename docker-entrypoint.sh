#!/bin/bash

[ $DEBUG ] && set -x

KANBAN_REDIS_ADDR=${REDIS_HOST:-127.0.0.1}:${REDIS_PORT:-6379}

/opt/kanban/kanban server
