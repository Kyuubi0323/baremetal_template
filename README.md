# STM32F4 Bare-Metal Template

A clean, minimal template for STM32F4 bare-metal development.

## Project Structure

```
stm32f4-template/
├── build/              # Build artifacts (auto-generated)
├── cmsis/              # CMSIS Core library (git submodule)
├── cmsis-dsp/          # CMSIS-DSP library (git submodule)
├── cmsis-nn/           # CMSIS-NN library (git submodule)
├── drivers/            # Custom drivers and BSP
├── HAL/                # STM32 HAL library (optional)
├── include/            # Header files
├── middleware/         # Middleware components
├── scripts/            # Build and utility scripts
├── src/                # Source files
│   ├── main.c
│   ├── system_stm32f4xx.c
│   └── startup/
│       └── startup_stm32f4xx.s
├── Makefile            # Build configuration
├── stm32f4xx.ld        # Linker script
└── README.md
```

## Getting Started

### Prerequisites
- `arm-none-eabi-gcc` toolchain
- `make`
- `git`

### Build Instructions

1. **Clone CMSIS libraries (first time only):**
   ```bash
   ./scripts/clone_cmsis.sh
   ```

   This will add:
   - CMSIS Core (ARM Cortex-M processor support)
   - CMSIS-DSP (Digital Signal Processing functions)
   - CMSIS-NN (Neural Network functions)

2. **Build the project:**
   ```bash
   make
   ```

3. **Generate binary file:**
   ```bash
   make bin
   ```

4. **Clean build artifacts:**
   ```bash
   make clean
   ```

### Output Files
- `build/stm32f4-template` - ELF executable
- `build/stm32f4-template.bin` - Binary file for flashing

## Configuration

### Target MCU
Currently configured for **STM32F411xE**. To change:
1. Update `CFLAGS` in `Makefile`
2. Update device headers in `include/`
3. Adjust memory layout in `stm32f4xx.ld`

### Memory Layout (STM32F411xE)
- Flash: 512KB @ 0x08000000
- RAM: 128KB @ 0x20000000

## Adding Components

### HAL Library
1. Download STM32CubeF4
2. Copy HAL files to `HAL/` directory
3. Update `Makefile` include paths

### Custom Drivers
- Add driver files to `drivers/`
- Include headers and update `Makefile`

### Middleware
- Add middleware components to `middleware/`
- Update build configuration as needed

## Setup Instructions

1. **Clone the Repository**: Clone this template project to your local machine.
   
   ```bash
   git clone <repository-url>
   cd stm32f4-template
   ```

2. **Initialize CMSIS Submodule**: Run the provided script to clone the CMSIS folder as a Git submodule.

   ```bash
   ./scripts/clone_cmsis.sh
   ```

3. **Build the Project**: Use the Makefile to build the project.

   ```bash
   make
   ```

## Usage

- Modify `src/main.c` to implement your application logic.
- Update `include/stm32f4xx.h` as needed for peripheral configurations.
- Use the `Makefile` to compile and link your application.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.