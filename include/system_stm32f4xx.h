/**
  ******************************************************************************
  * @file    system_stm32f4xx.h
  * @author  MCD Application Team
  * @brief   CMSIS Cortex-M4 Device System Source File for STM32F4xx devices.
  ******************************************************************************
  */

#ifndef __SYSTEM_STM32F4XX_H
#define __SYSTEM_STM32F4XX_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

/** @addtogroup STM32F4xx_System_Exported_Variables
  * @{
  */
extern uint32_t SystemCoreClock;          /*!< System Clock Frequency (Core Clock) */

/**
  * @}
  */

/** @addtogroup STM32F4xx_System_Exported_Functions
  * @{
  */
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif /*__SYSTEM_STM32F4XX_H */