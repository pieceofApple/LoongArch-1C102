#include "calIn8M.h"
#include "Config.h"
#include "ls1x_pmu.h"
#include "ls1x_clock.h"
#include "ls1x_common.h"
#include "ls1x_uart.h"
#include "ls1x_wdg.h"
#include "ls1x_string.h"
#include "UserGpio.h"

extern void wakeup_reset(void);
extern int do_d1(int argc,void *argv[]);
extern int do_d4(int argc,void *argv[]);
extern int do_m1(int argc,void *argv[]);
extern int do_m4(int argc,void *argv[]);
extern int v_play(int argc,void *argv[]);
extern int hpet(int argc,void *argv[]);
extern int latimer(int argc,void *argv[]);
extern int delay(int argc, void *argv[]);
extern int wakeup(int argc, void *argv[]);
extern int date(int argc, void* argv[]);
extern int touch_test(int argc, void *argv[]);
extern int watch_dog(int argc, void *argv[]);
extern int i2cp (int argc, void *argv[]);
extern int i2cw (int argc, void *argv[]);
extern int i2cr (int argc, void *argv[]);
extern int adc(int argc, void* argv[]);
extern int batdet(int argc, void* argv[]);
extern int tmp(int argc, void* argv[]);
extern int uart_init (int argc, void *argv[]);
extern int spi_init(int argc, void* argv[]);
extern int spi_erase(int argc, void* argv[]);
extern int spi_write(int argc, void* argv[]);
extern int spi_read(int argc, void* argv[]);
extern int spi_flash(int argc, void* argv[]);
extern int gpio_int(int argc, void* argv[]);
extern int do_nothing();
extern int copy();
extern int copy_iram(int argc, void *argv[]);
extern unsigned int str2num(unsigned char);
// add
int do_help(int argc, void *argv[]);
int do_exit(int argc, void *argv[]);

// unsigned int nmi_caller;

static struct cmd_struct {
	const char *cmdname;
	int (*func)(int, void *[]);
	const char *usage;
	const char *expression;
} cmd[] __attribute__((section(".rodata"))) =  {
  {"exit",      do_exit,     "[exit]",                  ""},
  {"d1",        do_d1,       "[d1 <addr> <num>]",     "--dump address byte"},
  {"d4",        do_d4,       "[d4 <addr> <num>]",     "--dump address word"},
  {"help",      do_help,     "[help <command>]",      "--cmd list"},
  {"m1",        do_m1,       "[m1 <addr> <value>]",   "--modify address byte"},
  {"m4",        do_m4,       "[m4 <addr> <value>]",   "--modify address word"},
  {"v",         v_play,      "[v]",                   "--v1"},
  {"touch",     touch_test,  "[touch]",               "--v1"},
  {"hpet",      hpet,        "[timer test]",          "--v1"},
  {"latimer",   latimer,     "[core timer test]",     "--v1"},
  {"delay",     delay,       "[delay test]",          "--v1"},
  {"wakeup",    wakeup,      "[wakeup test]",         "--v1"},
  {"date",      date,        "[rtc test]",            "--v1"},
  {"wdg",       watch_dog,   "[wdg test]",            "--v1"},
  {"i2cp",      i2cp,        "[i2cp <prescale>]",     "--i2c prescale"},
  {"i2cw",      i2cw,        "[i2cw <chipaddr> <regaddr> <wdata>]",  "--i2c write"},
  {"i2cr",      i2cr,        "[i2cr <chipaddr> <regaddr>]",          "--i2c read"},
  {"adc",       adc,         "[adc]",                 "--adc"},
  {"batdet",    batdet,      "[batdet <n>]",          "--v1"},
  {"copy",      copy,        "[spi_flash=>in_flash]", "--v1"},
  {"copy_iram", copy_iram,   "[copy]",                "--batdet <n>"},
  {"uinit",     uart_init,   "[uart init]",           "--v1"},
  {"spinit",    spi_init,    "[spi_init]",            "--v1"},
  {"sperase",   spi_erase,   "[spi_erase]",           "--v1"},
  {"spwr",      spi_write,   "[spi_write]",           "--v1"},
  {"sprd",      spi_read,    "[spi_read]",            "--v1"},
  {"sflash",    spi_flash,   "[spi_flash]",           "--v1"},
  {"gpio_int",  gpio_int,    "[exti]",                "--v1"},
  {"t",         tmp,         "[exti]",                "--v1"},
//add
  {"NULL",      do_nothing,  "[NULL]",                "NULL"}
};

int do_exit(int argc, void *argv[])
{
}

