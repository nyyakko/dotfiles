#!/bin/bash

INTERFACE=$(ip link show | awk '/^[0-9]+: en|^[0-9]+: eth/{print $2}' | tr -d ':' | head -1)

if [[ -n "$INTERFACE" ]]; then
    IP=$(ip addr show "$INTERFACE" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
    if [[ -n "$IP" ]]; then
        echo "$IP OK"
    else
        echo "DOWN"
    fi
fi
