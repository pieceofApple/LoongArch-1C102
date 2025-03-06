#include "../driver/calIn8M.h"
#include"ls1x.h"
#include"ls1x_gpio.h"
#include"ls1x_wdg.h"
#include"ls1x_common.h"
#include"ls1x_exti.h"
#include"ls1c102_interrupt.h"
#include"ls1c102_touch.h"
#include"ls1c102_ptimer.h"
#include"ls1c102_i2c.h"
#include"Config.h"

// soc
#include "soc_gpio.h"
#include "soc_uart.h"
#include "soc_game.h"
// soc

#define	BEBUG_IRQ()  printf("\r\n <  line: %d func:%s   >\r\n",__LINE__,__FUNCTION__)
void (* const exti_irq_handle[32])(void);

void exti_gpioa0_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A0);
}
void exti_gpioa1_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A1);
}
void exti_gpioa2_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A2);
}
void exti_gpioa3_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A3);
}
void exti_gpioa4_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A4);
}
void exti_gpioa5_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A5);
}
void exti_gpioa6_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A6);
}
void exti_gpioa7_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_A7);
}
void exti_gpiob0_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B0);
}
void exti_gpiob1_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B1);
}
void exti_gpiob2_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B2);
}
void exti_gpiob3_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B3);
}
void exti_gpiob4_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B4);
}
void exti_gpiob5_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B5);
}
void exti_gpiob6_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B6);
}
void exti_gpiob7_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_B7);
}

void exti_gpioc0_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C0);
}
void exti_gpioc1_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C1);
}
void exti_gpioc2_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C2);
}
void exti_gpioc3_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C3);
}
void exti_gpioc4_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C4);
}
void exti_gpioc5_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C5);
}
void exti_gpioc6_irq_handler(void)
{
	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C6);
}
void exti_gpioc7_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_C7);
}
void exti_gpiod0_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D0);
}
void exti_gpiod1_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D1);
}
void exti_gpiod2_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D2);
}
void exti_gpiod3_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D3);
}
void exti_gpiod4_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D4);
}

void exti_gpiod5_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D5);
}
void exti_gpiod6_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D6);
}
void exti_gpiod7_irq_handler(void)
{

	BEBUG_IRQ();
	EXTI_ClearITPendingBit(EXTI, IRQ_GPIO_D7);
}
void (* const Ext_IrqHandle[32])(void) = {
   exti_gpioa0_irq_handler,
   exti_gpioa1_irq_handler,
   exti_gpioa2_irq_handler,
   exti_gpioa3_irq_handler,
   exti_gpioa4_irq_handler,
   exti_gpioa5_irq_handler,
   exti_gpioa6_irq_handler,
   exti_gpioa7_irq_handler,
   exti_gpiob0_irq_handler,
   exti_gpiob1_irq_handler,
   exti_gpiob2_irq_handler,
   exti_gpiob3_irq_handler,
   exti_gpiob4_irq_handler,
   exti_gpiob5_irq_handler,
   exti_gpiob6_irq_handler,
   exti_gpiob7_irq_handler,
   exti_gpioc0_irq_handler,
   exti_gpioc1_irq_handler,
   exti_gpioc2_irq_handler,
   exti_gpioc3_irq_handler,
   exti_gpioc4_irq_handler,
   exti_gpioc5_irq_handler,
   exti_gpioc6_irq_handler,
   exti_gpioc7_irq_handler,
   exti_gpiod0_irq_handler,
   exti_gpiod1_irq_handler,
   exti_gpiod2_irq_handler,
   exti_gpiod3_irq_handler,
   exti_gpiod4_irq_handler,
   exti_gpiod5_irq_handler,
   exti_gpiod6_irq_handler,
   exti_gpiod7_irq_handler,
};

void ext_handler(void)
{
	PMU_CMDW = (1 << 24);
	INT32U regsrc;// = EXTI->EXINT_SRC;
	INT32U regen;// = EXTI->EXINT_SRC;
	INT32U irq_no;
	BEBUG_IRQ();
	regsrc = EXTI->EXINT_SRC;
	regen = EXTI->EXINT_EN;
	regsrc = (regsrc & regen);
	asm("nop");

	for(irq_no = 0; irq_no < 32; irq_no++)
        {
		if((regsrc>>irq_no) & 0x1)
		{
		   Ext_IrqHandle[irq_no]();
		}
        }
}

void SOFT_INT(void)
{
	printf("\n.............SOFT_INT..............\n\r");
	Set_soft_stop();
}

