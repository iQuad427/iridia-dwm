#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <UART.h>
#include <cmsis_os.h>
#include <signal.h>

/*
This example managed to build on this configuration :
- Compiler : ARM Compiler v5.06 update 7 (build 960)
- nRF_DeviceFamilyPack : 8.15.4
- CMSIS : 4.5.0	
	- Driver : 2.7.2
- Packages :
	- Device > Startup
	- Device > StartupConfig
	- CMSIS > CORE
	- CMSIS > DSP
	- CMSIS > RTOS (API) > Keil RTX

Troubleshooting :
	- .\_build\nrf52832_xxaa.axf: Error: L6218E: Undefined symbol exit (referred from rtx_conf_cm.o).
		- Delete "/thread/Keil µVision/RTE/CMSIS" folder to let the compiler generate it himself
	
	- Allocation of memory on stack seem to create thread execution problems :
		- don't allocate buffers on stack -> use malloc to allocate on heap
		- at least avoid memset() on big stack buffers, break threads (and main thread, so app stops)
*/


//extern int resp_main(void);
//extern int init_main(void);

typedef struct args_t {
	int thread_id;
} args;


extern int doing_stuff(void);

int AUTOMATA_STATE = 0;

void read_input(void const *argument) {
	char input[1];
	input[0] = '\0';
	char* total_input = malloc(sizeof(char) * 1024);
  int input_index = 0;
	
	while (1)
  {
		boUART_getc((uint8_t*) input);
		
		if(input[0] == '\r') {
			// User ended the transmission (pressed 'enter')
			printf("END OF TRANSMISSION : %s\r\n", total_input);
			
			
			if (!strcmp(total_input, "INIT")) 
			{
				AUTOMATA_STATE = 1;
				osDelay(100);
				raise(SIGINT);
			} 	
			else if (!strcmp(total_input, "RESP")) 
			{
				AUTOMATA_STATE = 2;
				osDelay(100);
				raise(SIGINT);
			} 
			else if (!strcmp(total_input, "STOP")) 
			{
				AUTOMATA_STATE = 0;
				osDelay(100);
				raise(SIGINT);
			}
			
			memset(total_input, 0, sizeof(char) * 1024);
      input_index = 0;
    } else if (input[0] != '\0') {
      // add input to buffer
      printf("RECEIVED : %c\r\n", input[0]);
			total_input[input_index] = input[0];
      input_index += 1;
    }
    // clean the input buffer
    input[0] = '\0';
		
		osDelay(300);
  }
}


osThreadDef(read_input, osPriorityAboveNormal, 2, 0); // define thread_job as a thread function

void handle_isr(int sig) {
	printf("signal raised\r\n");
	if (AUTOMATA_STATE != 0)
	{
		osDelay(100);
		AUTOMATA_STATE = 0;
	}
}

osThreadId handle_function(args* arg1) {
	printf("Handled\r\n");
	return osThreadCreate(osThread(read_input), (void*) arg1);
}

int main(void)
{	
	signal(SIGINT, handle_isr);
	
	osKernelInitialize();
	
	osThreadId thread_id = 0;
	
  /*Initialization UART*/
  boUART_Init ();
  printf("Thread Example\r\n");

	args* arg1 = malloc(sizeof(args));
	arg1->thread_id = 1;
	
	handle_function(arg1);
	
	// osThreadCreate(osThread(thread_job), (void*) arg1); // create thread that executes 'thread_job'
	// osThreadCreate(osThread(thread_job), (void*) arg2);
	
	osKernelStart();
	
	while(1) 
	{
		
		switch(AUTOMATA_STATE) 
		{
			case 0:
				break;;
			case 1:
				printf("init\r\n");
				raise(SIGINT);
				break;;
			case 2:
				printf("resp\r\n");
				raise(SIGINT);
				break;;
			default:
				break;;
			
		}
		
	}
  
}