int do_help(int argc, void *argv[])
{
	unsigned int i;
	char *s;
	switch(argc)
	{
		case 1:
			{
				printf("\ncommands:\n\n");
				for(i=0;strcmp("NULL", cmd[i].cmdname)!=0; i++)
				{
					printf("\t %2d:%s\n\r",i+1, cmd[i].cmdname);
				}
			}
			break;
		case 2:
			{
				s = (char *)argv[1];
				for(i=0; strcmp("NULL", cmd[i].cmdname)!=0; i++)
				{
					if(strcmp(s, cmd[i].cmdname)==0)
					{
						printf("\n\t%s\t%s\t%s\n", cmd[i].cmdname, cmd[i].usage, cmd[i].expression);
						break;
					}
				}
				if(strcmp("NULL", cmd[i].cmdname)==0)
				{
					printf("\n\tERROR: undefine command!!!\n");
				}
			}
			break;
		default:
			printf("\n usage: help  <cmd>\n\r");
			break;
	}
	return 0;
}

int cmdline(void)
{
	char c;
	char cmdbuffer[80];
	char cmdpara[8][30];
	int (*op)(int argc, void *argv[]);
	char *p[8];
	char *cmdptr;
	short cp, i, j, k, num;
	short h = 0;  			
	int tmp = 11;
	char history_str[13][80];
	for(j=0;j<13;j++) 
	{
		for(i=0; i<80; i++)
		{
			history_str[j][i] = '\0';
		}
	}

	while(1)
	{
START:
		for(i=0; i<80; i++)
		{
			cmdbuffer[i] = '\0';
		}
		printf("\n$ ");
		cmdptr = cmdpara[0];
		cp = 0; 
		while(1)
		{
			c = getchar();
			if((c>0x1f)&&(c<0x7f))
			{
				if(h > 0)
				{
					for(i=0; i<h ; i++)
					{
						cmdbuffer[cp-i] = cmdbuffer[cp-i-1];
					}
					cmdbuffer[cp-h] = c;
					cp++;
					for(i=h; i>=0; i--)
					{
						putchar(cmdbuffer[cp-i]);
					}
					for(i=0; i<cp-1; i++)
					{
						putchar(0x8);
						putchar(0x20);
						putchar(0x8);
					}
					for(i=0; cmdbuffer[i]; i++)
					{
						putchar(cmdbuffer[i]);
					}
					for(i=h; i>0; i--)
					{
						putchar(0x08);
					}
				}
				else
				{
					cmdbuffer[cp++] = c;
					putchar(c);
				}
			}
			else if(c == 0x8)
			{
				if((h != 0) && (cp-h > 0))
				{
					for(i=h; i>=0; i--)
					{
						putchar(cmdbuffer[cp-i]);
					}
					for(i=0; i<cp; i++)
					{
						putchar(0x8);
						putchar(0x20);
						putchar(0x8);
					}
					for(i=h; i>0 ; i--)
					{
						cmdbuffer[cp-i-1] = cmdbuffer[cp-i];
					}
					cmdbuffer[--cp] = '\0'; 
					for(i=0; cmdbuffer[i]; i++)
					{
						putchar(cmdbuffer[i]);
					}
					for(i=h; i>0; i--) 
					{
						putchar(0x08);
					}
				}
				else
				{
					if((cp != 0) && (h == 0))
					{
						cmdbuffer[--cp] = '\0';
						putchar(0x8);
						putchar(0x20);
						putchar(0x8);
					}
				}
			}
			else if((c==0xa) || (c==0xd))
			{
				if(cmdbuffer[0] == '\0')
				{
					 goto START;
				}
				h = 0;
				tmp = 11;
				for(j=0;cmdbuffer[j];j++)
				{
					history_str[11][j] = cmdbuffer[j];
				}
				break;
			}

/****************************************************************************/


			else if(c==0x1b)
			{
				c = getchar();
				if(c==0x5b)
				{
					c = getchar();
					switch(c)
					{
						case 0x44:
									if(h < cp)
									{
										putchar(0x8);
										h++;
									}
									else
										h = cp;
									break;
						case 0x41: 
									if(tmp>=1)
									{
										if(tmp==1)
										{
											tmp = 1;
											break;
										}
										else
											tmp--;
										for(; h != 0; h--)
										{
											putchar(cmdbuffer[cp-h]);
										}
										if((cmdbuffer[0] != 0)||(cp == 0))
										{
											for(i=0;cmdbuffer[i];i++)
											{
												putchar(0x8);
												putchar(0x20);
												putchar(0x8);
												cmdbuffer[i] = '\0';
											}
										}
										else
										{
											for(i=0;history_str[tmp+1][i];i++)
											{
												putchar(0x8);
												putchar(0x20);
												putchar(0x8);
											}
										}
										for(j=0;history_str[tmp][j];j++)
										{
											cmdbuffer[j] = history_str[tmp][j];
											putchar(cmdbuffer[j]);
										}
									}
									cp = j;
									break;
						case 0x43:		
									if(h > 0)
									{
										putchar(cmdbuffer[cp-h]);
										h--;
									}
									else
										h = 0;
									break;
						case 0x42:                      
									if(tmp <= 11)  
									{
										if(tmp == 11)
										{
											tmp = 11;
											break;
										}
										else
											tmp++;
										for(; h != 0; h--)
										{
											putchar(cmdbuffer[cp-h]);
										}
										if((cmdbuffer[0] != 0)||(cp == 0))
										{
											for(i=0;cmdbuffer[i];i++)
											{
													putchar(0x8);
													putchar(0x20);
													putchar(0x8);
													cmdbuffer[i] = '\0';
											}
										}
										else
										{
											for(i=0;history_str[tmp-1][i];i++)
											{
												putchar(0x8);
												putchar(0x20);
												putchar(0x8);
											}
										}
										for(j=0;history_str[tmp][j];j++)
										{
											cmdbuffer[j] = history_str[tmp][j];
											putchar(cmdbuffer[j]);
										}
									}
									cp = j;
									break;
						default :
									break;
					}
				}
				c = 0;
			}

/***********************************************************************/
		}
/***********************************************************************/
		if(tmp == 11)
		{
			for(j=1;j<12;j++) 
			{
				for(i=0;i<30;i++)
					history_str[j][i]=history_str[j+1][i];
			}
			for(i=0; i<30; i++) 
			{
				history_str[11][i] = '\0';
			}
		}

/***********************************************************************/
		if(cp == 0)
		{
			goto START;
		}
		else
		{
			for(i=0; i<8; i++)
				for(j=0; j<30; j++)
					cmdpara[i][j] = '\0';
			num = 0;  //argc
//			printf("\ncmd:%s\n", cmdbuffer);

			for(j = 0,i=0; i<cp; i++) //xpj
			{
				if(cmdbuffer[i] == 0x20)  //space
				{
					if((cmdbuffer[i+1] != 0x20) && ((cmdbuffer[i+1] != '\0'))) 
					{
						j = 0;
						num++;
						cmdptr = cmdpara[num];
					}
				}
				else
				{
					*(cmdptr + j) = cmdbuffer[i];
					j++;
				}
			}

			cmdptr = cmdpara[0];
			if(strcmp(cmdptr, cmd[0].cmdname)==0)
			{
				break;
			}
			else
			{
				for(k=1; strcmp("NULL", cmd[k].cmdname)!=0; k++)
				{
					if(strcmp(cmdptr, cmd[k].cmdname)==0)
					{
						op = cmd[k].func;
						for(j=0; j<=num; j++)
						{
							p[j] = (char *)(cmdpara[j]);
//							printf("cmdpara[%d]: %s\n", j, cmdpara[j]);
						}
						op(j, (void *)p);
						break;
					}
				}
				if(strcmp("NULL", cmd[k].cmdname)==0)
				{
					printf("\n\tERROR: undefine command!!!\n");
				}
			}
		}
	}
	return 0;
}


