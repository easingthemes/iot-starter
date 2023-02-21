#!/usr/bin/env bash

echo "MC Build"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"
cd "$SCRIPT_DIR" || exit
echo "Node and NPM: $(which node)"
node -v
npm -v

if [ "force" == "${1}" ]; then
  bash ./install.sh
fi
if [ "skipnpm" != "${1}" ]; then
  echo "NPM install"
  npm install
  cd ./src || exit
  echo "Yarn install"
  yarn install --network-timeout 100000
  whoami
  id
  ls -l "$SCRIPT_DIR"/src/frontend/node_modules/.cache
  chown -R 1001:1001 "$SCRIPT_DIR"/src/frontend/node_modules/.cache && echo "pwn dat cache"
  ls -l "$SCRIPT_DIR"/src/frontend/node_modules/.cache
else
  cd ./src || exit
fi

cd ./frontend || exit
echo "FE build"
"$SCRIPT_DIR"/node_modules/.bin/dotenv-run-script "$SCRIPT_DIR"/../.env -- build-without-base-path
