#!/bin/sh
set -e

if [ "$1" = 'compliance' ]; then
  compliance --migrate-db --config $CONFIG_FILE_PATH
  compliance --config $CONFIG_FILE_PATH
fi

exec "$@"
