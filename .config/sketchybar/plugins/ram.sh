#!/bin/bash

# Get the total and used RAM in MB
total=$(free -m | awk 'NR==2 {print $2}')
used=$(free -m | awk 'NR==2 {print $3}')

# Calculate percentage used
ram_percent=$((used * 100 / total))

# Output formatted percentage (e.g., "75%" for 75% RAM usage)
echo "$ram_percent%"
