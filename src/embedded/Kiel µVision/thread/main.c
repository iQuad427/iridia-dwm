#include <string.h>
#include <stdio.h>
#include <UART.h>
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
	
*/

void thread_job(void const *argument) {
	while (1) {
		printf("Thread\r\n");
		osDelay(100);
	}
}

osThreadDef(thread_job, osPriorityAboveNormal, 1, 0); // define thread_job as a thread function

int main(void)
{	
	osKernelInitialize();
	
  /*Initialization UART*/
  boUART_Init ();
  printf("Thread Example\r\n");

	osThreadCreate(osThread(thread_job), NULL); // create thread that executes 'thread_job'
	
	osKernelStart();
	
	/* not sure if something is supposed to reach this code */
  while (1)
  {
    printf("Main Thread\r\n"); 
  }
}



