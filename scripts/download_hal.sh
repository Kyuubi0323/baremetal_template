#!/bin/bash

# Script to download STM32F4 HAL drivers
# This script downloads the STM32CubeF4 firmware package

echo "Downloading STM32F4 HAL drivers..."

# Create temporary directory
TEMP_DIR="/tmp/stm32f4_hal"
mkdir -p "$TEMP_DIR"

# Download STM32CubeF4 from GitHub (official ST repository)
cd "$TEMP_DIR"
git clone --depth 1 https://github.com/STMicroelectronics/STM32CubeF4.git

# Check if download was successful
if [ ! -d "STM32CubeF4" ]; then
    echo "Error: Failed to download STM32CubeF4"
    exit 1
fi

# Copy HAL drivers to our project
PROJECT_HAL_DIR="/home/kyuubi/work/bare-metal/stm32f4-template/HAL"
SOURCE_HAL_DIR="$TEMP_DIR/STM32CubeF4/Drivers/STM32F4xx_HAL_Driver"

# Copy HAL header files
cp -r "$SOURCE_HAL_DIR/Inc/"* "$PROJECT_HAL_DIR/Inc/"

# Copy HAL source files
cp -r "$SOURCE_HAL_DIR/Src/"* "$PROJECT_HAL_DIR/Src/"

# Copy CMSIS device files if not already present
CMSIS_DIR="/home/kyuubi/work/bare-metal/stm32f4-template/include"
SOURCE_CMSIS_DIR="$TEMP_DIR/STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include"

# Copy device-specific headers
cp "$SOURCE_CMSIS_DIR/stm32f4xx.h" "$CMSIS_DIR/" 2>/dev/null || true
cp "$SOURCE_CMSIS_DIR/stm32f411xe.h" "$CMSIS_DIR/" 2>/dev/null || true

echo "HAL drivers downloaded and installed successfully!"
echo "HAL headers copied to: $PROJECT_HAL_DIR/Inc/"
echo "HAL sources copied to: $PROJECT_HAL_DIR/Src/"

# Clean up
rm -rf "$TEMP_DIR"

echo "Done!"
