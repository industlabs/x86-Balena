#!/bin/bash

# Make the default flows available in the user library
mkdir -p /data/node-red/user/lib/flows || true
cp /usr/src/app/flows/* /data/node-red/user/lib/flows/

#mkdir -p /data/node-red/user/vis || true
cp -r /usr/src/app/vis/ /data/node-red/user/

#mkdir -p /data/node-red/user/JsonDB || true
cp -r /usr/src/app/JsonDB/ /data/node-red/user/


# Start app
DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket node-red --settings /usr/src/app/settings.js
