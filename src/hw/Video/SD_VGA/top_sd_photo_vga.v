//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           top_sd_photo_vga
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SD VGA图片显示实验
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/3/18 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

// sd卡一次最少读512个字节
// 读写的突发长度 应该改成512一次 先试一试256
//写入单个BLOCK共512个字节 = 256 * 16bit  好像又没有问题

//sd卡的时钟问题 ，不能用50，用12.5M

module top_sd_photo_vga(
    input                 sys_clk     ,  //系统时钟
    input                 sys_rst_n   ,  //系统复位，低电平有效

    //SD卡接口               
    input                 sd_miso     ,  //SD卡SPI串行输入数据信号
    output                sd_clk      ,  //SD卡SPI时钟信号
    output                sd_cs       ,  //SD卡SPI片选信号
    output                sd_mosi     ,  //SD卡SPI串行输出数据信号
    //用户控制端口 --------------------------------------
    output                      sdram_init_done         , //SDRAM 初始化完成标志
    input                       sdram_pingpang_en       , //SDRAM 乒乓操作使能，1开0关
    //SDRAM芯片接口 -------------------------------------
    output                      sdram_clk               , //SDRAM 芯片时钟
    output                      sdram_cke               , //SDRAM 时钟有效
    output                      sdram_cs_n              , //SDRAM 片选
    output                      sdram_ras_n             , //SDRAM 行有效
    output                      sdram_cas_n             , //SDRAM 列有效
    output                      sdram_we_n              , //SDRAM 写有效
    output      [ 1:0]          sdram_ba                , //SDRAM Bank地址
    output      [12:0]          sdram_addr_extern              , //SDRAM 行/列地址
    inout       [15:0]          sdram_dq                , //SDRAM 数据
    output      [ 1:0]          sdram_dqm               ,  //SDRAM 数据掩码

    input                 sd_rd_en    ,
    output   [15:0]       sd_photo_rgb,

    output   [15:0]       sd_photo_rgb_1,
    input                 sdram_rd_en,
    input    [20:0]       sdram_addr_out,
    input    [20:0]       sdram_addr_out_end,
    input                 sdram_rst,
    output   [7:0]        photo_load_cnt,

    input    [5:0]        GAME_SWITCH,
    input                 GAME_OVER

    );

//parameter define
parameter  PHOTO_H_PIXEL    = 20'd640     ;  //设置SDRAM缓存大小
parameter  PHOTO_V_PIXEL    = 20'd480     ;  //设置SDRAM缓存大小
parameter  PHOTO_TOTAL_PIX  = 21'd307200  ;
parameter  PHOTO_H_1        = 20'd128     ;  //设置SDRAM缓存大小
parameter  PHOTO_V_1        = 20'd190     ;  //设置SDRAM缓存大小
parameter  PIC_TOTAL_PIX    = 21'd24320   ;
parameter  PHOTO_H_2        = 20'd256     ;  //设置SDRAM缓存大小
parameter  PHOTO_V_2        = 20'd190     ;  //设置SDRAM缓存大小
parameter  PHOTO_NUM        = 8'd46       ;
//wire define
wire                  clk_100m        ;  //100mhz时钟,SDRAM操作时钟
wire                  clk_100m_shift  ;  //100mhz时钟,SDRAM相位偏移时钟
wire                  clk_12m         ;  //12.5mhz时钟
wire                  clk_12m_180deg  ;  //12.5mhz时钟 偏移180°
wire                  clk_25m         ;
wire                  rst_n           ;
wire                  locked          ;
wire                  sys_init_done   ;  //系统初始化完成
                                      
wire                  sd_rd_start_en  ;  //开始写SD卡数据信号
wire          [31:0]  sd_rd_sec_addr  ;  //读数据扇区地址    
wire                  sd_rd_busy      ;  //读忙信号
wire                  sd_rd_val_en    ;  //数据读取有效使能信号
wire          [15:0]  sd_rd_val_data  ;  //读数据
wire                  sd_init_done    ;  //SD卡初始化完成信号

