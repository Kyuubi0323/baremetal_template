/**
  ******************************************************************************
  * @file    stm32_hal_legacy.h
  * @brief   This file contains aliases definition for the STM32Cube HAL constants.
  ******************************************************************************
  */

#ifndef STM32_HAL_LEGACY
#define STM32_HAL_LEGACY

#ifdef __cplusplus
 extern "C" {
#endif

/* Exported constants --------------------------------------------------------*/

/** @defgroup HAL_CORTEX_Aliased_Defines HAL CORTEX Aliased Defines maintained for legacy purpose
  * @{
  */
#define __HAL_CORTEX_SYSTICKCLK_CONFIG(__CLKSRC__) \
                            do { \
                              if((__CLKSRC__) == SYSTICK_CLKSOURCE_HCLK) \
                                { \
                                  SysTick->CTRL |= SYSTICK_CLKSOURCE_HCLK; \
                                } \
                              else \
                                { \
                                  SysTick->CTRL &= ~SYSTICK_CLKSOURCE_HCLK; \
                                } \
                            } while(0U)

/**
  * @}
  */

/** @defgroup HAL_GPIO_Aliased_Defines HAL GPIO Aliased Defines maintained for legacy purpose
  * @{
  */
#define GPIO_AF15_EVENTOUT      GPIO_AF15_EVENTOUT

/**
  * @}
  */

/** @defgroup HAL_RCC_Aliased_Defines HAL RCC Aliased Defines maintained for legacy purpose
  * @{
  */

#define RCC_OSCILLATORTYPE_HSE          RCC_OSCILLATORTYPE_HSE
#define RCC_OSCILLATORTYPE_HSI          RCC_OSCILLATORTYPE_HSI
#define RCC_OSCILLATORTYPE_LSE          RCC_OSCILLATORTYPE_LSE
#define RCC_OSCILLATORTYPE_LSI          RCC_OSCILLATORTYPE_LSI

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif /* STM32_HAL_LEGACY */
