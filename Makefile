CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -Iinclude -Icmsis/CMSIS/Core/Include -Icmsis-dsp/Include -DSTM32F411xE -DARM_MATH_CM4
LDFLAGS = -Tstm32f4xx.ld --specs=nosys.specs
SRC = src/main.c src/system_stm32f4xx.c src/startup/startup_stm32f4xx.s
BUILD_DIR = build
OBJ = $(addprefix $(BUILD_DIR)/,$(SRC:.c=.o))
OBJ := $(OBJ:.s=.o)

TARGET = $(BUILD_DIR)/stm32f4-template

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s | $(BUILD_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

%.bin: %
	arm-none-eabi-objcopy -O binary $< $@

bin: $(TARGET).bin

cmsis:
	./scripts/clone_cmsis.sh

# Add individual submodules if needed
cmsis-core:
	@if [ ! -d "cmsis" ] || [ ! "$$(ls -A cmsis)" ]; then \
		echo "Adding CMSIS Core..."; \
		git submodule add https://github.com/ARM-software/CMSIS_5.git cmsis; \
		git submodule update --init --recursive; \
	else \
		echo "CMSIS Core already exists"; \
	fi

cmsis-dsp:
	@if [ ! -d "cmsis-dsp" ] || [ ! "$$(ls -A cmsis-dsp)" ]; then \
		echo "Adding CMSIS-DSP..."; \
		git submodule add https://github.com/ARM-software/CMSIS-DSP.git cmsis-dsp; \
		git submodule update --init --recursive; \
	else \
		echo "CMSIS-DSP already exists"; \
	fi

cmsis-nn:
	@if [ ! -d "cmsis-nn" ] || [ ! "$$(ls -A cmsis-nn)" ]; then \
		echo "Adding CMSIS-NN..."; \
		git submodule add https://github.com/ARM-software/CMSIS-NN.git cmsis-nn; \
		git submodule update --init --recursive; \
	else \
		echo "CMSIS-NN already exists"; \
	fi

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean bin cmsis cmsis-core cmsis-dsp cmsis-nn