wire                  wr_en           ;  //sdram_ctrl模块写使能
wire   [15:0]         wr_data         ;  //sdram_ctrl模块写数据
wire                  rd_en           ;  //sdram_ctrl模块读使能
wire   [15:0]         rd_data         ;  //sdram_ctrl模块读数据

wire                  sdram_init_end  ;
//*****************************************************
//**                    main code
//*****************************************************

assign  rst_n = sys_rst_n & locked ;
assign  sys_init_done = sd_init_done & sdram_init_done;  //SD卡和SDRAM都初始化完成
assign  wr_en = sd_rd_val_en;
assign  wr_data = sd_rd_val_data;

//锁相环
pll_sdram_sd_card  u_pll_clk(
        .lock(locked), //output lock
        .clkout0(clk_100m), //output clkout0
        .clkout1(clk_100m_shift), //output clkout1
        .clkout2(clk_12m), //output clkout2
        .clkout3(clk_12m_180deg), //output clkout3
        .clkout4(clk_25m), //output clkout4
        .clkin(sys_clk), //input clkin
        .reset(~sys_rst_n) //input reset
);

//读取SD卡图片
sd_read_photo u_sd_read_photo(
    .clk             (clk_12m),
    //系统初始化完成之后,再开始从SD卡中读取图片
    .rst_n           (rst_n & sys_init_done), 
   // .data_req        (data_req),
    .rd_busy         (sd_rd_busy),
    .rd_start_en     (sd_rd_start_en),
    .rd_sec_addr     (sd_rd_sec_addr),
    .photo_load_cnt  (photo_load_cnt),
    .wr_load         (wr_load),//这个信号好像没什么用
    .GAME_SWITCH     (GAME_SWITCH),
    .GAME_OVER       (GAME_OVER)

    ); 


