# TODO: Integrating New STM32F4 

This document provides step-by-step instructions for integrating a new STM32F4 series microcontroller into the existing bare-metal template project.

## Prerequisites
- [ ] Identify the new STM32F4 series part number (e.g., STM32F407VG, STM32F429ZI, etc.)
- [ ] Download STM32CubeF4 package for device-specific headers
- [ ] Have the development board/hardware available for testing

## Step 1: Research New MCU Specifications
## Step 2: Update Device Configuration Files

### 2.1 Update Makefile
- [ ] Change the device define in `CFLAGS`:
  ```makefile
  # Current: -DSTM32F411xE
  # Change to: -DSTM32F4XXxX (replace with your device)
  ```
- [ ] Update include paths if device-specific headers are needed
- [ ] Verify ARM_MATH_CM4 flag is appropriate for the new device

### 2.2 Update Linker Script (`stm32f4xx.ld`)
- [ ] Update memory sections based on new MCU specs:
  ```ld
  MEMORY
  {
    FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = XXXK  # Update length
    RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = XXXK  # Update length
  }
  ```
- [ ] Update stack pointer `_estack` to end of RAM address
- [ ] Add additional memory sections if the new MCU has multiple RAM banks:
  ```ld
  CCM (xrw)       : ORIGIN = 0x10000000, LENGTH = XXK    # If applicable
  ```

### 2.3 Update Device Headers
- [ ] Add new device-specific header to `include/` directory (e.g., `stm32f407xx.h`)
- [ ] Update `include/stm32f4xx.h` to include the new device:
  ```c
  #if defined(STM32F411xE)
    #include "stm32f411xe.h"
  #elif defined(STM32F4XXxX)  // Add your device
    #include "stm32f4XXxx.h"
  #endif
  ```

## Step 3: Update System Configuration

### 3.1 System Clock Configuration (`src/system_stm32f4xx.c`)
- [ ] Review and update `SystemInit()` function for new MCU
### 3.2 Startup File (`src/startup/startup_stm32f4xx.s`)
- [ ] Replace with device-specific startup file from STM32CubeF4
### 3.3 Main Application Updates (`src/main.c`)
- [ ] Update device-specific include:
  ```c
  #include "stm32f4XXxx.h"  // Replace with your device header
  ```
- [ ] Review GPIO configurations - pin assignments may differ

## Step 4: Build and Test

### 4.1 Initial Build
- [ ] Run `make clean` to remove old build artifacts
- [ ] Run `make` to build with new configuration
- [ ] Fix any compilation errors
- [ ] Generate binary with `make bin`

### 4.2 Basic Testing
- [ ] Flash the binary to new hardware
- [ ] Verify basic functionality (LED blink, UART output)
- [ ] Test critical peripherals
- [ ] Validate performance characteristics

### 4.3 Advanced Testing
- [ ] Run extended hardware tests
- [ ] Verify timing accuracy
- [ ] Test under different clock configurations
- [ ] Validate power consumption (if applicable)

## Step 5: Version Control and Backup

### 5.1 Git Management
- [ ] Create a new branch for the new MCU integration
- [ ] Commit changes incrementally with descriptive messages
- [ ] Tag stable versions
- [ ] Consider creating separate directories for different MCU variants

### 5.2 Configuration Management
- [ ] Consider creating MCU-specific configuration files
- [ ] Document build variants in Makefile
- [ ] Create automated build scripts for multiple targets