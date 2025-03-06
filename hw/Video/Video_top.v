module Video_top
(
	input CLK,		// Clock
	input RSTn,	// Reset

    input RX_Pin_In,
    input RX_En_Sig,
    input [5:0] GAME_SWITCH,
    input back,

    //SD卡接口               
    input                 sd_miso     ,  //SD卡SPI串行输入数据信号
    output                sd_clk      ,  //SD卡SPI时钟信号
    output                sd_cs       ,  //SD卡SPI片选信号
    output                sd_mosi     ,  //SD卡SPI串行输出数据信号

    //SDRAM
    output  wire            sdram_clk   ,  //SDRAM 芯片时钟
    output  wire            sdram_cke   ,  //SDRAM 时钟有效
    output  wire            sdram_cs_n  ,  //SDRAM 片选
    output  wire            sdram_ras_n ,  //SDRAM 行有效
    output  wire            sdram_cas_n ,  //SDRAM 列有效
    output  wire            sdram_we_n  ,  //SDRAM 写有效
    output  wire    [1:0]   sdram_ba    ,  //SDRAM Bank地址
    output  wire    [1:0]   sdram_dqm   ,  //SDRAM 数据掩码
    output  wire    [12:0]  sdram_addr  ,  //SDRAM 行/列地址
    inout   wire    [15:0]  sdram_dq    ,  //SDRAM 数据

    input   wire    [9:0]   figure_x_1   ,
    input   wire    [9:0]   figure_y_1   ,
    input   wire    [9:0]   figure_x_2   ,
    input   wire    [9:0]   figure_y_2   ,
    input   wire    [9:0]   figure_state_1,
    input   wire    [9:0]   figure_state_2,
    input   wire            figure_toward_1,
    input   wire            figure_toward_2,
    input   wire    [6:0]   blood_1,
    input   wire    [6:0]   blood_2,
    input   wire    [6:0]   energy_1,
    input   wire    [6:0]   energy_2,
    input   wire    [1:0]   energy_count_1,
    input   wire    [1:0]   energy_count_2,

    input   wire    [9:0]   x_pos       ,
    input   wire    [9:0]   y_pos       ,
    //VGA
    output  wire            VGA_HS,
    output  wire            VGA_VS,             
    output  wire    [15:0]  vga_out_rgb   
);

vga_rom_pic_jump vga(

    .sys_clk(CLK)     ,   //输入工作时钟,频率50MHz
    .sys_rst_n(RSTn)   ,   //输入复位信号,低电平有效

    //水果忍者手势
    .hand_x(x_pos)      ,
    .hand_y(y_pos)      ,


    .hsync      (VGA_HS)       ,   //输出行同步信号
    .vsync      (VGA_VS)       ,   //输出场同步信号
    .rgb        (vga_out_rgb)  ,   //输出像素信息

    .back_photo_req(sd_rd_en),
    .back_photo_rgb(sd_photo_rgb),//上一张图的rgb值

    .sd_photo_rgb_1 (sd_photo_rgb_1),//当前图片的rgb值
    .sdram_rd_en    (sdram_rd_en),
    .sdram_addr_out (sdram_addr_out),
    .sdram_addr_out_end(sdram_addr_out_end),
    .photo_load_cnt  (photo_load_cnt),
    .sdram_rst      (sdram_rst),

    
    .GAME_SWITCH        (GAME_SWITCH),
    .back               (back       ),
    .GAME_OVER          (GAME_OVER  ),


    .figure_x_1         (figure_x_1),
    .figure_y_1         (figure_y_1),
    .figure_x_2         (figure_x_2),
    .figure_y_2         (figure_y_2),
    .figure_state_1     (figure_state_1),
    .figure_state_2     (figure_state_2),
    .figure_toward_1    (figure_toward_1),
    .figure_toward_2    (figure_toward_2), 
    .blood_1            (blood_1),
    .blood_2            (blood_2),
    .energy_1           (energy_1),
    .energy_2           (energy_2),
    .energy_count_1     (energy_count_1),
    .energy_count_2     (energy_count_2)

);



wire [20:0] sdram_addr_out;
wire [20:0] sdram_addr_out_end;
wire sd_rd_en,sdram_rd_en;
wire [15:0] sd_photo_rgb;
wire [15:0] sd_photo_rgb_1;
wire [7:0] photo_load_cnt;
wire sdram_rst;

top_sd_photo_vga  sd_rd(
    .sys_clk        (CLK)     ,  //系统时钟
    .sys_rst_n      (RSTn)   ,  //系统复位，低电平有效

    //SD卡接口               
    .sd_miso        (sd_miso)     ,  //SD卡SPI串行输入数据信号
    .sd_clk         (sd_clk)      ,  //SD卡SPI时钟信号
    .sd_cs          (sd_cs)     ,  //SD卡SPI片选信号
    .sd_mosi        (sd_mosi)  ,  //SD卡SPI串行输出数据信号

    //SDRAM 芯片接口
    .sdram_clk          (sdram_clk      ),  //SDRAM 芯片时钟
    .sdram_cke          (sdram_cke      ),  //SDRAM 时钟有效
    .sdram_cs_n         (sdram_cs_n     ),  //SDRAM 片选
    .sdram_ras_n        (sdram_ras_n    ),  //SDRAM 行有效
    .sdram_cas_n        (sdram_cas_n    ),  //SDRAM 列有效
    .sdram_we_n         (sdram_we_n     ),  //SDRAM 写有效
    .sdram_ba           (sdram_ba       ),  //SDRAM Bank地址
    .sdram_addr_extern  (sdram_addr     ),  //SDRAM 行/列地址
    .sdram_dq           (sdram_dq       ),  //SDRAM 数据
    .sdram_dqm          (sdram_dqm      ),   //SDRAM 数据掩码


    .sd_rd_en       (sd_rd_en) ,
    .sd_photo_rgb   (sd_photo_rgb),

    .sd_photo_rgb_1 (sd_photo_rgb_1),
    .sdram_rd_en    (sdram_rd_en),
    .sdram_addr_out (sdram_addr_out),
    .sdram_addr_out_end(sdram_addr_out_end),
    .sdram_rst      (sdram_rst),
    .photo_load_cnt  (photo_load_cnt),
    
    .GAME_SWITCH(GAME_SWITCH),
    .GAME_OVER      (GAME_OVER)

);


wire GAME_OVER;
rx_top  rx(
    .CLK(CLK), 
    .RSTn(RSTn), 
    .RX_Pin_In(RX_Pin_In), 
    .RX_En_Sig(RX_En_Sig)
);

endmodule