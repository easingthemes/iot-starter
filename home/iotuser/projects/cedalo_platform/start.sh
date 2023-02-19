#!/usr/bin/env bash

echo "Start ALL"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
cd "$SCRIPT_DIR" || exit

IS_STARTED=false
until [ "$(docker inspect -f {{.State.Running}} mosquitto-starter)" == "true" ]; do
    echo "wait"
    sleep 0.1;
    if [ $IS_STARTED == "false" ]; then
      bash ./mosquitto/start.sh &
      IS_STARTED=true
    fi
done;
bash ./management-center/start.sh
