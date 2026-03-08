#!/bin/bash

INTERFACE=$(ip link show | awk '/wl/{print $2}' | tr -d ':')

if [[ -n "$INTERFACE" ]]; then
    IP=$(ip addr show "$INTERFACE" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
    if [[ -n "$IP" ]]; then
        echo "$IP OK"
    else
        echo "DOWN"
    fi
fi

