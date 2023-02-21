# Install software
echo "Node: $(which node)"
node -v
npm -v
echo "Install global Yarn"
npm install yarn -g
# Create .env file
SED=$(which sed)
CURRENT_DIR=$(dirname "$0")

ENV_DIR=$CURRENT_DIR/../projects/cedalo_platform
ENV_FILE="${ENV_DIR}/.env"
echo "Set env vars from template"
sudo cp "${ENV_DIR}/env.example" "$ENV_FILE"
sudo "$SED" -i "s/mqttadminuser/$BU_USER/g" "$ENV_FILE"
sudo "$SED" -i "s/mqttadminpass/$BU_PASS/g" "$ENV_FILE"
sudo "$SED" -i "s/mcuser/$MU_USER/g" "$ENV_FILE"
sudo "$SED" -i "s/mcpass/$MU_PASS/g" "$ENV_FILE"

