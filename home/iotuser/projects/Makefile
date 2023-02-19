ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

build-mqtt:
	@echo 'Build MQTT'
	bash ${ROOT_DIR}/cedalo_platform/build.sh

install-mqtt:
	@echo 'Install MQTT'
	bash ${ROOT_DIR}/cedalo_platform/build.sh force

start-network:
	@echo 'Start network'
	docker network rm iot_net || true
	docker network create iot_net || true

start-mqtt:
	@echo 'Start mqtt'
	bash ${ROOT_DIR}/cedalo_platform/start.sh

stop-mqtt:
	@echo 'Stop mqtt'
	bash ${ROOT_DIR}/cedalo_platform/stop.sh

stop-network:
	@echo 'Stop network'
	docker network rm iot_net || true

start:
	@echo 'Start all'
	make start-network
	make start-mqtt

stop:
	@echo 'Stop all'
	make stop-mqtt
	make start-network