// ================================================================
// ================================================================
// ================================================================
#include "soc_ls1c102.h"
#include "my_delay.h"

#include "soc_gpio.h"
#include "soc_pwm.h"
#include "soc_hpet.h"
#include "soc_uart.h"
#include "soc_printf.h"
#include "soc_i2c.h"
#include "soc_AT24CXX.h"
#include "soc_spi.h"
#include "soc_w25qxx.h"//flash

#include "soc_game.h"
#include "soc_ps2.h"
// ================================================================

extern   uint32_t timer_cnt ;
extern   int timer_test ;

extern   uint32_t xx ;
extern   uint32_t yy ;
extern   uint32_t zz ;
extern   uint32_t score1 ;
extern   uint32_t score2 ;
extern   uint32_t score3 ;
extern   uint32_t score4 ;
extern   int game_key;

/************MPU6050 水果忍者*********************/
extern   int pitch ;
extern   int yaw ;
extern   int roll ;
extern   int flag_pitch ;
extern   int flag_yaw ;
extern   int flag_roll ;
/************Game Data*********************/
#define GROUND 240
extern   int t1 ;
extern   int t2 ;
extern   int blood_1 ;
extern   int blood_2 ;
extern   int energy_1 ;
extern   int energy_2 ;
extern   int energy_count_1 ;
extern   int energy_count_2 ;
extern   int player1_x ;
extern   int player1_y ;
extern   int prop1_x ;
extern   int prop1_y ;
extern   int player2_x ;
extern   int player2_y ;
extern   int prop2_x ;
extern   int prop2_y ;
extern   int player1_direction ; // 1朝右0朝左
extern   int player2_direction ; // 1朝右0朝左