/***********************************************************************
 函数功能:    	8M定时器中断处理函数
 @param:		无
 @other:     无
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
void TIMER_8M_INT(void)
{
	PMU_CMDW = (1 << 21); // 清除中断标志
	Set_Timer_clear();
	Set_Timer_Init(8 * 10000); //  1.25ms
}

/***********************************************************************
 函数功能:    	定时唤醒中断处理函数
 @param:		无
 @other:     睡眠下定时喂狗，防止系统复位
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
void TIMER_WAKE_INT(void)
{
	//printf("\n.............TIMER_WAKE_INT..............\n\r");
	PMU_CMDW = (1 << 16); // 清除中断标志
	INT32U SleepEn = PMU_CMDSTS & 0xffffffff;
	WDG_DogFeed();
	 //睡眠后，定时喂狗，否则会不断重启
}
/***********************************************************************
 函数功能:    	触摸按键中断处理函数
 @param:	无
 @other:        无
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
#define KEY_CANCLE 8
void TOUCH(void)
{
    INT8U i;
    INT16U KeyChannel;
    INT8U KeyType;
    KeyChannel = (TS_STAT >> 16) & 0xfff;
    KeyType = TS_STAT & 0xf;
    PMU_CMDW = (1 << 17); // 清除中断标志
    TS_STAT = 0xf;
	printf("\n---touchInt:KeyChannel:0x%x\n",KeyChannel);

//    Printf_KeyType(KeyType);
//    Printf_KeyChannel(KeyChannel);
//    Printf_KeyVal();
}

/***********************************************************************
 函数功能:    	串口2接收中断处理函数
 @param:		无
 @other:     无
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
void UART2_INT(void)
{
	PMU_CMDW = (1 << 18);
	INT8U uart_sr = UART2_IIR;
}

/***********************************************************************
 函数功能:    	电量检测中断处理函数
 @param:		无
 @other:     该中断可查看用户手册
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
void BAT_FAIL(void)
{
    uint32_t tmp = (PMU_CMDSTS & 0xf80000)>>19;
    PMU_CMDW = (PMU_CMDSTS & 0xf80000);        
    switch(tmp){
        case 0x1:
	        printf("\n.............BAT_FAIL..............\n\r");
            PMU_CMDSTS  =   0x0;   // IT config
            break;
        case 0x2:
            break;
        case 0x4:
            break;
        case 0x8:
            break;
        case 0x10:
	        printf("\n.............ADC..............\n\r");
            PMU_CMDSTS  &=   (~0x8000);   // IT dis
            break;
        default:
            break;
    }
}

volatile int state = 0;
/***********************************************************************
 函数功能:    	INTC中断处理函数
 @param:		无
 @other:     该中断可查看用户手册
 @return:	无
 @auther :	朱晓宇
 @time	:	2020年4月9日
 ***********************************************************************/
uint32_t timer_cnt = 0;
int timer_test = 0;

uint32_t xx = 0;
uint32_t yy = 0;
uint32_t zz = 0;
uint32_t score1 = 0;
uint32_t score2 = 0;
uint32_t score3 = 0;
uint32_t score4 = 0;
int game_key;

/************MPU6050 水果忍者*********************/
int pitch = 0;
int yaw = 0;
int roll = 0;
int flag_pitch = 0;
int flag_yaw = 0;
int flag_roll = 0;
/************Game Data*********************/
#define GROUND 240
int t1 = 0;
int t2 = 0;
int blood_1 = 100;
int blood_2 = 100;
int energy_1 = 0;
int energy_2 = 0;
int energy_count_1 = 0;
int energy_count_2 = 0;
int player1_x = 50;
int player1_y = 240;
int prop1_x = 00;
int prop1_y = 00;
int player2_x = 450;
int player2_y = 240;
int prop2_x = 0;
int prop2_y = 0;
int player1_direction = 1; // 1朝右0朝左
int player2_direction = 0; // 1朝右0朝左
void Game_Data(void);
void Set_Data(void);
int attack_distance1 = 0;
int attack_distance2 = 0;
/************Game Flag*****************/
/***Data Flag***/
int directionleftflag_player1 = 0;
int directionrightflag_player1 = 0;
int directionleftflag_player2 = 0;
int directionrightflag_player2 = 0;
int bloodflag_player1 = 0;
int bloodflag_player2 = 0;
int energyflag_player1 = 0;
int energyflag_player2 = 0;
/***持续型Flag**/
int moveflag_player1 = 0;
int moveflag_player2 = 0;
int defendflag_player1 = 0;
int defendflag_player2 = 0;
int jumpflag_player1 = 0;
int jumpflag_player2 = 0;
/**0.5s动画型Flag***/
int lightpunchflag_player1 = 0;
int lightpunchflag_player2 = 0;
int heavypunchflag_player1 = 0;
int heavypunchflag_player2 = 0;
int lightkickflag_player1 = 0;
int lightkickflag_player2 = 0;
int heavykickflag_player1 = 0;
int heavykickflag_player2 = 0;
int jinengflag_player1 = 0;
int jinengflag_player2 = 0;
int jinenghitflag_player1 = 0;
int jinenghitflag_player2 = 0;
/***Busy Flag****/
int busyflag_player1 = 0; // 包含 轻拳轻脚重拳重脚 受击 技能 的读忙信号
int busyflag_player2 = 0; // 包含 轻拳轻脚重拳重脚 受击 技能 的读忙信号
/***Press Flag***/		  // 用于一直按下四个动作的键时只执行一次，必须松开再按下才能执行第二次
int pressflag1 = 0;
int pressflag2 = 0;
int pressflag3 = 0;
int pressflag4 = 0;
int pressflag5 = 0;
int pressflag6 = 0;
int pressflag7 = 0;
int pressflag8 = 0;
void Game_Flag(void);
int data1 = 0;
int data2 = 0;
int kouxueflag_player1 = 0; // 此flag用于玩家1出拳到一半时玩家2起身不会掉血
int kouxueflag_player2 = 0;
int audioflag_player1 = 0;
int audioflag_player2 = 0;
/************Game Flag*****************/

