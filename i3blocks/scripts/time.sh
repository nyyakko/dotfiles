#!/bin/bash
date '+%I:%M:%S %p %d/%m/%Y'

if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
    /usr/bin/gsimplecal
fi
