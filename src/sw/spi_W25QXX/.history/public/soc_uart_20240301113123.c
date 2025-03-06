/*
 * my_uart.c
 *
 * created: 2024/1/31
 *  author: 
 */

#include "soc_uart.h"
#include "soc_ls1c102.h"

extern HW_INTC_t *intc;

void uart1_irq() {
	char uart_fifo0_ctrl;
	int uart0;
	int flag = 0;

	uart_fifo0_ctrl = UART_FIFO_CTRL;
	while ((uart_fifo0_ctrl & 0x01) == 0) {
		uart0 = UART_FIFO;
		if (uart0 == '\r') {
			UART_FIFO = '\r';
			flag = 1;
		} else if (flag) {
			flag = 0;
			UART_FIFO = '\n';// when received data is '\n', it is usually false, so send '\n' after receiving data '\r'.
		} else {
			UART_FIFO = uart0;
		}
		uart_fifo0_ctrl = UART_FIFO_CTRL;
	}
}

void uart1_interrupt() {
    intc->en |= 0x04;                    // 开启 UART1 全局中断
}



