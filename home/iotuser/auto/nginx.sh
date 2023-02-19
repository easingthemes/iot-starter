SED=$(which sed)
CURRENT_DIR=$(dirname "$0")

while getopts u:s:r:i:p: flag
do
    case "${flag}" in
        u) A_USER=${OPTARG};;
        s) A_SUB_DOMAIN=${OPTARG};;
        r) A_ROOT_DOMAIN=${OPTARG};;
        i) A_IP=${OPTARG};;
        p) A_PORT=${OPTARG};;
        c) A_CERT=${OPTARG};;
    esac
done

USER=${A_USER:=iotuser}
SUB_DOMAIN=${A_SUB_DOMAIN}
ROOT_DOMAIN=${A_ROOT_DOMAIN}
IP=${A_IP}
PORT=${A_PORT}

echo "$USER" - "$A_USER"
echo $SUB_DOMAIN
echo $ROOT_DOMAIN
echo $IP
echo $PORT

DOMAIN="${SUB_DOMAIN}.${ROOT_DOMAIN}"
PUBLIC_FOLDER="/home/${USER}/www/${SUB_DOMAIN}"
PUBLIC_FOLDER_REG="\/home\/${USER}\/www\/${SUB_DOMAIN}"
CONFIG="/etc/nginx/conf.d/${SUB_DOMAIN}.conf"
# CONFIG=$CURRENT_DIR/$DOMAIN

sudo mkdir -p $PUBLIC_FOLDER
sudo cp "${CURRENT_DIR}/template.stub" "$CONFIG"
sudo "$SED" -i "s/{{IP}}/$IP/g" "$CONFIG"
sudo "$SED" -i "s/{{PORT}}/$PORT/g" "$CONFIG"
sudo "$SED" -i "s/{{DOMAIN}}/$DOMAIN/g" "$CONFIG"
sudo "$SED" -i "s/{{SUB_DOMAIN}}/$SUB_DOMAIN/g" "$CONFIG"
sudo "$SED" -i "s/{{PUBLIC_FOLDER}}/${PUBLIC_FOLDER_REG}/g" "$CONFIG"

if [ -z "$A_CERT" ]
then
# Add CERTS
sudo certbot --nginx -d $DOMAIN
sudo systemctl reload nginx
fi

