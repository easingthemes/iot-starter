#!/usr/bin/env bash

echo "Build ALL $1"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
cd "$SCRIPT_DIR" || exit
bash ./mosquitto/build.sh
bash ./management-center/build.sh "$1"
