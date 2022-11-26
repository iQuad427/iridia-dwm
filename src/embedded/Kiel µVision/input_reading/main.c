#include <string.h>
#include <stdio.h>
#include <UART.h>
#include <boards.h>
#include <deca_device_api.h>

void handle_function(char* input) {
  printf("TOTAL INPUT : %s\r\n", input);
}

int main(void)
{ 
	LEDS_CONFIGURE(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK);
  LEDS_ON(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK );
	
  /*Initialization UART*/
  boUART_Init ();
  printf("INPUT STREAM EXAMPLE\r\n");
	
  char input_buffer[1];
  char total_input[1024];
  int input_index = 0;

  while (1) 
  {
    boUART_getc(input_buffer);

    if(input_buffer[0] == '\r') {
			// user ended the transmission (sent 'Z')
      printf("END OF TRANSMISSION\r\n");

      total_input[input_index] = '\0';
      handle_function(total_input);

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
		
		deca_sleep(10);
  }
}