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

#define DISABLED_MODE 0
#define INITIATOR_MODE 1
#define RESPONDER_MODE 2

extern void resp_main(const void*);
extern void init_main(const void*);

extern void init_run_controller(const void*);
extern void resp_run_controller(const void*);

typedef struct args_t {
	int thread_id;
} args;

osThreadId handle_function();
void init_thread(const void*);
void resp_thread(const void*);

int AUTOMATA_STATE = DISABLED_MODE;
osThreadId current_state_thread_id = 0;
osThreadId input_thread_id = 0;

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
				AUTOMATA_STATE = INITIATOR_MODE;
				handle_function();
				printf("keep going\r\n");
				osDelay(100);
			} 	
			else if (!strcmp(total_input, "RESP")) 
			{
				AUTOMATA_STATE = RESPONDER_MODE;
				handle_function();
				printf("keep going\r\n");
				osDelay(100);
			} 
			else if (!strcmp(total_input, "STOP")) 
			{
				raise(SIGINT);
				osDelay(100);
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
		
		printf("still reading input\r\n");
		
		osDelay(300);
  }
}


// define thread_job as a thread function
osThreadDef(read_input, osPriorityAboveNormal, 1, 0);
osThreadDef(init_thread, osPriorityAboveNormal, 1, 0);
osThreadDef(resp_thread, osPriorityAboveNormal, 1, 0);

void handle_isr(int sig) {
	printf("signal raised\r\n");
	if (AUTOMATA_STATE != DISABLED_MODE)
	{
		osThreadTerminate(current_state_thread_id);
		AUTOMATA_STATE = DISABLED_MODE;
		osDelay(100);
	}
}



osThreadId handle_input(args* arg) {
	return osThreadCreate(osThread(read_input), (void*) arg);
}

void init_thread(const void* arg) {
	while (1)
  {
    init_run_controller(NULL);
		printf("going\r\n");
		
		osDelay(100);
  }
}

void resp_thread(const void* arg) {
	while (1)
  {
    resp_run_controller(NULL);
		printf("going\r\n");
		
		osDelay(100);
  }
}

osThreadId handle_function() {
	printf("Handled\r\n");
	
	osThreadId created_thread = 0;
	
	switch(AUTOMATA_STATE) 
	{
		case 0:
			break;;
		case 1:
			printf("init\r\n");
//			init_main(NULL);
//			created_thread = osThreadCreate(osThread(init_thread), NULL);
			printf("init done\r\n");
			break;;
		case 2:
			printf("resp\r\n");
//			resp_main(NULL);
//			created_thread = osThreadCreate(osThread(resp_thread), NULL);
			printf("resp done\r\n");
			break;;
	}
	
	return created_thread;
}

int main(void)
{	
	signal(SIGINT, handle_isr);
	
	osKernelInitialize();
	
	osThreadId thread_id = 0;
	
  /*Initialization UART*/
  boUART_Init ();
  printf("Swap Role Example\r\n");

	args* arg = malloc(sizeof(args));
	arg->thread_id = 1;
	
	input_thread_id = handle_input(arg);
	
	osKernelStart();
	
	while(1) 
	{
		
	}
  
}