//SD卡顶层控制模块
sd_ctrl_top_v u_sd_ctrl_top(
    .clk_ref           (clk_12m),
    .clk_ref_180deg    (clk_12m_180deg),
    .rst_n             (rst_n),
    //SD卡接口
    .sd_miso           (sd_miso),
    .sd_clk            (sd_clk),
    .sd_cs             (sd_cs),
    .sd_mosi           (sd_mosi),
    //用户写SD卡接口
    .wr_start_en       (1'b0),               //不需要写入数据,写入接口赋值为0
    .wr_sec_addr       (32'b0),
    .wr_data           (16'b0),
    .wr_busy           (),
    .wr_req            (),
    //用户读SD卡接口
    .rd_start_en       (sd_rd_start_en),
    .rd_sec_addr       (sd_rd_sec_addr),
    .rd_busy           (sd_rd_busy),
    .rd_val_en         (sd_rd_val_en),
    .rd_val_data       (sd_rd_val_data),    
    
    .sd_init_done      (sd_init_done)
    );  
reg [20:0] sdram_addr,sdram_addr_end;
always @(posedge clk_12m or negedge rst_n) begin
    if(rst_n  == 1'b0) begin
        sdram_addr<=0;
        sdram_addr_end<=0;
    end
    //读取的图片个数小于总图片个数 && 正在读sd卡数据
    else if(GAME_SWITCH[1]&&photo_load_cnt&&(photo_load_cnt<=PHOTO_NUM)&&!wr_en) begin
        // sdram_addr<=(photo_load_cnt+4)*PHOTO_H_PIXEL*PHOTO_V_PIXEL;
        // sdram_addr_end<=(photo_load_cnt+5)*PHOTO_H_PIXEL*PHOTO_V_PIXEL;
        sdram_addr<=(photo_load_cnt-1)*PIC_TOTAL_PIX+PHOTO_TOTAL_PIX;
        sdram_addr_end<=(photo_load_cnt)*PIC_TOTAL_PIX+PHOTO_TOTAL_PIX;
    end
    else if((!GAME_SWITCH[1]&&!wr_en)||(GAME_SWITCH[1]&&!photo_load_cnt&&!wr_en)||(GAME_SWITCH[1]&&photo_load_cnt==PHOTO_NUM+1&&!wr_en)||(GAME_OVER&&!wr_en) ) begin
        sdram_addr<=0;
        sdram_addr_end<=PHOTO_TOTAL_PIX;
    end
    else begin
        sdram_addr<=sdram_addr;
        sdram_addr_end<=sdram_addr_end;
    end
end



wire wr_load;


//==========================================================================
//==                        SDRAM
//==========================================================================

parameter   RED     =   16'hF800,   //红色
            ORANGE  =   16'hFC00,   //橙色
            YELLOW  =   16'hFFE0,   //黄色
            GREEN   =   16'h07E0,   //绿色
            CYAN    =   16'h07FF,   //青色
            BLUE    =   16'h001F,   //蓝色
            PURPPLE =   16'hF81F,   //紫色
            BLACK   =   16'h0000,   //黑色
            WHITE   =   16'hFFFF,   //白色
            GRAY    =   16'hD69A;   //灰色
sdram_4port_top u_sdram
(
    .ref_clk                (clk_100m               ),  //SDRAM 控制器参考时钟
    .out_clk                (clk_100m_shift         ),  //用于输出的相位偏移时钟
    .rst_n                  (rst_n              ),  //系统复位
    //通道0 -----------------------------------------
    .ch0_min_addr           (sdram_addr                  ),  //通道0 写SDRAM的起始地址
    .ch0_max_addr           (sdram_addr_end        ),  //通道0 写SDRAM的结束地址
    .ch0_wr_clk             (clk_12m                ),  //通道0 写端口FIFO: 写时钟
    .ch0_wr_req             (wr_en              ),  //通道0 写端口FIFO: 写使能
    .ch0_wr_data            (wr_data            ),  //通道0 写端口FIFO: 写数据
    .ch0_rd_clk             (clk_25m                ),  //通道0 读端口FIFO: 读时钟
    .ch0_rd_req             (sd_rd_en              ),  //通道0 读端口FIFO: 读使能
    .ch0_rd_data            (sd_photo_rgb            ),  //通道0 读端口FIFO: 读数据
    
    //通道1 -----------------------------------------
    .ch1_min_addr           (24'd0                  ),  //通道1 写SDRAM的起始地址
    .ch1_max_addr           (PHOTO_H_PIXEL * PHOTO_V_PIXEL        ),  //通道1 写SDRAM的结束地址
    .ch1_wr_clk             (cmos_pclk              ),  //通道1 写端口FIFO: 写时钟
    .ch1_wr_req             (ch1_wr_en              ),  //通道1 写端口FIFO: 写使能
    .ch1_wr_data            (ch1_wr_data            ),  //通道1 写端口FIFO: 写数据                                   
    .ch1_rd_clk             (clk_25m                ),  //通道1 读端口FIFO: 读时钟
    .ch1_rd_req             (sdram_rd_en              ),  //通道1 读端口FIFO: 读使能
    .ch1_rd_data            (sd_photo_rgb1            ),  //通道1 读端口FIFO: 读数据
    
    //读写设置 --------------------------------------
    .wr_length              (9'd256                ),  //写SDRAM时的数据突发长度
    .wr_load                (~rst_n | wr_load                 ),  //写端口复位: 复位写地址,清空写FIFO
    .rd_length              (9'd256                ),  //写SDRAM时的数据突发长度
    .rd_load                (~rst_n                 ),  //读端口复位: 复位读地址,清空读FIFO
    //用户控制端口 ----------------------------------
    .sdram_init_done        (sdram_init_done        ),  //SDRAM 初始化完成标志
    .sdram_pingpang_en      (1'b0                   ),  //SDRAM 乒乓操作使能，图片0视频1
    //SDRAM 芯片端口 --------------------------------
    .sdram_clk              (sdram_clk              ),  //SDRAM 芯片时钟
    .sdram_cke              (sdram_cke              ),  //SDRAM 时钟有效
    .sdram_cs_n             (sdram_cs_n             ),  //SDRAM 片选
    .sdram_ras_n            (sdram_ras_n            ),  //SDRAM 行有效
    .sdram_cas_n            (sdram_cas_n            ),  //SDRAM 列有效
    .sdram_we_n             (sdram_we_n             ),  //SDRAM 写有效
    .sdram_ba               (sdram_ba               ),  //SDRAM Bank地址
    .sdram_addr             (sdram_addr_extern             ),  //SDRAM 行/列地址
    .sdram_dq               (sdram_dq               ),  //SDRAM 数据
    .sdram_dqm              (sdram_dqm              )   //SDRAM 数据掩码
);

/*
Sdram_Control_4Port Sdram_Control_4Port(
        //  HOST Side
        .CTRL_CLK(clk_100m),    //输入参考时钟，默认100M，如果为其他频率，请修改pll设置
        .SDRAM_CLK(clk_100m_shift),      //SDRAM时钟，默认100M(90°)，如果为其他频率，请修改pll设置
        .RESET_N(rst_n),            //复位输入，低电平复位
        //  FIFO Write Side 1
        .WR1_DATA(wr_data),    //写入端口1的数据输入端16bit
        .WR1(wr_en),     //写入端口1的写使能端，高电平写入
        .WR1_ADDR({3'b0,sdram_addr}),               //写入端口1的写起始地址
        .WR1_MAX_ADDR(sdram_addr_end),     //写入端口1的写入最大地址
        .WR1_LENGTH(9'd256),           //一次性写入数据长度
        .WR1_LOAD(~rst_n||wr_load),
                                    //写入端口1清零请求，高电平清零写入地址和fifo
        .WR1_CLK(clk_12m),      //写入端口1 fifo写入时钟
        .WR1_FULL(),                //写入端口1 fifo写满信号
        .WR1_USE(),                 //写入端口1 fifo已经写入的数据长度
        //不写入端口2
        .WR2_DATA(16'b0),           //写入端口2的数据输入端16bit
        .WR2(1'b0),                 //写入端口2的写使能端，高电平写入
        .WR2_ADDR(21'b0),               //写入端口2的写起始地址
        .WR2_MAX_ADDR(200*200),     //写入端口2的写入最大地址
        .WR2_LENGTH(9'd0),              //一次性写入数据长度 
        .WR2_LOAD(1'b0),            //写入端口2清零请求，高电平清零写入地址和fifo
        .WR2_CLK(1'b0),             //写入端口2 fifo写入时钟
        .WR2_FULL(),                //写入端口2 fifo写满信号
        .WR2_USE(),                 //写入端口2 fifo已经写入的数据长度
        //  FIFO Read Side 1
        .RD1_DATA(sd_photo_rgb),       //读出端口1的数据输出端16bit
        .RD1(sd_rd_en),          //读出端口1的读使能端，高电平读出
        .RD1_ADDR(21'b0),               //读出端口1的读起始地址
        .RD1_MAX_ADDR(PHOTO_H_PIXEL*PHOTO_V_PIXEL),     //读出端口1的读出最大地址
        .RD1_LENGTH(9'd256),           //一次性读出数据长度
        .RD1_LOAD(~rst_n),
                                    //读出端口1 清零请求，高电平清零读出地址和fifo
        .RD1_CLK(clk_25m),          //读出端口1 fifo读取时钟
        .RD1_EMPTY(),               //读出端口1 fifo读空信号
        .RD1_USE(),                 //读出端口1 fifo已经还可以读取的数据长度
        //  FIFO Read Side 2
        .RD2_DATA(sd_photo_rgb_1),                //读出端口2的数据输出端16bit
        .RD2(sdram_rd_en),                 //读出端口2的读使能端，高电平读出
        .RD2_ADDR(sdram_addr_out),               //读出端口2的读起始地址
        .RD2_MAX_ADDR(sdram_addr_out_end),           //读出端口2的读出最大地址
        .RD2_LENGTH(9'd128),              //一次性读出数据长度 
        .RD2_LOAD(~rst_n||sdram_rst),            //读出端口2清零请求，高电平清零读出地址和fifo
        .RD2_CLK(clk_25m),             //读出端口2 fifo读取时钟
        .RD2_EMPTY(),               //读出端口2 fifo读空信号
        .RD2_USE()                  //读出端口2 fifo已经还可以读取的数据长度                //读出端口2 fifo已经还可以读取的数据长度
    );  
*/


endmodule