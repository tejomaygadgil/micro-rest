#!/bin/bash

# Set loop time in seconds (research suggests ~120)
loop_time=120
# Set +/- delta
delta=30
# Wait period (research: ~10)
wait_period=10
while true; do
  # Generate a random number +/- delta
  random_time=$(((RANDOM % (2*$delta))-$delta))

  # Sleep for loop_time plus random_time
  sleep $(($loop_time + $random_time))

  # See if media is playing
  if pactl list | grep -q RUNNING; then
      media_status=1
  else
      media_status=0
  fi

  # Pause if playing
  if [ "$media_status" -eq 1 ]; then
    xdotool key XF86AudioPlay
  fi

  # Play a sound (adjust the path to your sound file)
  sound_file="complete.oga"
  play "$sound_file" &> /dev/null
  
  # Wait for wait_period
  sleep $wait_period

  # Resume
  if [ "$media_status" -eq 1 ]; then
    xdotool key XF86AudioPlay
  fi

  # Print how long the break was (for fun)
  echo "$(($loop_time + random_time)) seconds"
done
