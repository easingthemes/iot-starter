#!/usr/bin/env bash

echo "MC Install"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"
cd "$SCRIPT_DIR" || exit
echo "Download MC"
rm -rf ./src ./tmp ./"$CEDALO_MC_VERSION".zip
CEDALO_ZIP_FILE=https://github.com/cedalo/management-center/archive/refs/tags/"$CEDALO_MC_VERSION".zip
wget "$CEDALO_ZIP_FILE"
unzip "$CEDALO_MC_VERSION".zip -d ./tmp
mkdir -p src
mv ./tmp/*/* ./tmp/*/.* ./src
rm -rf ./tmp ./"$CEDALO_MC_VERSION".zip
