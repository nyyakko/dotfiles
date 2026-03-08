#!/bin/bash

BATTERY=0
BATTERY_INFO=$(acpi -b | grep "Battery ${BATTERY}")
BATTERY_STATE=$(echo "${BATTERY_INFO}" | grep -wo "Full\|Charging\|Discharging")
BATTERY_POWER=$(echo "${BATTERY_INFO}" | grep -o '[0-9]\+%' | tr -d '%')

if [[ -n "$BATTERY_INFO" ]]; then
    if [[ "${BATTERY_STATE}" = "Charging" ]]; then
        echo "${BATTERY_POWER}% (Charging)"
        echo "${BATTERY_POWER}% (Charging)"
        echo ""
    elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
        echo "${BATTERY_POWER}%"
        echo "${BATTERY_POWER}%"
        echo ""
    else
        echo "${BATTERY_POWER}%"
        echo "${BATTERY_POWER}%"
        echo ""
    fi

    URGENT_VALUE=10

    if [[ "${BATTERY_POWER}" -le "${URGENT_VALUE}" ]]; then
        exit 33
    fi
fi
