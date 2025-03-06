#include "GUI.h"
#include "Lcd_Driver.h"

/********������ʾ************/
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
    // ����һ���ַ�ָ�� p��ָ���ַ�����ĩβ
    unsigned char *p = str;
    // ����һ���ַ����� buf�����ڴ洢ת������ַ���
    unsigned char buf[20];
    int i = 0;
    // �����ֲ��ϳ��� 10��ֱ����Ϊ 0
    do {
        buf[i++] = num % 10 + '0';
        num /= 10;
    } while (num != 0);
    // �� buf �е��ַ���ĩβ��ʼ������Ƶ��ַ�����
    while (i > 0) {
        *p++ = buf[--i];
    }
    // �ַ���ĩβ���һ�� null �ַ�
    *p = '\0';
}
