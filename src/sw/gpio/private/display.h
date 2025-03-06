#include "GUI.h"
#include "Lcd_Driver.h"

/********界面显示************/
void menu_display()
{
    Lcd_Clear(WHITE);
    Gui_DrawFont_GBK16(5,30,BLACK,GRAY0,"FRE:");
    Gui_DrawFont_GBK16(5,60,BLACK,GRAY0,"Vpp:");
    Gui_DrawFont_GBK16(5,90,BLACK,GRAY0,"Vrms:");
    Lcd_block(80,0,160,128,GRAY2);
    Gui_DrawLine(80, 64,160, 64,RED);
    Gui_DrawLine(122, 0,122, 128,RED);
}

void int_to_str(unsigned int num, unsigned char *str) {
    // 定义一个字符指针 p，指向字符串的末尾
    unsigned char *p = str;
    // 定义一个字符数组 buf，用于存储转换后的字符串
    unsigned char buf[20];
    int i = 0;
    // 将数字不断除以 10，直到商为 0
    do {
        buf[i++] = num % 10 + '0';
        num /= 10;
    } while (num != 0);
    // 将 buf 中的字符从末尾开始逐个复制到字符串中
    while (i > 0) {
        *p++ = buf[--i];
    }
    // 字符串末尾添加一个 null 字符
    *p = '\0';
}