extern   int attack_distance1 ;
extern   int attack_distance2 ;
/************Game Flag*****************/
/***Data Flag***/
extern   int directionleftflag_player1 ;
extern   int directionrightflag_player1 ;
extern   int directionleftflag_player2 ;
extern   int directionrightflag_player2 ;
extern   int bloodflag_player1 ;
extern   int bloodflag_player2 ;
extern   int energyflag_player1 ;
extern   int energyflag_player2 ;
/***持续型Flag**/
extern   int moveflag_player1 ;
extern   int moveflag_player2 ;
extern   int defendflag_player1 ;
extern   int defendflag_player2 ;
extern   int jumpflag_player1 ;
extern   int jumpflag_player2 ;
/**0.5s动画型Flag***/
extern   int lightpunchflag_player1 ;
extern   int lightpunchflag_player2 ;
extern   int heavypunchflag_player1 ;
extern   int heavypunchflag_player2 ;
extern   int lightkickflag_player1 ;
extern   int lightkickflag_player2 ;
extern   int heavykickflag_player1 ;
extern   int heavykickflag_player2 ;
extern   int jinengflag_player1 ;
extern   int jinengflag_player2 ;
extern   int jinenghitflag_player1 ;
extern   int jinenghitflag_player2 ;
/***Busy Flag****/
extern   int busyflag_player1 ; // 包含 轻拳轻脚重拳重脚 受击 技能 的读忙信号
extern   int busyflag_player2 ; // 包含 轻拳轻脚重拳重脚 受击 技能 的读忙信号
/***Press Flag***/		  // 用于一直按下四个动作的键时只执行一次，必须松开再按下才能执行第二次
extern   int pressflag1 ;
extern   int pressflag2 ;
extern   int pressflag3 ;
extern   int pressflag4 ;
extern   int pressflag5 ;
extern   int pressflag6 ;
extern   int pressflag7 ;
extern   int pressflag8 ;

extern   int data1 ;
extern   int data2 ;
extern   int kouxueflag_player1 ; // 此flag用于玩家1出拳到一半时玩家2起身不会掉血
extern   int kouxueflag_player2 ;
extern   int audioflag_player1 ;
extern   int audioflag_player2 ;
/************Game Flag*****************/

/************Game Enable*****************/
extern   int directionleftenable_player1 ;
extern   int directionrightenable_player1 ;
extern   int directionleftenable_player2 ;
extern   int directionrightenable_player2 ;
/***持续型Enable**/
extern   int moveenable_player1 ;
extern   int moveenable_player2 ;
extern   int defendenable_player1 ;
extern   int defendenable_player2 ;
extern   int jumpenable_player1 ;
extern   int jumpenable_player2 ;
/**0.5s动画型Enable***/
extern   int lightpunchenable_player1 ;
extern   int lightpunchenable_player2 ;
extern   int heavypunchenable_player1 ;
extern   int heavypunchenable_player2 ;
extern   int lightkickenable_player1 ;
extern   int lightkickenable_player2 ;
extern   int heavykickenable_player1 ;
extern   int heavykickenable_player2 ;
extern   int hitenable_player1 ;
extern   int hitenable_player2 ;
extern   int jinengenable_player1 ;
extern   int jinengenable_player2 ;
extern   int jinenghitenable_player1 ;
extern   int jinenghitenable_player2 ;
/***清除型enable**/
extern   int clearenable_player1 ;
extern   int clearenable_player2 ;

/************Game Enable*****************/
extern   int past_roll ;
extern   int value ;
extern   int past_value ;
extern   int count_6050 ;
extern   int count_xx ;
extern   int game_mode ;
extern   int flag_mode ;
extern   int flag_stop ;
extern   int count_readygo ;
extern   int count_bug ;
extern   int ko_flag ;


void Game_Flag(void);
void Game_Enable(void);
void Game_Data(void);
void Set_Data(void);

//		还剩下两个中断没有移植  ------//


volatile uint32_t key;  

int main(void) {

    EnableInt();// 开总中断
/*
	gpio_init(1, 1);
	gpio_init(13, 1);

	gpio_write(1,1);
	gpio_write(13,1);
*/
	uint8_t key;  
	PS2_Init();			 //驱动端口初始化
	PS2_SetInit();		 //配配置初始化,配置“红绿灯模式”，并选择是否可以修改
	                     //开启震动模式

	UART_FIFO_CTRL = 0x05;// baud_rate = 19200, enable parity check
    my_delay_ms(2000);// delay 2000ms at least after modifying UART_FIFO_CTRL. delay 1000ms is false.
    
    soc_printf("\r\n");
    my_delay_ms(25);
    
    uint8_t *str0 = "ABCD";
    soc_printf("str0 = %s\r\n", str0);
	my_delay_ms(25);// delay 25ms at least between two soc_printf.
    
    while(1) 
	{
		key=PS2_DataKey();
		//soc_printf("  \r\n   %d  is  pressed  \r\n",key);
		//my_delay_ms(25);
		if(key!=0)                   //有按键按下
    	{
			soc_printf("%d is presse\r\n",key);
			my_delay_ms(25);
		}
		//		//游戏2------//
		
		Game_Flag();
		Game_Enable();
		Game_Data();
		Set_Data();
		
		//		//切换游戏功能 mpu6050 ------//
		/*
		if (count_xx == 0)
		{
			value = roll - past_roll;
			if (value > 1)
				count_6050++;
			else
				count_6050 = 0;
			if (count_6050 == 4)
			{
				count_6050 = 0;
				xx = 1;
				game_mode++;
				if (game_mode == 3)
					game_mode = 0;
				Set_Prop1_x(game_mode);
			}
			past_roll = roll;
		}
		
		if (flag_mode == 0)
		{
			my_delay_ms(20);
		}
		if (game_key != 0xffff)
			flag_mode = 1;
		if (blood_1 == 0 || blood_2 == 0)
			flag_mode = 0;
		*/
		//my_delay_ms(3);

    }
    return 0;
}


