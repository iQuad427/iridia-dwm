#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <UART.h>
#include <cmsis_os.h>

int doing_stuff(void) {
	while (1) {
		printf("do stuff\r\n");
		osDelay(100);
	}
}