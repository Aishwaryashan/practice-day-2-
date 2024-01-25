#!/bin/bash

# Check if a filename is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Create a temporary file for storing the reversed lines
tempfile=$(mktemp)

# Reverse the characters in each line and save to the temporary file
while IFS= read -r line; do
    echo "$line" | rev >> "$tempfile"
done < "$filename"

# Replace the original file with the reversed content
mv "$tempfile" "$filename"

echo "File '$filename' successfully reversed."
