echo "Run ${1}-mqtt in ${0}"

if [ "$1" == "start" ]
then
  # Add CERTS
  echo "Run ${1} network"
  sudo make -C /home/iotuser/projects/ -w "$1"-network
  echo "Run ${1} mqtt"
  sudo make -C /home/iotuser/projects/ -w "$1"-mqtt
else
  echo "Run ${1} mqtt"
  sudo make -C /home/iotuser/projects/ -w "$1"-mqtt
  echo "Run ${1} network"
  sudo make -C /home/iotuser/projects/ -w "$1"-network
fi

