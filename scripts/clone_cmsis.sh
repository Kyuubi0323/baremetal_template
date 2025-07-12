#!/bin/bash

# Clone CMSIS repositories as Git submodules

echo "Setting up CMSIS submodules..."

# Function to add submodule if it doesn't exist
add_submodule_if_not_exists() {
    local url=$1
    local path=$2
    local name=$3
    
    if [ ! -d "$path" ] || [ ! "$(ls -A $path)" ]; then
        echo "Adding $name as submodule..."
        git submodule add $url $path
    else
        echo "$name already exists at $path"
    fi
}

# Add submodules
add_submodule_if_not_exists "https://github.com/ARM-software/CMSIS_5.git" "cmsis" "CMSIS_5"
add_submodule_if_not_exists "https://github.com/ARM-software/CMSIS-DSP.git" "cmsis-dsp" "CMSIS-DSP"
add_submodule_if_not_exists "https://github.com/ARM-software/CMSIS-NN.git" "cmsis-nn" "CMSIS-NN"

echo "Initializing and updating submodules..."
git submodule update --init --recursive

echo "CMSIS submodules setup completed!"
echo "Available submodules:"
echo "- cmsis/         (CMSIS Core)"
echo "- cmsis-dsp/     (CMSIS-DSP)"
echo "- cmsis-nn/      (CMSIS-NN)"

# Verify submodules
echo ""
echo "Verifying submodules:"
for dir in cmsis cmsis-dsp cmsis-nn; do
    if [ -d "$dir" ] && [ "$(ls -A $dir)" ]; then
        echo "✓ $dir - OK"
    else
        echo "✗ $dir - Missing or empty"
    fi
done