#!/bin/bash

# Create named pipes for input and output
mkfifo /tmp/mc-input
mkfifo /tmp/mc-output

# Start the Minecraft server and redirect input/output
sh start.sh 

# PID of the Minecraft process
MC_PID=$!

# Bridge the Docker container's stdin to the Minecraft input pipe
# and the Minecraft output pipe to the Docker container's stdout
(
  while true; do
    if read -r cmd; then
      echo "$cmd" > /tmp/mc-input
    fi
  done
) &

cat /tmp/mc-output &

# Wait for the Minecraft process to exit
wait $MC_PID
