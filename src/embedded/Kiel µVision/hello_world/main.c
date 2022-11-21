#include <string.h>
#include <stdio.h>
#include <UART.h>
#include <deca_device_api.h>
#include "boards.h"


int main(void)
{	
	LEDS_CONFIGURE(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK);
  LEDS_ON(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK );
	
  /*Initialization UART*/
  boUART_Init ();
  printf("Hello World!\r\n");

	int count = 0;
	
  while (1)
  {
		count++;
    printf("Hello World %d\r\n", count);
		deca_sleep(1000);
  }
}



