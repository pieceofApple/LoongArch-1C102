`timescale  1ns/1ns
////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/03/15
// Module Name   : vga_ctrl
// Project Name  : vga_rom_pic_jump
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : VGA控制模块
// 
// Revision      : V1.0
// Additional Comments:该部分代码主要参考野火的公开文档 同时根据我们自己的需求对部分基础操作函数进行了优化
////////////////////////////////////////////////////////////////////////

module  vga_ctrl
(
    input   wire            vga_clk     ,   //输入工作时钟,频率25MHz
    input   wire            sys_rst_n   ,   //输入复位信号,低电平有效
    input   wire    [15:0]  pix_data    ,   //输入像素点色彩信息

    output  wire    [9:0]   pix_x       ,   //输出有效显示区域像素点X轴坐标
    output  wire    [9:0]   pix_y       ,   //输出有效显示区域像素点Y轴坐标
    output  wire    [9:0]   pix_x_2       ,   //输出有效显示区域像素点X轴坐标
    output  wire    [9:0]   pix_y_2       ,   //输出有效显示区域像素点Y轴坐标
    output  wire            hsync       ,   //输出行同步信号
    output  wire            vsync       ,   //输出场同步信号
    output  wire            pix_data_req,
    output  wire            pix_data_req_2,
    output  wire    [15:0]  rgb             //输出像素点色彩信息

);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//

//parameter define
parameter H_SYNC    =   10'd96  ,   //行同步
          H_BACK    =   10'd40  ,   //行时序后沿
          H_LEFT    =   10'd8   ,   //行时序左边框
          H_VALID   =   10'd640 ,   //行有效数据
          H_RIGHT   =   10'd8   ,   //行时序右边框
          H_FRONT   =   10'd8   ,   //行时序前沿
          H_TOTAL   =   10'd800 ;   //行扫描周期
parameter V_SYNC    =   10'd2   ,   //场同步
          V_BACK    =   10'd25  ,   //场时序后沿
          V_TOP     =   10'd8   ,   //场时序左边框
          V_VALID   =   10'd480 ,   //场有效数据
          V_BOTTOM  =   10'd8   ,   //场时序右边框
          V_FRONT   =   10'd2   ,   //场时序前沿
          V_TOTAL   =   10'd525 ;   //场扫描周期
parameter LENGTH_W  =   10'd200 ,   //白框长度
          WIDE_W    =   10'd200 ;   //白框宽度

//wire  define
wire            rgb_valid       ;   //VGA有效显示区域
wire            pix_data_req    ;   //像素点色彩信息请求信号

//reg   define
reg     [9:0]   cnt_h           ;   //行同步信号计数器
reg     [9:0]   cnt_v           ;   //场同步信号计数器

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//

//cnt_h:行同步信号计数器
always@(posedge vga_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_h   <=  10'd0   ;
    else    if(cnt_h == H_TOTAL - 1'd1)
        cnt_h   <=  10'd0   ;
    else
        cnt_h   <=  cnt_h + 1'd1   ;

//hsync:行同步信号
assign  hsync = (cnt_h  <=  H_SYNC - 1'd1) ? 1'b1 : 1'b0  ;

//cnt_v:场同步信号计数器
always@(posedge vga_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_v   <=  10'd0 ;
    else    if((cnt_v == V_TOTAL - 1'd1) &&  (cnt_h == H_TOTAL-1'd1))
        cnt_v   <=  10'd0 ;
    else    if(cnt_h == H_TOTAL - 1'd1)
        cnt_v   <=  cnt_v + 1'd1 ;
    else
        cnt_v   <=  cnt_v ;

//vsync:场同步信号
assign  vsync = (cnt_v  <=  V_SYNC - 1'd1) ? 1'b1 : 1'b0  ;

//rgb_valid:VGA有效显示区域
assign  rgb_valid = (((cnt_h >= H_SYNC + H_BACK + H_LEFT)
                    && (cnt_h < H_SYNC + H_BACK + H_LEFT + H_VALID))
                    &&((cnt_v >= V_SYNC + V_BACK + V_TOP)
                    && (cnt_v < V_SYNC + V_BACK + V_TOP + V_VALID)))
                    ? 1'b1 : 1'b0;

//pix_data_req:像素点色彩信息请求信号,超前rgb_valid信号一个时钟周期
assign  pix_data_req = (((cnt_h >= H_SYNC + H_BACK + H_LEFT - 1'b1)
                    && (cnt_h < H_SYNC + H_BACK + H_LEFT + H_VALID - 1'b1))
                    &&((cnt_v >= V_SYNC + V_BACK + V_TOP)
                    && (cnt_v < V_SYNC + V_BACK + V_TOP + V_VALID)))
                    ? 1'b1 : 1'b0;

//pix_x,pix_y:VGA有效显示区域像素点坐标
assign  pix_x = (pix_data_req == 1'b1)
                ? (cnt_h - (H_SYNC + H_BACK + H_LEFT - 1'b1)) : 10'h3ff;
assign  pix_y = (pix_data_req == 1'b1)
                ? (cnt_v - (V_SYNC + V_BACK + V_TOP)) : 10'h3ff;




//pix_data_req:像素点色彩信息请求信号,超前rgb_valid信号两个时钟周期
assign  pix_data_req_2 = (((cnt_h >= H_SYNC + H_BACK + H_LEFT - 2'd2)
                    && (cnt_h < H_SYNC + H_BACK + H_LEFT + H_VALID - 2'd2))
                    &&((cnt_v >= V_SYNC + V_BACK + V_TOP)
                    && (cnt_v < V_SYNC + V_BACK + V_TOP + V_VALID)))
                    ? 1'b1 : 1'b0;


//pix_x,pix_y:VGA有效显示区域像素点坐标
assign  pix_x_2 = cnt_h;
assign  pix_y_2 = cnt_v;


//rgb:输出像素点色彩信息
assign  rgb = (rgb_valid == 1'b1) ? pix_data : 16'b0 ;

endmodule