extern int count_flag1 ;
extern int count_flag2 ;

void Game_Flag() // 核心部分,结合flag信号与当前状态判断是否将使能信号置1
{
	// 玩家1
	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && lightpunchflag_player1 == 1 && pressflag1 == 0 && hitenable_player1 == 0)
	{
		lightpunchenable_player1 = 1;
		busyflag_player1 = 1;
		pressflag1 = 1;
		attack_distance1 = 130;
		data1 = 7;
		kouxueflag_player2 = 2;
		audioflag_player1 = 1;
	}
	else
	{
		lightpunchenable_player1 = 0;
	}

	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && heavypunchflag_player1 == 1 && pressflag2 == 0 && hitenable_player1 == 0)
	{
		heavypunchenable_player1 = 1;
		busyflag_player1 = 1;
		pressflag2 = 1;
		attack_distance1 = 170;
		data1 = 12;
		kouxueflag_player2 = 2;
		audioflag_player1 = 2;
	}
	else
	{
		heavypunchenable_player1 = 0;
	}

	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && lightkickflag_player1 == 1 && pressflag3 == 0 && hitenable_player1 == 0)
	{
		lightkickenable_player1 = 1;
		busyflag_player1 = 1;
		pressflag3 = 1;
		attack_distance1 = 130;
		data1 = 7;
		kouxueflag_player2 = 2;
		audioflag_player1 = 1;
	}
	else
	{
		lightkickenable_player1 = 0;
	}
	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && heavykickflag_player1 == 1 && pressflag4 == 0 && hitenable_player1 == 0)
	{
		heavykickenable_player1 = 1;
		busyflag_player1 = 1;
		pressflag4 = 1;
		attack_distance1 = 170;
		data1 = 12;
		kouxueflag_player2 = 2;
		audioflag_player1 = 2;
	}
	else
	{
		heavykickenable_player1 = 0;
	}
	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && jinengflag_player1 == 1 && energy_count_1 >= 1 && hitenable_player1 == 0)
	{
		jinengenable_player1 = 1;
		busyflag_player1 = 1;
		attack_distance1 = 999;
		data1 = 30;
		kouxueflag_player2 = 2;
		audioflag_player1 = 3;
	}
	else
	{
		jinengenable_player1 = 0;
	}

	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpflag_player1 == 0 && moveflag_player1 == 1 && hitenable_player1 == 0)
		moveenable_player1 = 1;
	else
		moveenable_player1 = 0;
	if (busyflag_player1 == 0 && jumpenable_player1 == 0 && defendflag_player1 == 1 && hitenable_player1 == 0)
		defendenable_player1 = 1;
	else
		defendenable_player1 = 0;
	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpflag_player1 == 1 && ( (player1_x - player2_x > 127)|| (player2_x - player1_x > 127)) && hitenable_player1 == 0)
		jumpenable_player1 = 1;

	// 玩家2
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && lightpunchflag_player2 == 1 && pressflag5 == 0 && hitenable_player2 == 0 && lightpunchenable_player1 == 0)
	{
		lightpunchenable_player2 = 1;
		busyflag_player2 = 1;
		pressflag5 = 1;
		attack_distance2 = 130;
		data2 = 7;
		kouxueflag_player1 = 2;
		audioflag_player2 = 1;
	}
	else
	{
		lightpunchenable_player2 = 0;
	}
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && heavypunchflag_player2 == 1 && pressflag6 == 0 && hitenable_player2 == 0 && heavypunchenable_player1 == 0)
	{
		heavypunchenable_player2 = 1;
		busyflag_player2 = 1;
		pressflag6 = 1;
		attack_distance2 = 170;
		data2 = 12;
		kouxueflag_player1 = 2;
		audioflag_player2 = 2;
	}
	else
	{
		heavypunchenable_player2 = 0;
	}
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && lightkickflag_player2 == 1 && pressflag7 == 0 && hitenable_player2 == 0 && lightkickenable_player1 == 0)
	{
		lightkickenable_player2 = 1;
		busyflag_player2 = 1;
		pressflag7 = 1;
		attack_distance2 = 130;
		data2 = 7;
		kouxueflag_player1 = 2;
		audioflag_player2 = 1;
	}
	else
	{
		lightkickenable_player2 = 0;
	}
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && heavykickflag_player2 == 1 && pressflag8 == 0 && hitenable_player2 == 0 && heavykickenable_player1 == 0)
	{
		heavykickenable_player2 = 1;
		busyflag_player2 = 1;
		pressflag8 = 1;
		attack_distance2 = 170;
		data2 = 12;
		kouxueflag_player1 = 2;
		audioflag_player2 = 2;
	}
	else
	{
		heavykickenable_player2 = 0;
	}
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && jinengflag_player2 == 1 && energy_count_2 >= 1 && hitenable_player2 == 0 && jinengenable_player1 == 0)
	{
		jinengenable_player2 = 1;
		busyflag_player2 = 1;
		attack_distance2 = 999;
		data2 = 30;
		kouxueflag_player1 = 2;
		audioflag_player2 = 3;
	}
	else
	{
		jinengenable_player2 = 0;
	}

	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpflag_player2 == 0 && moveflag_player2 == 1 && hitenable_player2 == 0)
		moveenable_player2 = 1;
	else
		moveenable_player2 = 0;
	if (busyflag_player2 == 0 && jumpenable_player2 == 0 && defendflag_player2 == 1 && hitenable_player2 == 0)
		defendenable_player2 = 1;
	else
		defendenable_player2 = 0;
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpflag_player2 == 1 && ( (player1_x - player2_x > 127)|| (player2_x - player1_x > 127)) && hitenable_player2 == 0)
		jumpenable_player2 = 1;
