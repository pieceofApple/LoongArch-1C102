#include "my_delay.h"
#include "type.h"
#include "soc_gpio.h"

#define RED  	0xf800
#define GREEN	0x07e0
#define BLUE 	0x001f
#define WHITE	0xffff
#define BLACK	0x0000
#define YELLOW  0xFFE0
#define GRAY0   0xEF7D   	    //灰色0 3165 00110 001011 00101
#define GRAY1   0x8410      	//灰色1      00000 000000 00000
#define GRAY2   0x4208      	//灰色2  1111111111011111

//液晶控制口置初始化操作语句宏定义
#define LCD_CS           gpio_init(35, 1)//M15 B15_L24_P     //CS连CS---->片选脚，低有效：低选中
#define LCD_RS           gpio_init(36, 1)//C17 B16_L12_N     //RS连DC---->读写控制，1：传输数据；0：传输命令
#define LCD_SDA          gpio_init(37, 1)//M16 B15_L24_N     //SDA连SDA-->SDA
#define LCD_SCL          gpio_init(19, 1)//D16 B16L5N        //SCL连SCL-->SCLK
#define LCD_RST          gpio_init(20, 1)//D19 B16L14N RES  //RST连RES-->RESET，低有效：低电平复位，高电平工作
#define LCD_LED          gpio_init(34, 1)//D17 B16_L12_P     //LED连BL--->控制背光开关，可悬空

//液晶控制口置1操作语句宏定义
#define	LCD_CS_SET  	 gpio_write(35  , 1)
#define	LCD_RS_SET  	 gpio_write(36 , 1)
#define	LCD_SDA_SET  	 gpio_write(37 , 1)
#define	LCD_SCL_SET  	 gpio_write(19 , 1)
#define	LCD_RST_SET  	 gpio_write(20 , 1)
#define	LCD_LED_SET  	 gpio_write(34 , 1)

//液晶控制口置0操作语句宏定义
#define	LCD_CS_CLR  	 gpio_write(35  , 0)
#define	LCD_RS_CLR  	 gpio_write(36 , 0)
#define	LCD_SDA_CLR  	 gpio_write(37 , 0)
#define	LCD_SCL_CLR  	 gpio_write(19 , 0)
#define	LCD_RST_CLR  	 gpio_write(20 , 0)
#define	LCD_LED_CLR  	 gpio_write(34 , 0)



void LCD_GPIO_Init(void);
void Lcd_WriteIndex(u8 Index);
void Lcd_WriteData(u8 Data);
void Lcd_WriteReg(u8 Index,u8 Data);
void Lcd_Reset(void);
void Lcd_Init(void);
void Lcd_Clear(u16 Color);
void Lcd_SetXY(u16 x,u16 y);
void Gui_DrawPoint(u16 x,u16 y,u16 Data);
unsigned int Lcd_ReadPoint(u16 x,u16 y);
void Lcd_SetRegion(u16 x_start,u16 y_start,u16 x_end,u16 y_end);
void LCD_WriteData_16Bit(u16 Data);
void Lcd_block(u8 x0,u8 y0,u8 x1,u8 y1,u16 Color);