/************Game Enable*****************/
int directionleftenable_player1 = 0;
int directionrightenable_player1 = 0;
int directionleftenable_player2 = 0;
int directionrightenable_player2 = 0;
/***持续型Enable**/
int moveenable_player1 = 0;
int moveenable_player2 = 0;
int defendenable_player1 = 0;
int defendenable_player2 = 0;
int jumpenable_player1 = 0;
int jumpenable_player2 = 0;
/**0.5s动画型Enable***/
int lightpunchenable_player1 = 0;
int lightpunchenable_player2 = 0;
int heavypunchenable_player1 = 0;
int heavypunchenable_player2 = 0;
int lightkickenable_player1 = 0;
int lightkickenable_player2 = 0;
int heavykickenable_player1 = 0;
int heavykickenable_player2 = 0;
int hitenable_player1 = 0;
int hitenable_player2 = 0;
int jinengenable_player1 = 0;
int jinengenable_player2 = 0;
int jinenghitenable_player1 = 0;
int jinenghitenable_player2 = 0;
/***清除型enable**/
int clearenable_player1 = 0;
int clearenable_player2 = 0;
void Game_Enable(void);
/************Game Enable*****************/
int past_roll = 0;
int value = 0;
int past_value = 0;
int count_6050 = 0;
int count_xx = 0;
int game_mode = 0;
int flag_mode = 0;
int flag_stop = 0;
int count_readygo = 0;
int count_bug = 0;
int ko_flag = 0;


