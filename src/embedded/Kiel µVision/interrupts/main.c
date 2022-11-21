#include <string.h>
#include <stdio.h>
#include <UART.h>
#include <signal.h>
#include <boards.h>
#include <deca_device_api.h>

/* Handle input after end of transmission */ 
void handle_input(char* input) {
  printf("TOTAL INPUT : %s\r\n", input);
}

/* SIGINT received, attention request from user */
void handle_isr(int signal) {
	char input_buffer[1];
	input_buffer[0] = '\0';
  char total_input[1024];
  int input_index = 0;

	printf("Managing Interrupt\r\n");
	
	/* Start reading input */ 
  while (1) 
  {
    boUART_getc(input_buffer);

    if(input_buffer[0] == '\r') {
			// user ended the transmission (sent 'Z')
      printf("END OF TRANSMISSION\r\n");

      total_input[input_index] = '\0';
      handle_input(total_input);

      // clean buffer memory
      memset(input_buffer, 0, sizeof(input_buffer));
      input_index = 0;
			
			break;
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


int main(void)
{ 
	/* Redirect interrupt handling to user function */
	signal(SIGINT, handle_isr);
	
  /* Initialise UART */
  boUART_Init ();
  printf("INTERRUPTS EXAMPLE\r\n");
	
  while (1) {
		printf("Raise Interrupts\r\n");
		raise(SIGINT);
		deca_sleep(1000);
	}
}
