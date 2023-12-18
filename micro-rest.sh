#!/bin/bash

# Generate a random number between 0 and 120 (2 minutes)
random_time=$((RANDOM % 121))

# Sleep for the random time
echo "Waiting for $random_time seconds..."
sleep $random_time

# Play a sound (adjust the path to your sound file)
sound_file="complete.oga"
play "$sound_file"

