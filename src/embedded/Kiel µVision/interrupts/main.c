#include <string.h>
#include <stdio.h>
#include <UART.h>
#include <signal.h>

/* Handle input after end of transmission */ 
void handle_input(char* input) {
  printf("TOTAL INPUT : %s\r\n", input);
}

/* SIGINT received, attention request from user */
void handle_isr(int signal) {
	char input_buffer[1];
  char total_input[1024];
  int input_index = 0;

	/* Start reading input */ 
  while (1) 
  {
		/* Get next character in UART input (RX) */
    boUART_getc(input_buffer);

    if(input_buffer[0] != '\r') {
      /* User sent a valid character, add to total input */
      printf("RECEIVED : %c\r\n", input_buffer[0]);
      total_input[input_index] = input_buffer[0];
      input_index += 1;
    } else {
      /* User pressed return key, end input transmission */
      printf("END OF TRANSMISSION");

      total_input[input_index] = '\0';
      handle_input(total_input);

      /* Clean buffer memory */
      memset(input_buffer, 0, sizeof(input_buffer));
      input_index = 0;
    }
    /* Clean the input buffer */
    input_buffer[0] = '\0';
  }
}


int main(void)
{ 
	/* Redirect interrupt handling to user function */
	signal(SIGINT, handle_isr);
	
  /* Initialise UART */
  boUART_Init ();
  printf("INPUT STREAM EXAMPLE\r\n");
	
  while (1) {}		
}
