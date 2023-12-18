#!/bin/bash

# Set loop time in seconds (research suggests ~120)
loop_time=120
while true; do
  # Generate a random number between 0 and loop_time
  random_time=$((RANDOM % $loop_time+1))

  # Sleep for the random time
  echo "Waiting for $random_time seconds..."
  sleep $random_time

  # Play a sound (adjust the path to your sound file)
  sound_file="complete.oga"
  play "$sound_file"

  # Sleep for remaining time
  echo "Sleeping for $(($loop_time - $random_time)) seconds..."
  sleep $(($loop_time - $random_time))
done