/*
	// 受击
	if (busyflag_player1 == 1 && jinengenable_player1 == 0 && ((player1_x > player2_x && player1_direction == 0) || (player1_x < player2_x && player1_direction == 1)) && (abs(player1_x - player2_x) < attack_distance1) && defendenable_player2 == 0 && abs(player1_y - player2_y) < 50)
		hitenable_player2 = 1;
	else
		hitenable_player2 = 0;
	if (busyflag_player1 == 1 && jinengenable_player1 == 1 && ((player1_x > player2_x && player1_direction == 0) || (player1_x < player2_x && player1_direction == 1)) && (abs(player1_x - player2_x) < attack_distance1) && defendenable_player2 == 0 && abs(player1_y - player2_y) < 50)
		jinenghitenable_player2 = 1;
	if (busyflag_player2 == 1 && jinengenable_player2 == 0 && ((player2_x > player1_x && player2_direction == 0) || (player2_x < player1_x && player2_direction == 1)) && (abs(player1_x - player2_x) < attack_distance2) && defendenable_player1 == 0 && abs(player1_y - player2_y) < 50)
		hitenable_player1 = 1;
	else
		hitenable_player1 = 0;
	if (busyflag_player2 == 1 && jinengenable_player2 == 1 && ((player2_x > player1_x && player2_direction == 0) || (player2_x < player1_x && player2_direction == 1)) && (abs(player1_x - player2_x) < attack_distance2) && defendenable_player1 == 0 && abs(player1_y - player2_y) < 50)
		jinenghitenable_player1 = 1;

*/
	// 标志位处理
	if (kouxueflag_player1 == 1)
		kouxueflag_player1 = 0;
	if (kouxueflag_player1 == 2)
		kouxueflag_player1 = 1;
	if (kouxueflag_player2 == 1)
		kouxueflag_player2 = 0;
	if (kouxueflag_player2 == 2)
		kouxueflag_player2 = 1;
	// 无动作执行则清零
	if (busyflag_player1 == 0 && defendenable_player1 == 0 && jumpenable_player1 == 0 && moveflag_player1 == 0 && hitenable_player1 == 0)
		clearenable_player1 = 1;
	else
		clearenable_player1 = 0;
	if (busyflag_player2 == 0 && defendenable_player2 == 0 && jumpenable_player2 == 0 && moveflag_player2 == 0 && hitenable_player2 == 0)
		clearenable_player2 = 1;
	else
		clearenable_player2 = 0;
}

