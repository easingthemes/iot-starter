#!/usr/bin/env bash

echo "Stop ALL"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
cd "$SCRIPT_DIR" || exit
bash ./mosquitto/stop.sh
bash ./management-center/stop.sh
