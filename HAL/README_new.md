# STM32F4 HAL (Hardware Abstraction Layer)

This directory contains a basic implementation of the STM32F4 HAL (Hardware Abstraction Layer) for the STM32F411xE microcontroller.

## What's Included

### Core HAL Files
- `Inc/stm32f4xx_hal.h` - Main HAL header file
- `Inc/stm32f4xx_hal_conf.h` - HAL configuration file
- `Inc/stm32f4xx_hal_def.h` - HAL type definitions and macros
- `Inc/stm32f4xx_it.h` - Interrupt handlers header
- `Inc/Legacy/stm32_hal_legacy.h` - Legacy compatibility defines

### Source Files
- `Src/stm32f4xx_hal.c` - Core HAL implementation
- `Src/stm32f4xx_hal_msp.c` - MSP (MCU Support Package) initialization
- `Src/stm32f4xx_hal_timebase_tim.c` - Timer-based timebase (alternative to SysTick)
- `Inc/stm32f4xx_it.c` - Interrupt service routines

## Features

### Currently Implemented
- Basic HAL initialization and deinitialization
- System tick configuration using SysTick
- GPIO configuration support
- UART communication support
- Basic timer support
- Power management functions
- Clock configuration support

### HAL Modules Enabled
- HAL_CORTEX_MODULE_ENABLED
- HAL_DMA_MODULE_ENABLED  
- HAL_FLASH_MODULE_ENABLED
- HAL_GPIO_MODULE_ENABLED
- HAL_PWR_MODULE_ENABLED
- HAL_RCC_MODULE_ENABLED
- HAL_TIM_MODULE_ENABLED
- HAL_UART_MODULE_ENABLED
- HAL_USART_MODULE_ENABLED

## Usage

The main.c file has been updated to demonstrate basic HAL usage:

1. **HAL Initialization**: `HAL_Init()` - Initialize the HAL library
2. **Clock Configuration**: `SystemClock_Config()` - Configure system clocks
3. **Peripheral Initialization**: GPIO and UART setup
4. **Application Loop**: Main program with HAL_Delay() and UART communication

### Example Functions
```c
// Initialize HAL
HAL_Init();

// Configure system clock
SystemClock_Config();

// Initialize GPIO
MX_GPIO_Init();

// Initialize UART
MX_USART2_UART_Init();

// Send data via UART
HAL_UART_Transmit(&huart2, data, length, timeout);

// Delay function
HAL_Delay(1000); // 1 second delay
```

## Configuration

You can modify `stm32f4xx_hal_conf.h` to:
- Enable/disable specific HAL modules
- Configure oscillator values (HSE, HSI, LSE, LSI)
- Set system configuration parameters
- Enable debug features

## Building

The project Makefile has been updated to include HAL support:
- HAL include paths added to CFLAGS
- HAL source files added to compilation
- USE_HAL_DRIVER define added

## Note

This is a minimal HAL implementation to get you started. For a complete HAL library with all peripherals and advanced features, you can:

1. Download the official STM32CubeF4 package from STMicroelectronics
2. Use the provided `scripts/download_hal.sh` script to automatically download the complete HAL library
3. Or manually copy additional HAL modules as needed

To enable additional peripherals, uncomment the corresponding `#define HAL_XXX_MODULE_ENABLED` lines in `stm32f4xx_hal_conf.h` and ensure the appropriate header and source files are available.
