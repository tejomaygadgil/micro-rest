#!/bin/bash

# Set loop time in seconds (research suggests ~120)
loop_time=120
# Set +/- delta
delta=30
# Wait period (research: ~10)
wait_period=10
while true; do
  # Generate a random number between 0 and delta
  random_time=$((RANDOM % $delta+1))

  # Sleep for loop_time plus random_time
  sleep $(($loop_time + $random_time))

  # See if media is playing
  media_status=$(playerctl status 2> /dev/null)

  # Pause if playing
  if [ "$media_status" == "Playing" ]; then
    playerctl pause
  fi

  # Play a sound (adjust the path to your sound file)
  sound_file="complete.oga"
  play "$sound_file" &> /dev/null
  
  # Wait for wait_period
  sleep $wait_period

  # Resume
  if [ "$media_status" == "Playing" ]; then
    playerctl play
  fi

  # Print how long the break was (for fun)
  echo "$(($loop_time + random_time)) seconds"
done