int count_flag1 = 0;
int count_flag2 = 0;
void intc_handler(void)
{
	INT8U IntReg = INT_OUT;
	//在这边写中断需要处理的东西
    if(IntReg  & IRQ_TIMER)//Timer  每1ms扫描一次按键,按下去后就把对应的flag置1，否则置0   这个定时中断的时间需要修改
    { 
        if(TIM_GetITStatus(TIM_FLAG_Trigger))
        {
			
			if (xx == 1)
				count_xx++;
			if (count_xx == 1000)
			{
				count_xx = 0;
				xx = 0;
			}
			timer_test++;
			game_key = Read_Key_output();
			//                                                                                                                 玩家1      玩家2
			/**********************玩家1动作***************************************************************************************************************************/
			
			if ((game_key | 0xfeff) == 0xfeff)
				directionrightflag_player1 = 1;
			else
				directionrightflag_player1 = 0; // 1111_1110  1111_1111 右移
			if ((game_key | 0xfdff) == 0xfdff)
				directionleftflag_player1 = 1;
			else
				directionleftflag_player1 = 0; // 1111_1101  1111_1111 左移
			if ((game_key | 0xfeff) == 0xfeff || (game_key | 0xfdff) == 0xfdff)
				moveflag_player1 = 1;
			else
				moveflag_player1 = 0;

			if ((game_key | 0xfbff) == 0xfbff)
				defendflag_player1 = 1;
			else
				defendflag_player1 = 0; // 1111_1011  1111_1111 防御

			if ((game_key | 0xf7ff) == 0xf7ff)
				jumpflag_player1 = 1;
			else
				jumpflag_player1 = 0; // 1111_0111  1111_1111 跳跃

			if ((game_key | 0xefff) == 0xefff)
				lightpunchflag_player1 = 1;
			else
			{
				lightpunchflag_player1 = 0;
				pressflag1 = 0;
			} // 1110_1111  1111_1111 轻拳
			if ((game_key | 0xdfff) == 0xdfff)
				heavypunchflag_player1 = 1;
			else
			{
				heavypunchflag_player1 = 0;
				pressflag2 = 0;
			} // 1101_1111  1111_1111 重拳
			if ((game_key | 0xbfff) == 0xbfff)
				lightkickflag_player1 = 1;
			else
			{
				lightkickflag_player1 = 0;
				pressflag3 = 0;
			} // 1011_1111  1111_1111 轻腿
			if ((game_key | 0x7fff) == 0x7fff)
				heavykickflag_player1 = 1;
			else
			{
				heavykickflag_player1 = 0;
				pressflag4 = 0;
			} // 0111_1111  1111_1111 重腿
			
			/**********************玩家2动作*******************************************************************************************/
			
			if ((game_key | 0xfffe) == 0xfffe)
				directionrightflag_player2 = 1;
			else
				directionrightflag_player2 = 0; // 1111_1111  1111_1110 右移
			if ((game_key | 0xfffd) == 0xfffd)
				directionleftflag_player2 = 1;
			else
				directionleftflag_player2 = 0; // 1111_1111  1111_1101 左移
			if ((game_key | 0xfffe) == 0xfffe || (game_key | 0xfffd) == 0xfffd)
				moveflag_player2 = 1;
			else
				moveflag_player2 = 0;

			if ((game_key | 0xfffb) == 0xfffb)
				defendflag_player2 = 1;
			else
				defendflag_player2 = 0; // 1111_1111  1111_1011 防御

			if ((game_key | 0xfff7) == 0xfff7)
				jumpflag_player2 = 1;
			else
				jumpflag_player2 = 0; // 1111_1111  1111_0111 跳跃

			if ((game_key | 0xffef) == 0xffef)
				lightpunchflag_player2 = 1;
			else
			{
				lightpunchflag_player2 = 0;
				pressflag5 = 0;
			} // 1111_1111  1110_1111 轻拳
			if ((game_key | 0xffdf) == 0xffdf)
				heavypunchflag_player2 = 1;
			else
			{
				heavypunchflag_player2 = 0;
				pressflag6 = 0;
			} // 1111_1111  1101_1111 重拳
			if ((game_key | 0xffbf) == 0xffbf)
				lightkickflag_player2 = 1;
			else
			{
				lightkickflag_player2 = 0;
				pressflag7 = 0;
			} // 1111_1111  1011_1111 轻腿
			if ((game_key | 0xff7f) == 0xff7f)
				heavykickflag_player2 = 1;
			else
			{
				heavykickflag_player2 = 0;
				pressflag8 = 0;
			} // 1111_1111  0111_1111 重腿
			
			/*
			// 技能释放
			if (data_audio == 0x11)
			{
				jinengflag_player1 = 1;
				count_flag1++;
				if (count_flag1 == 50)
				{
					count_flag1 = 0;
					jinengenable_player1 = 0;
					data_audio = 0;
				}
			}
			else
				jinengflag_player1 = 0;
			if (data_audio == 0x22)
			{
				jinengflag_player2 = 1;
				count_flag2++;
				if (count_flag2 == 50)
				{
					count_flag2 = 0;
					jinengenable_player2 = 0;
					data_audio = 0;
				}
			}
			else
				jinengflag_player2 = 0;
			*/

            TIM_ClearIT(TIM_FLAG_Trigger);
            // printf("Peripherals Timer clear interrupt..\n");
        }
    }
    if (IntReg & UART1_INT_OUT) //Uart1
	{
		// uint8_t chr = UART1_RxData ;
        // printf("uart1 recv:0x%x\n",chr);

		// ================================================================ soc
		char uart_fifo0_ctrl;
		int uart0;
		int flag = 0;

		uart_fifo0_ctrl = UART_FIFO_CTRL;
		while ((uart_fifo0_ctrl & 0x01) == 0) {
			uart0 = UART_FIFO;
			if(uart0 == '\r') {
				UART_FIFO = '\r';
				flag = 1;
			} else if(flag) {
				flag = 0;
				UART_FIFO = '\n';// when received data is '\n', it is usually false, so send '\n' after receiving data '\r'.
			} else {
				UART_FIFO = uart0;
			}
			uart_fifo0_ctrl = UART_FIFO_CTRL;
		}
		// ================================================================ soc

		INT_CLR = UART1_INT_CLR;
	}
	if (IntReg & UART0_INT_OUT) //Uart0
	{
		uint8_t chr = UART0_RxData ;
		// printf("uart0 recv:0x%x\n",chr);
		recv_dat_int(chr);
		INT_CLR = UART0_INT_CLR;
	}

	INT_CLR = 0xff;
}


void TIMER_HANDLER(void)
{
    Set_Timer_clear();
    printf("Core Timer clear interrupt..\n");
    Set_Timer_stop();
}
