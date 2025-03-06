#include "Lcd_Driver.h"
#include "LCD_Config.h"
#include "my_delay.h"
#include "soc_gpio.h"

//Һ��IO��ʼ������
void LCD_GPIO_Init(void)
{
    LCD_SDA;
    LCD_RS ;
    LCD_CS   ;
    LCD_RST ;
    LCD_SCL  ;
    LCD_LED  ;
    delay_ms(1000);
}
//��SPI���ߴ���һ��8λ����
void  SPI_WriteData(u8 Data)
{
	unsigned char i=0;
	for(i=8;i>0;i--)
	{
	  if(Data&0x80)	
	  LCD_SDA_SET; //�������
      else LCD_SDA_CLR;
	   
      LCD_SCL_CLR;       
      LCD_SCL_SET;
      Data<<=1; 
	}
}

//��Һ����дһ��8λָ��
void Lcd_WriteIndex(u8 Index)
{
   //SPI д����ʱ��ʼ
   LCD_CS_CLR;
   LCD_RS_CLR;
	 SPI_WriteData(Index);
   LCD_CS_SET;
}

//��Һ����дһ��8λ����
void Lcd_WriteData(u8 Data)
{
   LCD_CS_CLR;
   LCD_RS_SET;
   SPI_WriteData(Data);
   LCD_CS_SET; 
}
//��Һ����дһ��16λ����
void LCD_WriteData_16Bit(u16 Data)
{
   LCD_CS_CLR;
   LCD_RS_SET;
	 SPI_WriteData(Data>>8); 	//д���8λ����
	 SPI_WriteData(Data); 			//д���8λ����
   LCD_CS_SET; 
}

void Lcd_WriteReg(u8 Index,u8 Data)
{
	Lcd_WriteIndex(Index);
  Lcd_WriteData(Data);
}

void Lcd_Reset(void)
{
	LCD_RST_CLR;
	delay_ms(100);
	LCD_RST_SET;
	delay_ms(50);
}

//LCD Init For 1.44Inch LCD Panel with ST7735R.
void Lcd_Init()
{
    LCD_GPIO_Init();
    Lcd_Reset();
    delay_ms(50);
    Lcd_WriteIndex(0x11);//Sleep exit
    delay_ms(50);

    //ST7735R Frame Rate
    Lcd_WriteIndex(0xB1);
    Lcd_WriteData(0x01); Lcd_WriteData(0x2C); Lcd_WriteData(0x2D);
    Lcd_WriteIndex(0xB2);
    Lcd_WriteData(0x01); Lcd_WriteData(0x2C); Lcd_WriteData(0x2D);
    Lcd_WriteIndex(0xB3);
    Lcd_WriteData(0x01); Lcd_WriteData(0x2C); Lcd_WriteData(0x2D);
    Lcd_WriteData(0x01); Lcd_WriteData(0x2C); Lcd_WriteData(0x2D);

    Lcd_WriteIndex(0xB4); //Column inversion
    Lcd_WriteData(0x07);

    //ST7735R Power Sequence
    Lcd_WriteIndex(0xC0);
    Lcd_WriteData(0xA2); Lcd_WriteData(0x02); Lcd_WriteData(0x84);
    Lcd_WriteIndex(0xC1); Lcd_WriteData(0xC5);
    Lcd_WriteIndex(0xC2);
    Lcd_WriteData(0x0A); Lcd_WriteData(0x00);
    Lcd_WriteIndex(0xC3);
    Lcd_WriteData(0x8A); Lcd_WriteData(0x2A);
    Lcd_WriteIndex(0xC4);
    Lcd_WriteData(0x8A); Lcd_WriteData(0xEE);

    Lcd_WriteIndex(0xC5); //VCOM
    Lcd_WriteData(0x0E);

    //��Ļ��������δ���    �ѽ�� д��0x60
    Lcd_WriteIndex(0x36); //MX, MY, RGB mode
    //Lcd_WriteData(0xC0);  //����
    Lcd_WriteData(0x60);    //����

    //ST7735R Gamma Sequence
    Lcd_WriteIndex(0xe0);
    Lcd_WriteData(0x0f); Lcd_WriteData(0x1a);
    Lcd_WriteData(0x0f); Lcd_WriteData(0x18);
    Lcd_WriteData(0x2f); Lcd_WriteData(0x28);
    Lcd_WriteData(0x20); Lcd_WriteData(0x22);
    Lcd_WriteData(0x1f); Lcd_WriteData(0x1b);
    Lcd_WriteData(0x23); Lcd_WriteData(0x37); Lcd_WriteData(0x00);

    Lcd_WriteData(0x07);
    Lcd_WriteData(0x02); Lcd_WriteData(0x10);
    Lcd_WriteIndex(0xe1);
    Lcd_WriteData(0x0f); Lcd_WriteData(0x1b);
    Lcd_WriteData(0x0f); Lcd_WriteData(0x17);
    Lcd_WriteData(0x33); Lcd_WriteData(0x2c);
    Lcd_WriteData(0x29); Lcd_WriteData(0x2e);
    Lcd_WriteData(0x30); Lcd_WriteData(0x30);
    Lcd_WriteData(0x39); Lcd_WriteData(0x3f);
    Lcd_WriteData(0x00); Lcd_WriteData(0x07);
    Lcd_WriteData(0x03); Lcd_WriteData(0x10);

    Lcd_WriteIndex(0x2a);
    Lcd_WriteData(0x00);Lcd_WriteData(0x00);
    Lcd_WriteData(0x00);Lcd_WriteData(0x7f);
    Lcd_WriteIndex(0x2b);
    Lcd_WriteData(0x00);Lcd_WriteData(0x00);
    Lcd_WriteData(0x00);Lcd_WriteData(0x9f);

    Lcd_WriteIndex(0xF0); //Enable test command
    Lcd_WriteData(0x01);
    Lcd_WriteIndex(0xF6); //Disable ram power save mode
    Lcd_WriteData(0x00);

    Lcd_WriteIndex(0x3A); //65k mode
    Lcd_WriteData(0x05);

    Lcd_WriteIndex(0x29);//Display on

    

    Lcd_Clear(WHITE);
    delay_ms(3);
}

