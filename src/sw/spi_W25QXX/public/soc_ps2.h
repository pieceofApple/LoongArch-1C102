#ifndef _SOC_PS2_H
#define _SOC_PS2_H

#ifdef __cplusplus
extern "C" {
#endif


#include "soc_gpio.h"
#include <stdint.h>
/*********************************************************
Copyright (C), 2015-2025, YFRobot.
www.yfrobot.com
File：PS2驱动程序
Author：pinggai    Version:1.1     Data:2015/10/20
Description: PS2驱动程序
             增加功能：
			 1、软件设置“红灯模式”、“绿灯模式”，并可以设置“保存”，通过手柄“模式按键”无法改变
			 2、设置手柄震动：通过数值的设置，改变左侧大震动电机震动频率。
			                  通过数值的设置，开关右侧小震动电机。
History:  
V1.0: 	2015/05/16
1、手柄解码，识别按键值，读取模拟值。       
**********************************************************/	 



#define DI    gpio_read(1)         //PB12  输入 

#define DO_H gpio_write(13, 1)        //命令位高
#define DO_L gpio_write(13, 0)        //命令位低

#define CS_H gpio_write(18, 1)       //CS拉高
#define CS_L gpio_write(18, 0)       //CS拉低

#define CLK_H gpio_write(19, 1)      //时钟拉高
#define CLK_L gpio_write(19, 0)      //时钟拉低


//These are our button constants
#define PSB_SELECT      1
#define PSB_L3          2
#define PSB_R3          3
#define PSB_START       4
#define PSB_PAD_UP      5
#define PSB_PAD_RIGHT   6
#define PSB_PAD_DOWN    7
#define PSB_PAD_LEFT    8
#define PSB_L2          9
#define PSB_R2          10
#define PSB_L1          11
#define PSB_R1          12
#define PSB_GREEN       13
#define PSB_RED         14
#define PSB_BLUE        15
#define PSB_PINK        16

#define PSB_TRIANGLE    13
#define PSB_CIRCLE      14
#define PSB_CROSS       15
#define PSB_SQUARE      16

//#define WHAMMY_BAR		8

//These are stick values
#define PSS_RX 5                //右摇杆X轴数据
#define PSS_RY 6
#define PSS_LX 7
#define PSS_LY 8

extern uint32_t Data[9];
extern uint32_t MASK[16];
extern uint32_t Handkey;

void PS2_Init(void);
uint32_t PS2_RedLight(void);   //判断是否为红灯模式
void PS2_ReadData(void); //读手柄数据
void PS2_Cmd(uint32_t CMD);		  //向手柄发送命令
uint32_t PS2_DataKey(void);		  //按键值读取
uint32_t PS2_AnologData(uint32_t button); //得到一个摇杆的模拟量
void PS2_ClearData(void);	  //清除数据缓冲区
void PS2_Vibration(uint32_t motor1, uint32_t motor2);//振动设置motor1  0xFF开，其他关，motor2  0x40~0xFF

void PS2_EnterConfing(void);	 //进入配置
void PS2_TurnOnAnalogMode(void); //发送模拟量
void PS2_VibrationMode(void);    //振动设置
void PS2_ExitConfing(void);	     //完成配置
void PS2_SetInit(void);		     //配置初始化

#ifdef __cplusplus
}
#endif

#endif // _SOC_PS2_H