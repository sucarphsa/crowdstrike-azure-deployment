#!/bin/bash
set -e

FALCON_CID="${FALCON_CID:?Please set FALCON_CID environment variable}"

OS_VERSION=$(rpm -E %{rhel})

if [[ "$OS_VERSION" == "8" ]]; then
    SENSOR_URL="https://download.crowdstrike.com/sensor/latest/RHEL8/falcon-sensor.rpm"
elif [[ "$OS_VERSION" == "9" ]]; then
    SENSOR_URL="https://download.crowdstrike.com/sensor/latest/RHEL9/falcon-sensor.rpm"
else
    echo "Unsupported RHEL version: $OS_VERSION"
    exit 1
fi

curl -o /tmp/falcon-sensor.rpm $SENSOR_URL
sudo rpm -i /tmp/falcon-sensor.rpm

sudo /opt/CrowdStrike/falconctl -s -f --cid=$FALCON_CID
sudo systemctl enable falcon-sensor
sudo systemctl start falcon-sensor

echo "CrowdStrike Falcon installed on RHEL $OS_VERSION"
