#!/bin/bash

# Check if the data location argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide the data location as an argument."
    exit 1
fi

# Get the data location from the argument
data_location="$1"

# Create the destination directory under the data location if it doesn't exist
mkdir -p "$data_location/wav_path_16k"

# Find all WAV files in the data_location/Session?/sentences/wav
# and copy them to the destination directory. ? is a wildcard

for session in "$data_location"/Session*/sentences/wav; do
    find "$session" -type f -name "*.wav" -exec cp {} "$data_location/wav_path_16k" \;
done

echo "WAV files extracted from '$data_location' and copied to '$data_location/wav_path_16k' directory."