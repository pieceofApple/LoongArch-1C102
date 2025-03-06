//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved	                               
//----------------------------------------------------------------------------------------
// File name:           vga_driver
// Last modified Date:  2018/1/30 11:12:36
// Last Version:        V1.1
// Descriptions:        vga驱动
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/1/29 10:55:56
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
// Modified by:		    正点原子
// Modified date:	    2018/1/30 11:12:36
// Version:			    V1.1
// Descriptions:	    vga驱动
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

/* VGA参数配置表
************    clk         H_SYNC      H_BACK      H_DISP      H_FRONT     H_TOTAL         V_SYNC      V_BACK      V_DISP      V_FRONT     V_TOTAL     *
640x480@60Hz    25.2MHz     96          48          640         16          800             2           33          480         10          525     *
800x600@60Hz    40MHz       128         88          800         40          1056            4           23          600         1           628     *
1024x768@60Hz   65MHz       136         160         1024        24          1344            6           29          768         3           806     *
1280x720@60Hz   74.25MHz    40          220         1280        110         1650            5           20          720         5           750     *
1280x1024@60Hz  108MHz      112         248         1280        48          1688            3           38          1024        1           1066    *
1920x1080@60Hz  148.5MHz    44          148         1920        88          2200            5           36          1080        4           1125    *
*/  

module vga_driver(
    input           vga_clk,      //VGA驱动时钟
    input           sys_rst_n,    //复位信号
    //input           rd_photo,    //读图信号（1为读图中）
    //VGA接口                          
    output          vga_hs,       //行同步信号
    output          vga_vs,       //场同步信号
    output  [15:0]  vga_rgb,      //红绿蓝三原色输出
    output          vga_en,

    input   [15:0]  pixel_data,   //像素点数据
    output          data_req  ,   //请求像素点颜色数据输入 
    output  [10:0]  pixel_xpos,   //像素点横坐标
    output  [10:0]  pixel_ypos    //像素点纵坐标    
    );                             

//parameter define  
parameter  PHOTO_NUM   =  10'd96; 


/*
//1280*1024 60FPS_108MHz
parameter  H_SYNC   =  112;    //行同步
parameter  H_BACK   =  248;    //行显示后沿
parameter  H_DISP   =  1280;   //行有效数据
parameter  H_FRONT  =  48;    //行显示前沿
parameter  H_TOTAL  =  1688;   //行扫描周期

parameter  V_SYNC   =  3;     //场同步
parameter  V_BACK   =  38;    //场显示后沿
parameter  V_DISP   =  1024;   //场有效数据
parameter  V_FRONT  =  1;    //场显示前沿
parameter  V_TOTAL  =  1066;   //场扫描周期
*/

//640*480 60FPS_25MHz
parameter  H_SYNC   =  10'd96;    //行同步
parameter  H_BACK   =  10'd48;    //行显示后沿
parameter  H_DISP   =  10'd640;   //行有效数据
parameter  H_FRONT  =  10'd16;    //行显示前沿
parameter  H_TOTAL  =  10'd800;   //行扫描周期

parameter  V_SYNC   =  10'd2;     //场同步
parameter  V_BACK   =  10'd33;    //场显示后沿
parameter  V_DISP   =  10'd480;   //场有效数据
parameter  V_FRONT  =  10'd10;    //场显示前沿
parameter  V_TOTAL  =  10'd525;   //场扫描周期

/*
//1024*768 60FPS_65MHz
parameter  H_SYNC   =  11'd136;   //行同步     
parameter  H_BACK   =  11'd160;   //行显示后沿
parameter  H_DISP   =  11'd1024;  //行有效数据
parameter  H_FRONT  =  11'd24;    //行显示前沿
parameter  H_TOTAL  =  11'd1344;  //行扫描周期  注意位宽长度,需要11位的位宽

parameter  V_SYNC   =  11'd6;     //场同步
parameter  V_BACK   =  11'd29;    //场显示后沿
parameter  V_DISP   =  11'd768;   //场有效数据
parameter  V_FRONT  =  11'd3;     //场显示前沿
parameter  V_TOTAL  =  11'd806;   //场扫描周期
*/
//reg define                                     
reg  [10:0] cnt_h;               
reg  [10:0] cnt_v;

//wire define
wire       vga_en;

//*****************************************************
//**                    main code
//*****************************************************
//VGA行场同步信号
assign vga_hs  = (cnt_h <= H_SYNC - 1'b1) ? 1'b0 : 1'b1;
assign vga_vs  = (cnt_v <= V_SYNC - 1'b1) ? 1'b0 : 1'b1;

//使能RGB565数据输出
assign vga_en  = (((cnt_h >= H_SYNC+H_BACK) && (cnt_h < H_SYNC+H_BACK+H_DISP))
                 &&((cnt_v >= V_SYNC+V_BACK) && (cnt_v < V_SYNC+V_BACK+V_DISP)))
                 ?  1'b1 : 1'b0;
                 
//RGB565数据输出                 
assign vga_rgb = vga_en ? pixel_data : 16'd0;

//请求像素点颜色数据输入                
assign data_req = (((cnt_h >= H_SYNC+H_BACK-1'b1) && (cnt_h < H_SYNC+H_BACK+H_DISP-1'b1))
                  && ((cnt_v >= V_SYNC+V_BACK) && (cnt_v < V_SYNC+V_BACK+V_DISP)))
                  ?  1'b1 : 1'b0;

//像素点坐标                
assign pixel_xpos = data_req ? (cnt_h - (H_SYNC + H_BACK - 1'b1)) : 10'd0;
assign pixel_ypos = data_req ? (cnt_v - (V_SYNC + V_BACK - 1'b1)) : 10'd0;

//行计数器对像素时钟计数
always @(posedge vga_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)
        cnt_h <= 10'd0;                                  
    else begin
        if(cnt_h < H_TOTAL - 1'b1)                                               
            cnt_h <= cnt_h + 1'b1;                               
        else 
            cnt_h <= 10'd0;  
    end
end

//场计数器对行计数
always @(posedge vga_clk or negedge sys_rst_n) begin         
    if (!sys_rst_n)
        cnt_v <= 10'd0;                                  
    else if(cnt_h == H_TOTAL - 1'b1) begin
        if(cnt_v < V_TOTAL - 1'b1)                                               
            cnt_v <= cnt_v + 1'b1;                               
        else 
            cnt_v <= 10'd0;  
    end
end

endmodule 