void Game_Enable() // 如果使能信号为1则执行对应音频和视频指令
{
	// 视频
	// 玩家1
	if (moveenable_player1 == 1)
		Set_video(1, 1);
	if (defendenable_player1 == 1)
		Set_video(2, 1);
	if (lightpunchenable_player1 == 1)
		Set_video(3, 1);
	if (heavypunchenable_player1 == 1)
		Set_video(4, 1);
	if (lightkickenable_player1 == 1)
		Set_video(5, 1);
	if (heavykickenable_player1 == 1)
		Set_video(6, 1);
	if (jumpenable_player1 == 1)
	{
		if (( (player2_x - player1_x < 128) || (player1_x - player2_x < 128) ) && player2_y - player1_y > 192 && t2 > 143 && moveenable_player1 == 1)
			Set_video(1, 1); // 在别人头上且在移动
		else if ( ( (player2_x - player1_x < 128) || (player1_x - player2_x < 128) ) && player2_y - player1_y > 192 && t2 > 143 && moveenable_player1 == 0)
			Set_video(1, 0); // 在别人头上且静止
		else
		{
			Set_video(7, 1);
			player1_y = (int)((24 * (t1 - 100) * (t1 - 100)) / 100);
			t2++;
		} // 执行跳跃的抛物线
		if (t2 == 201)
		{
			t2 = 0;
			jumpenable_player1 = 0;
		}
	}
	if (hitenable_player1 == 1)
		Set_video(8, 1);
	if (jinengenable_player1 == 1)
		Set_video(9, 1);
	if (jinenghitenable_player1 == 1)
		Set_video(10, 1);

	if (clearenable_player1 == 1)
		Set_video(1, 0);
	// 玩家2
	if (moveenable_player2 == 1)
		Set_video(11, 1);
	if (defendenable_player2 == 1)
		Set_video(12, 1);
	if (lightpunchenable_player2 == 1)
		Set_video(13, 1);
	if (heavypunchenable_player2 == 1)
		Set_video(14, 1);
	if (lightkickenable_player2 == 1)
		Set_video(15, 1);
	if (heavykickenable_player2 == 1)
		Set_video(16, 1);
	if (jumpenable_player2 == 1)
	{
		if (( (player2_x - player1_x < 128) || (player1_x - player2_x < 128) ) && player1_y - player2_y > 192 && t1 > 143 && moveenable_player2 == 1)
			Set_video(11, 1); // 在别人头上且在移动
		else if (( (player2_x - player1_x < 128) || (player1_x - player2_x < 128) ) && player1_y - player2_y > 192 && t1 > 143 && moveenable_player2 == 0)
			Set_video(11, 0); // 在别人头上且静止
		else
		{
			Set_video(17, 1);
			player2_y = (int)((24 * (t1 - 100) * (t1 - 100)) / 100);
			t1++;
		} // 执行跳跃的抛物线
		if (t1 == 201)
		{
			t1 = 0;
			jumpenable_player2 = 0;
		}
	}
	if (hitenable_player2 == 1)
	{
		Set_video(18, 1);
	}
	if (jinengenable_player2 == 1)
		Set_video(19, 1);
	if (jinenghitenable_player2 == 1)
		Set_video(20, 1);

	if (clearenable_player2 == 1)
		Set_video(11, 0);

	// 音频
	/****************测试用*********************/
	//	if(lightpunchenable_player1==1)  Set_Audio(13);
	//	if(heavypunchenable_player1==1)  Set_Audio(13);
	//	if(lightkickenable_player1==1)   Set_Audio(13);
	//	if(heavykickenable_player1==1)   Set_Audio(13);
	//	if(lightpunchenable_player2==1)  Set_Audio(13);
	//	if(heavypunchenable_player2==1)  Set_Audio(13);
	//	if(lightkickenable_player2==1)   Set_Audio(13);
	//	if(heavykickenable_player2==1)   Set_Audio(13);
	/*****************测试用********************/
	
	if (hitenable_player1 == 1)
		switch (audioflag_player2)
		{
		case 1:
			Set_Audio(5);
			break;
		case 2:
			Set_Audio(6);
			break;
		default:
			break;
		}
	if (hitenable_player2 == 1)
		switch (audioflag_player1)
		{
		case 1:
			Set_Audio(3);
			break;
		case 2:
			Set_Audio(4);
			break;
		default:
			break;
		}
	if (jinengenable_player1 == 1)
		Set_Audio(11);
	if (jinengenable_player2 == 1)
		Set_Audio(10);
	if (jinenghitenable_player1 == 1)
		Set_Audio(9);
	if (jinenghitenable_player2 == 1)
		Set_Audio(8);
	if ((blood_1 == 0 || blood_2 == 0) && ko_flag <= 40)
	{
		Set_Audio(13);
		ko_flag++;
	}
	if (game_mode == 2 && flag_stop == 0)
	{
		my_delay_ms(200);
		Set_Audio(12);
		count_readygo++;
		if (count_readygo == 5)
		{
			flag_stop = 1;
			Set_Audio(1);
		}
	}
}
void Game_Data() // 如果对应的使能信号为1则将计算数据
{
	// 玩家1
	if (moveenable_player1 == 1 && directionrightflag_player1 == 1 && player1_x < 512)
	{
		player1_direction = 1;
		if (player1_y < player2_y - 190 || (player1_x < player2_x - 128 || player1_x > player2_x - 128))
			player1_x++;
	}
	if (moveenable_player1 == 1 && directionleftflag_player1 == 1 && player1_x > 0)
	{
		player1_direction = 0;
		if (player1_y < player2_y - 190 || (player1_x > player2_x + 128 || player1_x < player2_x + 128))
			player1_x--;
	}
	if ((hitenable_player1 || jinenghitenable_player1) && bloodflag_player1 == 0 && kouxueflag_player1 == 1)
	{
		blood_1 = blood_1 - data2;
		if (blood_1 < 0)
			blood_1 = 0;
		bloodflag_player1 = 1; // 玩家1扣血
		if (!(energy_1 == 100 && energy_count_1 == 3) && energyflag_player1 == 0)
			energy_1 = energy_1 + data2 * 3; // 玩家1加能量
		if (jinengflag_player2 == 1)
			data2 = 0; // 放技能的玩家不回能量
		if (!(energy_2 == 100 && energy_count_2 == 3) && energyflag_player2 == 0)
			energy_2 = energy_2 + data2 * 4; // 玩家2加能量
	}
	if (jinengflag_player1 == 1 && energyflag_player1 == 0 && energy_count_1 >= 1)
	{
		energy_count_1 -= 1;
		energyflag_player1 = 1;
	} // 放技能的玩家扣蓝

	// 玩家2
	if (moveenable_player2 == 1 && directionrightflag_player2 == 1 && player2_x < 512)
	{
		player2_direction = 1;
		if (player2_y < player1_y - 190 || (player2_x < player1_x - 128 || player2_x > player1_x - 128))
			player2_x++;
	}
	if (moveenable_player2 == 1 && directionleftflag_player2 == 1 && player2_x > 0)
	{
		player2_direction = 0;
		if (player2_y < player1_y - 190 || (player2_x > player1_x + 128 || player2_x < player1_x + 128))
			player2_x--;
	}
	if ((hitenable_player2 || jinenghitenable_player2) && bloodflag_player2 == 0 && kouxueflag_player2 == 1)
	{
		blood_2 = blood_2 - data1;
		if (blood_2 < 0)
			blood_2 = 0;
		bloodflag_player2 = 1; // 玩家2扣血
		if (!(energy_2 == 100 && energy_count_2 == 3) && energyflag_player2 == 0)
			energy_2 = energy_2 + data1 * 3; // 玩家2加能量
		if (jinengflag_player1 == 1)
			data1 = 0; // 放技能的玩家不回能量
		if (!(energy_1 == 100 && energy_count_1 == 3) && energyflag_player1 == 0)
			energy_1 = energy_1 + data1 * 4; // 玩家1加能量
	}
	if (jinengflag_player2 == 1 && energyflag_player2 == 0 && energy_count_2 >= 1)
	{
		energy_count_2 -= 1;
		energyflag_player2 = 1;
	} // 放技能的玩家扣蓝

	// 最后约束
	if (energy_1 >= 100 && energy_count_1 <= 2)
	{
		energy_1 -= 100;
		energy_count_1++;
	}
	if (energy_1 >= 100 && energy_count_1 == 3)
	{
		energy_1 = 100;
		energy_count_1 = 3;
	}
	if (energy_2 >= 100 && energy_count_2 <= 2)
	{
		energy_2 -= 100;
		energy_count_2++;
	}
	if (energy_2 >= 100 && energy_count_2 == 3)
	{
		energy_2 = 100;
		energy_count_2 = 3;
	}
}

