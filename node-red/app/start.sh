#!/bin/bash

# Make the default flows available in the user library
mkdir -p /data/node-red/user/lib/flows || true
cp /usr/src/app/flows/* /data/node-red/user/lib/flows/

mkdir -p /data/node-red/user/vis || true
cp /usr/src/app/vis/* /data/node-red/user/vis

chmod 770 /data/node-red/user/vis
chmod 770 /data/node-red/user/vis/CAC
chmod 770 /data/node-red/user/vis/main
chmod 770 /data/node-red/user/vis/filter1
chmod 770 /data/node-red/user/vis/CAC/vis-user.css
chmod 770 /data/node-red/user/vis/CAC/vis-views.json
chmod 770 /data/node-red/user/vis/main/vis-user.css
chmod 770 /data/node-red/user/vis/mian/vis-views.json

mkdir -p /data/node-red/user/JsonDB || true
cp /usr/src/app/JsonDB/* /data/node-red/user/JsonDB


# Start app
DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket node-red --settings /usr/src/app/settings.js
