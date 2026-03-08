#!/bin/bash
df -h / | awk 'NR==2{printf "%s/%s", $3, $2}'
