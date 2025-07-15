#!/bin/bash

# Check if /Volumes/docs is mounted
if [[ -d "/Volumes/docs" ]]; then
    echo "✓ /Volumes/docs is mounted - Obsidian configuration will be applied"
    
    # Create the obsidian directory if it doesn't exist
    if [[ ! -d "/Volumes/docs/obsidian" ]]; then
        echo "Creating /Volumes/docs/obsidian directory..."
        mkdir -p "/Volumes/docs/obsidian"
    fi
    
    # Create the .obsidian directory if it doesn't exist
    if [[ ! -d "/Volumes/docs/obsidian/.obsidian" ]]; then
        echo "Creating /Volumes/docs/obsidian/.obsidian directory..."
        mkdir -p "/Volumes/docs/obsidian/.obsidian"
    fi
else
    echo "⚠️  /Volumes/docs is not mounted - Obsidian configuration will be skipped"
    echo "   To include Obsidian config, mount the external/network volume at /Volumes/docs"
fi
