#!/bin/bash

# Set loop time in seconds (research suggests ~120)
loop_time=120
# Wait period (research: ~10)
wait_period=10
while true; do
  # Generate a random number between 0 and loop_time-10
  random_time=$((RANDOM % $loop_time+1-10-1))

  # Sleep for the random time
  # echo "Waiting for $random_time seconds..."
  sleep $random_time

  # See if media is playing
  media_status=$(playerctl status 2> /dev/null)

  # Pause if playing
  if [ "$media_status" == "Playing" ]; then
    playerctl pause
  fi

  # Play a sound (adjust the path to your sound file)
  sound_file="complete.oga"
  play "$sound_file" &> /dev/null
  
  # Wait 10 seconds
  sleep $wait_period

  # Resume
  if [ "$media_status" == "Playing" ]; then
    playerctl play
  fi
 
  # Sleep for remaining time
  # echo "Sleeping for $(($loop_time - $random_time)) seconds..."
  sleep $(($loop_time - $random_time))
done
