/* Copyright (c) 2015 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is property of Nordic Semiconductor ASA.
 * Terms and conditions of usage are described in detail in NORDIC
 * SEMICONDUCTOR STANDARD SOFTWARE LICENSE AGREEMENT.
 *
 * Licensees are granted free, non-transferable use of the information. NO
 * WARRANTY of ANY KIND is provided. This heading must NOT be removed from
 * the file.
 *
 */

#include "sdk_config.h"
#include "bsp.h"
#include "boards.h"
#include "nordic_common.h"
#include "nrf_drv_clock.h"
#include "nrf_drv_spi.h"
#include "nrf_uart.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "nrf_log.h"
#include "nrf.h"
#include "app_error.h"
#include "app_util_platform.h"
#include "app_error.h"
#include <string.h>
#include "port_platform.h"
#include "deca_types.h"
#include "deca_param_types.h"
#include "deca_regs.h"
#include "deca_device_api.h"
#include "uart.h"
	
//-----------------dw1000----------------------------

static dwt_config_t config = {
    5,                /* Channel number. */
    DWT_PRF_64M,      /* Pulse repetition frequency. */
    DWT_PLEN_128,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    10,               /* TX preamble code. Used in TX only. */
    10,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (129 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456	

//--------------dw1000---end---------------


#define TASK_DELAY        200           /**< Task delay. Delays a LED0 task for 200 ms */
#define TIMER_PERIOD      1000          /**< Timer period. LED1 timer will expire after 1000 ms */

extern int ss_init_run(char* dest);
extern int ss_resp_run(void);

void handle_function(char* input, char* state, char* dest) {
  printf("TOTAL INPUT : %s\r\n", input);

   if (!strcmp(input, "INIT")) {
    strcpy(state, input);
    printf("WENT INIT : %s\r\n", state);
    dest[0] = '\0';

    printf("ENTER DESTINATION : \r\n");
    while (dest[0] == '\0') {
      boUART_getc(dest);
    }
    
    printf("CHOSEN : %c\r\n", dest[0]);

  } else if (!strcmp(input, "STOP")) {
    strcpy(state, input);
    printf("WENT STOP : %s\r\n", state);
  }


}

int main(void)
{
  /* Setup some LEDs for debug Green and Blue on DWM1001-DEV */
  LEDS_CONFIGURE(BSP_LED_1_MASK);
  LEDS_ON(BSP_LED_1_MASK);

  // DW1000 INIT -------------------------------------------------	

  /* Setup DW1000 IRQ pin */  
  nrf_gpio_cfg_input(DW1000_IRQ, NRF_GPIO_PIN_NOPULL); 		//irq
  
  /*Initialization UART*/
  boUART_Init ();
  printf("INITIATOR\r\n");
  
  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();			
  
  /* Init the DW1000 */
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1) {};
  }

  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();

  /* Configure DW1000. */
  dwt_configure(&config);

  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);

  /* Set preamble timeout for expected frames. See NOTE 3 below. */
  //dwt_setpreambledetecttimeout(0); // PRE_TIMEOUT
          
  /* Set expected response's delay and timeout. 
  * As this example only handles one incoming frame with always the same delay and timeout, those values can be set here once for all. */
  dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
  dwt_setrxtimeout(65000); // Maximum value timeout with DW1000 is 65ms  

  // DW1000 END INIT  ------------------------------------

  // INPUR READING INIT
  char input_buffer[1];
  char total_input[1024];
  char state[5];
  int input_index = 0;

  char dest_buffer[1];

  memcpy(state, 0, sizeof(state));


  // Loop forever responding to ranging requests.
  while (1) 
  {
    boUART_getc(input_buffer);


    if(input_buffer[0] == '\r') {
      // user ended the transmission (sent 'Z')
      printf("END OF TRANSMISSION\r\n");

      total_input[input_index] = '\0';
      handle_function(total_input, state, dest_buffer);

      // clean buffer memory
      memset(input_buffer, 0, sizeof(input_buffer));
      input_index = 0;
    } else if (input_buffer[0] != '\0') {
      // add input to buffer
      printf("RECEIVED : %c\r\n", input_buffer[0]);
      total_input[input_index] = input_buffer[0];
      input_index += 1;
    }
    // clean the input buffer
    input_buffer[0] = '\0';

    if (!strcmp(state, "INIT")) {
      ss_init_run(dest_buffer);
    }

  }

}