#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <signal.h>

#ifndef main_h
#define main_h

int main(void);
void handle_function(char* input);
void handle_isr(int signal);

#endif

void handle_function(char* input) {
  printf("TOTAL INPUT : %s\r\n", input);
}

void handle_isr(int signal) {
  printf("interrupt");
}

int main(void)
{
  signal(SIGINT, handle_isr);

  /*Initialization UART*/
  printf("INPUT STREAM EXAMPLE\r\n");

  char input_buffer[1];
  char total_input[1024];
  int input_index = 0;

  /* Loop forever responding to ranging requests. */
  while (1) 
  {
    if(input_buffer[0] != 'Z') {
      /* add input to buffer */
      printf("RECEIVED : %c\r\n", input_buffer[0]);
      total_input[input_index] = input_buffer[0];
      input_index += 1;
    } else {
      /* user ended the transmission (sent 'Z') */
      printf("END OF TRANSMISSION");

      total_input[input_index] = '\0';
      handle_function(total_input);

      /* clean buffer memory */
      memset(input_buffer, 0, sizeof(input_buffer));
      input_index = 0;
    }
    /* clean the input buffer */
    input_buffer[0] = '\0';
  }

}
