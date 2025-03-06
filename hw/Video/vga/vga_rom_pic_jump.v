`timescale  1ns/1ns
////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/03/15
// Module Name   : vga_rom_pic_jump
// Project Name  : vga_rom_pic_jump
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : vga_rom_pic_jump顶层模块
// 
// Revision      : V1.0
// Additional Comments:该部分代码主要参考野火的公开文档 同时根据我们自己的需求对部分基础操作函数进行了优化
////////////////////////////////////////////////////////////////////////

module  vga_rom_pic_jump
(
    input   wire            sys_clk             ,   //输入工作时钟,频率50MHz
    input   wire            sys_rst_n           ,   //输入复位信号,低电平有效

    input   wire    [9:0]   hand_x              ,   //手部x坐标
    input   wire    [9:0]   hand_y              ,   //手部y坐标

    input   wire    [15:0]  back_photo_rgb      ,
    output  wire            back_photo_req      ,

    input   wire    [15:0]  sd_photo_rgb_1      ,
    output  wire            sdram_rd_en         ,
    output  wire    [20:0]  sdram_addr_out      ,
    output  wire    [20:0]  sdram_addr_out_end  ,
    input   wire    [7:0]   photo_load_cnt      ,
    output  wire            sdram_rst           ,


    input   wire    [5:0]   GAME_SWITCH         ,
    input   wire            back                ,
    output  wire            GAME_OVER           ,

    input   wire    [9:0]   figure_x_1          ,
    input   wire    [9:0]   figure_y_1          ,
    input   wire    [9:0]   figure_x_2          ,
    input   wire    [9:0]   figure_y_2          ,
    input   wire    [9:0]   figure_state_1      ,
    input   wire    [9:0]   figure_state_2      ,
    input   wire            figure_toward_1     ,
    input   wire            figure_toward_2     ,

    input   wire    [6:0]   blood_1             ,
    input   wire    [6:0]   blood_2             ,
    input   wire    [6:0]   energy_1            ,
    input   wire    [6:0]   energy_2            ,
    input   wire    [1:0]   energy_count_1      ,
    input   wire    [1:0]   energy_count_2      ,

    output  wire            hsync               ,   //输出行同步信号
    output  wire            vsync               ,   //输出场同步信号
    output  wire    [15:0]  rgb                     //输出像素信息

);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//

//wire define
wire            vga_clk   ;   //VGA工作时钟,频率25MHz
wire            locked    ;   //PLL locked信号
wire            rst_n     ;   //VGA模块复位信号
wire    [9:0]   pix_x     ;   //VGA有效显示区域X轴坐标
wire    [9:0]   pix_y     ;   //VGA有效显示区域Y轴坐标
wire    [9:0]   pix_x_2   ;   //VGA有效显示区域X轴坐标
wire    [9:0]   pix_y_2   ;   //VGA有效显示区域Y轴坐标
wire    [15:0]  pix_data;     //VGA像素点色彩信息

wire VGA_EN;

//rst_n:VGA模块复位信号
assign  rst_n = (sys_rst_n & locked);

//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//

//------------- pll_vga_inst -------------
pll_vga pll_vga_inst(
    .lock(locked), //output lock
    .clkout0(vga_clk), //output clkout0
    .clkin(sys_clk), //input clkin
    .reset(~sys_rst_n ) //input reset
);

//------------- vga_ctrl_inst VGA控制模块-------------
vga_ctrl  vga_ctrl_inst(
    .vga_clk        (vga_clk    ),  //输入工作时钟,频率25MHz,1bit
    .sys_rst_n      (rst_n      ),  //输入复位信号,低电平有效,1bit
    .pix_data       (pix_data   ),  //输入像素点色彩信息,16bit

    .pix_x          (pix_x      ),  //输出VGA有效显示区域像素点X轴坐标,10bit
    .pix_y          (pix_y      ),  //输出VGA有效显示区域像素点Y轴坐标,10bit

    .pix_x_2        (pix_x_2      ),  //输出VGA有效显示区域像素点X轴坐标,10bit
    .pix_y_2        (pix_y_2      ),  //输出VGA有效显示区域像素点Y轴坐标,10bit
    .hsync          (hsync      ),  //输出行同步信号,1bit
    .vsync          (vsync      ),  //输出场同步信号,1bit
    .pix_data_req   (VGA_EN    ),
    .rgb            (rgb        )   //输出像素点色彩信息,16bit
);

//------------- vga_pic_inst 图像数据生成模块-------------
vga_pic vga_pic_inst(
    .vga_clk            (vga_clk    ),  //输入工作时钟,频率25MHz,1bit
    .sys_clk            (sys_clk    ),
    .sys_rst_n          (rst_n      ),  //输入复位信号,低电平有效,1bit
    .pix_x              (pix_x      ),  //输入VGA有效显示区域像素点X轴坐标,10bit
    .pix_y              (pix_y      ),  //输入VGA有效显示区域像素点Y轴坐标,10bit
    .pix_x_2            (pix_x_2      ),  //输入VGA有效显示区域像素点X轴坐标,10bit
    .pix_y_2            (pix_y_2      ),  //输入VGA有效显示区域像素点Y轴坐标,10bit
    .VGA_EN             (VGA_EN     ),

    .back_photo_req(back_photo_req),          //背景
    .back_photo_rgb(back_photo_rgb),

    .sd_photo_rgb_1 (sd_photo_rgb_1),
    .sdram_rd_en    (sdram_rd_en),
    .sdram_addr_out (sdram_addr_out),
    .sdram_addr_out_end(sdram_addr_out_end),
    .photo_load_cnt  (photo_load_cnt),
    .sdram_rst      (sdram_rst),
    
    .GAME_SWITCH    (GAME_SWITCH    ),        //游戏结束画面控制
    .back           (back           ),
    .GAME_OVER      (GAME_OVER      ),

    .hand_x         (hand_x     ),            //摄像头坐标
    .hand_y         (hand_y     ),


    .figure_x_1_1     (figure_x_1),
    .figure_y_1_1     (figure_y_1),
    .figure_x_2_1     (figure_x_2),
    .figure_y_2_1     (figure_y_2),
    .figure_state_1_1 (figure_state_1),
    .figure_state_2_1 (figure_state_2),
    .figure_toward_1_1(figure_toward_1),
    .figure_toward_2_1(figure_toward_2),
    .blood_1(blood_1),
    .blood_2(blood_2),
    .energy_1(energy_1),
    .energy_2(energy_2),
    .energy_count_1(energy_count_1),
    .energy_count_2(energy_count_2),

    .pix_data_out   (pix_data   )   //输出像素点色彩信息,16bit

);


endmodule