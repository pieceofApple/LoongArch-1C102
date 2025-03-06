1.  修改了include/路径下的ls1x.h文件中spi和timer的基地址

2.  private/ls1c102_ptimer 是定时器相关的配置
    在1c102_Interrupt 这边写中断需要处理的东西

3.  第一步 将.bin文件转化成.coe文件  .bin文件在sw/build/目录下
    cd F:\a_loongarch\1C103\1C102\src\sw\spi_W25QXX\build
    bin2coe -i 1c102_demo.bin -w 32 -o lcd.coe

