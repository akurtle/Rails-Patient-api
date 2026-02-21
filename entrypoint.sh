#!/usr/bin/env bash
set -e

bundle check || bundle install
mkdir -p tmp/pids

exec "$@"
