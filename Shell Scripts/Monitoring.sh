#!/bin/bash

threshold=90

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
memory_usage=$(free -m | awk '/Mem:/ {print $3/$2 * 100}')

if (( $(echo "$cpu_usage > $threshold" | bc -l) )); then
    echo "CPU usage is high! Current: $cpu_usage%"
    # Add alerting logic here, e.g., send an email or notification
fi

if (( $(echo "$memory_usage > $threshold" | bc -l) )); then
    echo "Memory usage is high! Current: $memory_usage%"
    # Add alerting logic here, e.g., send an email or notification
fi