void Set_Data() // 将计算好的数据返回给video Output
{
	Set_Blood_1(blood_1);
	Set_Blood_2(blood_2);
	Set_Energy_1(energy_1);
	Set_Energy_2(energy_2);
	Set_Energy_count_1(energy_count_1);
	Set_Energy_count_2(energy_count_2);
	Set_Player1_x(player1_x);
	Set_Player1_y(player1_y);
	//		Set_Prop1_x(prop1_x);
	Set_Prop1_y(prop1_y);
	Set_Player2_x(player2_x);
	Set_Player2_y(player2_y);
	Set_Prop2_x(prop2_x);
	Set_Prop2_y(prop2_y);
	Set_Player1_direction(player1_direction);
	Set_Player2_direction(player2_direction);
}

/*
void BUSY1Handle() // 由game返回的中断信号,用于清除读忙信号以及伤害计算信号
{
	busyflag_player1 = 0;
	bloodflag_player2 = 0; // 用于一次出拳制造成一次伤害，然后在动作结束后才清除flag
	energyflag_player1 = 0;
	jinenghitenable_player2 = 0; // 使能过一次过后马上就会消失，懒得改了直接丢中断里清零了，这屎山我是懒得想了
}

void BUSY2Handle() // 由game返回的中断信号,用于清除读忙信号以及伤害计算信号
{
	busyflag_player2 = 0;
	bloodflag_player1 = 0; // 用于一次出拳制造成一次伤害，然后在动作结束后才清除flag
	energyflag_player2 = 0;
	jinenghitenable_player1 = 0;
}
*/