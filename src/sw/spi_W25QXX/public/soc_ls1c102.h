#ifndef SOC_LS1C102_H_
#define SOC_LS1C102_H_

#ifdef __cplusplus
extern "C" {
#endif 

#include <stdint.h>



// ================================================================
#define LS1C102_PMU_BASE           0xBFEB0000      // 电源管理单元寄存器基地址

typedef struct 
{
    volatile unsigned int ChipCtrl;             // 0x00 全局配置
    volatile unsigned int CmdSts;               // 0x04 命令与状态
    volatile unsigned int Count;                // 0x08 时间计数器
    volatile unsigned int Compare;              // 0x0c 唤醒时间配置
    volatile unsigned int IOSEL0;               // 0x10 IO复用选择 0
    volatile unsigned int IOSEL1;               // 0x14 IO复用选择 1
    volatile unsigned int IOSEL2;               // 0x18 IO复用选择 2
    volatile unsigned int IOSEL3;               // 0x1c IO复用选择 3
    volatile unsigned int ExIntEn;              // 0x20 外部中断使能
    volatile unsigned int ExIntPol;             // 0x24 外部中断极性
    volatile unsigned int ExIntEdge;            // 0x28 外部中断边沿
    volatile unsigned int ExIntSrc;             // 0x2c 外部中断状态
    volatile unsigned int WdtCfg;               // 0x30 看门狗配置
    volatile unsigned int WdtFeed;              // 0x34 喂狗
    volatile unsigned int PowerCfg;             // 0x38 电源配置
    volatile unsigned int CommandW;             // 0x3C XXX datasheet上没有描述这个寄存器, == CmdSts?
    volatile unsigned int GPIOA_OE;             // 0x40 GPIOA 输出使能
    volatile unsigned int GPIOA_O;              // 0x44 GPIOA 输出
    volatile unsigned int GPIOA_I;              // 0x48 GPIOA 输入
    volatile unsigned int rsv1;                 // 0x4C
    volatile unsigned int GPIOB_OE;             // 0x50 GPIOB 输出使能
    volatile unsigned int GPIOB_O;              // 0x54 GPIOB 输出
    volatile unsigned int GPIOB_I;              // 0x58 GPIOB 输入
    volatile unsigned int rsv2;                 // 0x5C
    volatile unsigned int Pulse0;               // 0x60 脉冲输出配置 0
    volatile unsigned int Pulse1;               // 0x64 脉冲输出配置 1
    volatile unsigned int UserDat;              // 0x68 用户数据
    volatile unsigned int AdcCtrl;              // 0x6c ADC 控制
    volatile unsigned int AdcDat;               // 0x70 ADC 数据
    volatile unsigned int rsv3[3];              // 0x74/0x78/0x7C
    volatile unsigned char GPIOBit[0x40];       // 0x80~0xbf GPIO 位访问
} HW_PMU_t;

#define g_pmu ((HW_PMU_t *) LS1C102_PMU_BASE)
// ================================================================



// ================================================================
#define LS1C102_TIMER_BASE         0xBFED0000      // 定时器寄存器基地址

typedef struct 
{
    volatile unsigned int cfg;                  // 0x00 配置寄存器
    volatile unsigned int cnt;                  // 0x04 计数值寄存器
    volatile unsigned int cmp;                  // 0x08 比较值寄存器
    volatile unsigned int step;                 // 0x0c 步进值寄存器
} HW_TIMER_t;

#define g_timer ((HW_TIMER_t *)LS1C102_TIMER_BASE)// 获取定时器寄存器
// ================================================================



// ================================================================
#define LS1C102_INTC_BASE          0xBFEA0000      // 中断控制寄存器基地址

typedef struct
{
    volatile unsigned char en;     // 0x00 中断使能寄存器. 1=中断使能
    volatile unsigned char edge;   // 0x01 中断边沿寄存器. 1=边沿触发, 0=电平触发
    volatile unsigned char pol;    // 0x02 中断极性寄存器. 1=高电平/上升沿触发
    volatile unsigned char clr;    // 0x03 中断清除寄存器. 写1清除中断状态
    volatile unsigned char set;    // 0x04 中断置位寄存器. 写1置中断触发模式的中断状态
    volatile unsigned char out;    // 0x05 中断输出寄存器. 1=中断触发
    volatile unsigned char srprot; // 0x06 运行状态及保护寄存器
} HW_INTC_t;

#define intc ((HW_INTC_t *)LS1C102_INTC_BASE)// 获取中断寄存器
// ================================================================


// ================================================================
// typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;

// #define I2C                 ((I2C_TypeDef *) I2C_BASE)

// typedef struct
// {
// 	unsigned int I2C_ClockSpeed;         /*!< Specifies the clock frequency.
//                                         This parameter must be set to a value lower than 400kHz */

// 	uint8_t I2C_Mode;                /*!< Specifies the I2C mode.
//                                         This parameter can be a value of @ref I2C_mode */

// 	uint8_t I2C_OwnAddress1;         /*!< Specifies the first device own address.
//                                         This parameter can be a 7-bit or 10-bit address. */

// 	uint8_t I2C_BuslockCheckEn;    	 /*!< Set the I2C buslock check function*/


// 	uint8_t I2C_SlvAutoresetEn;		 /*!< Set the I2C autoreset check function*/

// }I2C_InitTypeDef;
// ================================================================

/******************************************************************************/
/*                Slave5:KEYBOARD FUNCTION DECLARATION                        */
/******************************************************************************/
#define Keyboard_BASE            0xBFEE0000      // 按键控制寄存器基地址
#define Keyboard_keydata_clear (*(volatile unsigned int *)Keyboard_BASE)
void KEYHandle(void);
/******************************************************************************/
/*                Slave6:GAME FUNCTION DECLARATION                            */
/******************************************************************************/
typedef struct
{
	volatile unsigned int x_coordinate;		 // 0xBFEE_0000 水果 x坐标
	volatile unsigned int y_coordinate;		 // 0xBFEE_0004 水果 y坐标
	volatile unsigned int blood_1;			 // 0xBFEE_0008 玩家1 血量
	volatile unsigned int blood_2;			 // 0xBFEE_000c 玩家2 血量
	volatile unsigned int energy_1;			 // 0xBFEE_0010 玩家1 能量条
	volatile unsigned int energy_2;			 // 0xBFEE_0014 玩家2 能量条
	volatile unsigned int energy_count_1;	 // 0xBFEE_0018 玩家1 能量个数
	volatile unsigned int energy_count_2;	 // 0xBFEE_001c 玩家2 能量个数
	volatile unsigned int player1_x;		 // 0xBFEE_0020 玩家1 x坐标
	volatile unsigned int player1_y;		 // 0xBFEE_0024 玩家1 y坐标
	volatile unsigned int prop1_x;			 // 0xBFEE_0028 道具1 x坐标
	volatile unsigned int prop1_y;			 // 0xBFEE_002c 道具1 y坐标
	volatile unsigned int player2_x;		 // 0xBFEE_0030 玩家2 x坐标
	volatile unsigned int player2_y;		 // 0xBFEE_0034 玩家2 y坐标
	volatile unsigned int prop2_x;			 // 0xBFEE_0038 道具2 x坐标
	volatile unsigned int prop2_y;			 // 0xBFEE_003c 道具2 y坐标
	volatile unsigned int player1_direction; // 0xBFEE_0040 玩家1 方向	(1为左，0为右)
	volatile unsigned int player2_direction; // 0xBFEE_0044 玩家2 方向	(1为左，0为右)

	volatile unsigned int video[20];
	//                                             玩家1
	// 0xBFEE_0048  video[0]  移动
	// 0xBFEE_004c  video[1]  防御
	// 0xBFEE_0050  video[2]  轻拳
	// 0xBFEE_0054  video[3]  重拳
	// 0xBFEE_0058  video[4]  轻踢
	// 0xBFEE_005c  video[5]  重踢
	// 0xBFEE_0060  video[6]  跳跃
	// 0xBFEE_0064  video[7]  受击
	// 0xBFEE_0068  video[8]  技能
	// 0xBFEE_006c  video[9]  技能受击
	//                                             玩家2
	// 0xBFEE_0070  video[10] 移动
	// 0xBFEE_0074  video[11] 防御
	// 0xBFEE_0078  video[12] 轻拳
	// 0xBFEE_007c  video[13] 重拳
	// 0xBFEE_0080  video[14] 轻踢
	// 0xBFEE_0084  video[15] 重踢
	// 0xBFEE_0088  video[16] 跳跃
	// 0xBFEE_008c  video[17] 受击
	// 0xBFEE_0090  video[18] 技能
	// 0xBFEE_0094  video[19] 技能受击

	volatile unsigned int audio[13];
	//                                             游戏1：水果忍者
	// 0xBFEE_0098 audio[0]  音效1  切水果
	// 0xBFEE_009c audio[1]  音效2  Game Over
	//                                             游戏2: 拳皇
	// 0xBFEE_00A0 audio[2]  音效3  轻拳轻脚男受击
	// 0xBFEE_00A4 audio[3]  音效4  重拳重脚男受击
	// 0xBFEE_00A8 audio[4]  音效5  轻拳轻脚女受击
	// 0xBFEE_00AC audio[5]  音效6  重拳重脚女受击
	// 0xBFEE_00B0 audio[6]  音效7  防御成功
	// 0xBFEE_00B4 audio[7]  音效8  男受击
	// 0xBFEE_00B8 audio[8]  音效9  女受击
	// 0xBFEE_00BC audio[9]  音效10 男技能
	// 0xBFEE_00C0 audio[10] 音效11 女技能
	// 0xBFEE_00C4 audio[11] 音效12 3.2.1.Ready Go
	// 0xBFEE_00C8 audio[12] 音效13 K.O.

	volatile unsigned int test_x;	  // 0xBFEE_00CC
	volatile unsigned int test_y;	  // 0xBFEE_00D0
	volatile unsigned int test_z;	  // 0xBFEE_00D4
	volatile unsigned int score1;	  // 0xBFEE_00D8
	volatile unsigned int score2;	  // 0xBFEE_00DC
	volatile unsigned int score3;	  // 0xBFEE_00E0
	volatile unsigned int score4;	  // 0xBFEE_00E4
	volatile unsigned int key_output; // 0xBFEE_00E8

} GameType;

#define LS1C102_Game_BASE          0xBFEF0000      // 游戏控制寄存器基地址

#define Game ((GameType *)LS1C102_Game_BASE)



#ifdef __cplusplus
}
#endif 

#endif // SOC_LS1C102_H_