/*************************************************
��������LCD_Set_Region
���ܣ�����lcd��ʾ�����ڴ�����д�������Զ�����
��ڲ�����xy�����յ�
����ֵ����
*************************************************/
void Lcd_SetRegion(u16 x_start,u16 y_start,u16 x_end,u16 y_end)
{		
	Lcd_WriteIndex(0x2a);
	Lcd_WriteData(0x00);
	Lcd_WriteData(x_start);//�˴��ɵ���0��ֵ�����Ե����
	Lcd_WriteData(0x00);
	Lcd_WriteData(x_end);

	Lcd_WriteIndex(0x2b);
	Lcd_WriteData(0x00);
	Lcd_WriteData(y_start);
	Lcd_WriteData(0x00);
	Lcd_WriteData(y_end);
	
	Lcd_WriteIndex(0x2c);
}

/*************************************************
��������LCD_Set_XY
���ܣ�����lcd��ʾ��ʼ��
��ڲ�����xy����
����ֵ����
*************************************************/
void Lcd_SetXY(u16 x,u16 y)
{
  	Lcd_SetRegion(x,y,x,y);
}

	
/*************************************************
��������LCD_DrawPoint
���ܣ���һ����
��ڲ�������
����ֵ����
*************************************************/
void Gui_DrawPoint(u16 x,u16 y,u16 Data)
{
	Lcd_SetRegion(x,y,x+1,y+1);
	LCD_WriteData_16Bit(Data);

}    

/*****************************************
 �������ܣ���TFTĳһ�����ɫ                          
 ���ڲ�����color  ����ɫֵ                                 
******************************************/
unsigned int Lcd_ReadPoint(u16 x,u16 y)
{
  unsigned int Data;
  Lcd_SetXY(x,y);

  //Lcd_ReadData();//���������ֽ�
  //Data=Lcd_ReadData();
  Lcd_WriteData(Data);
  return Data;
}
/*************************************************
��������Lcd_Clear
���ܣ�ȫ����������
��ڲ����������ɫCOLOR
����ֵ����
*************************************************/
void Lcd_Clear(u16 Color)               
{	
   unsigned int i,m;
   Lcd_SetRegion(0,0,X_MAX_PIXEL-1,Y_MAX_PIXEL-1);
   Lcd_WriteIndex(0x2C);
   for(i=0;i<X_MAX_PIXEL;i++)
    for(m=0;m<Y_MAX_PIXEL;m++)
    {	
	  	LCD_WriteData_16Bit(Color);
    }   
}
void Lcd_block(u8 x0,u8 y0,u8 x1,u8 y1,u16 Color)
{
    unsigned int i,m;
    Lcd_SetRegion(x0,y0,x1,y1);
    Lcd_WriteIndex(0x2C);
    for(i=0;i<X_MAX_PIXEL;i++)
     for(m=0;m<Y_MAX_PIXEL;m++)
     {
         LCD_WriteData_16Bit(Color);
     }
}

