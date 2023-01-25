#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <UART.h>
#include <boards.h>
#include <deca_device_api.h>
#include <cmsis_os.h>

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


void thread_job(void const *argument) {
	args* args_r = (args*) argument;
	
	printf("Thread : %d\r\n", args_r->thread_id);
	osDelay(1000);
	
	if (args_r->thread_id == 1) {
		printf("Entered thread as : INITIATOR\r\n");
	} else if (args_r->thread_id == 2) {
		printf("Entered thread as : RESPONDER\r\n");
	}
	
	//while (1) {
	//	printf("Thread : %d\r\n", args_r->thread_id);
	//	osDelay(10000);
	//}
}

osThreadDef(thread_job, osPriorityAboveNormal, 2, 0); // define thread_job as a thread function

osThreadId handle_function(args* arg1) {
	printf("Handled\r\n");
	return osThreadCreate(osThread(thread_job), (void*) arg1);
}

int main(void)
{	
	char input[1];
	input[0] = '\0';
	char* total_input = malloc(sizeof(char) * 1024);
  int input_index = 0;
	
	osKernelInitialize();
	
	osThreadId thread_id = 0;
	
  /*Initialization UART*/
  boUART_Init ();
  printf("Thread Example\r\n");

	args* arg1 = malloc(sizeof(args));
	arg1->thread_id = 1;
	
	args* arg2 = malloc(sizeof(args));
	arg2->thread_id = 2;
	
	// osThreadCreate(osThread(thread_job), (void*) arg1); // create thread that executes 'thread_job'
	// osThreadCreate(osThread(thread_job), (void*) arg2);
	
	osKernelStart();
	
	/* not sure if something is supposed to reach this code */
  while (1)
  {
		boUART_getc((uint8_t*) input);
		
		if(input[0] == '\r') {
			// User ended the transmission (pressed 'enter')
			printf("END OF TRANSMISSION : %s\r\n", total_input);
			
			
			if (!strcmp(total_input, "INIT")) {
				if (thread_id != 0) osThreadTerminate(thread_id);
				thread_id = handle_function(arg1);
			} else if (!strcmp(total_input, "RESP")) {
				if (thread_id != 0) osThreadTerminate(thread_id);
				thread_id = handle_function(arg2);
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