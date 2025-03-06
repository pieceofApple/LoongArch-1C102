//**************************************************************************
// *** 名称 : VGA_driver.v
// *** 作者 : xianyu_FPGA
// *** 博客 : https://www.cnblogs.com/xianyufpga/
// *** 日期 : 2019-08-10
// *** 描述 : VGA显示屏控制器，分辨率640x480
//            各家VGA电路不同，有些VGA输出信号是不需要的，那不接引脚就行
//**************************************************************************
module VGA_driver
//========================< 端口 >==========================================
(
//system --------------------------------------------
input   wire                clk                     ,   //时钟
input   wire                rst_n                   ,   //复位，低电平有效
//input ---------------------------------------------
output  wire                ch0_VGA_req             ,   //通道0 输出数据请求
input   wire    [15:0]      ch0_VGA_din             ,   //通道0 得到图像数据
//--------------------------
output  wire                ch1_VGA_req             ,   //通道1 输出数据请求
input   wire    [15:0]      ch1_VGA_din             ,   //通道1 得到图像数据
//output --------------------------------------------
output  wire                VGA_clk                 ,   //VGA数据时钟
output  wire                VGA_blank               ,   //VGA背光控制
output  wire                VGA_hsync               ,   //VGA行同步
output  wire                VGA_vsync               ,   //VGA场同步
output  wire    [15:0]      VGA_data                ,   //VGA数据输出
output  wire                VGA_de                      //VGA数据使能
);
//========================< 参数 >==========================================
//640x480 @60 25Mhz ---------------------------------  
parameter H_SYNC            = 16'd96                ;   //行同步信号
parameter H_BACK            = 16'd48                ;   //行显示后沿
parameter H_DISP            = 16'd640               ;   //行有效数据
parameter H_FRONT           = 16'd16                ;   //行显示前沿
parameter H_TOTAL           = 16'd800               ;   //行扫描周期
//---------------------------------------------------
parameter V_SYNC            = 16'd2                 ;   //场同步信号
parameter V_BACK            = 16'd33                ;   //场显示后沿
parameter V_DISP            = 16'd480               ;   //场有效数据   
parameter V_FRONT           = 16'd10                ;   //场显示前沿
parameter V_TOTAL           = 16'd525               ;   //场扫描周期
//========================< 信号 >==========================================
reg     [15:0]              cnt_h                   ;
wire                        add_cnt_h               ;
wire                        end_cnt_h               ;
reg     [15:0]              cnt_v                   ;
wire                        add_cnt_v               ;
wire                        end_cnt_v               ;
//---------------------------------------------------
reg                         ch0_VGA_de              ;
reg                         ch1_VGA_de              ;
//==========================================================================
//==    行、场计数
//==========================================================================
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt_h <= 'd0;
    else if(add_cnt_h) begin
        if(end_cnt_h)
            cnt_h <= 'd0;
        else
            cnt_h <= cnt_h + 1'b1;
    end
end

assign add_cnt_h = 'd1;
assign end_cnt_h = add_cnt_h && cnt_h==H_TOTAL-1;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cnt_v <= 'd0;
    else if(add_cnt_v) begin
        if(end_cnt_v)
            cnt_v <= 'd0;
        else
            cnt_v <= cnt_v + 1'b1;
    end
end

assign add_cnt_v = end_cnt_h;
assign end_cnt_v = add_cnt_v && cnt_v==V_TOTAL-1;
//==========================================================================
//==    VGA控制信号
//==========================================================================
//VGA时钟
assign VGA_clk = clk;

//VGA背光控制
assign VGA_blank = rst_n;

//VGA行同步
assign VGA_hsync = (cnt_h < H_SYNC) ? 1'b0 : 1'b1;

//VGA场同步
assign VGA_vsync = (cnt_v < V_SYNC) ? 1'b0 : 1'b1;

//VGA请求
assign ch0_VGA_req = (cnt_h >= H_SYNC + H_BACK - 1) && (cnt_h < H_SYNC + H_BACK + H_DISP - 1) &&
                     (cnt_v >= V_SYNC + V_BACK    ) && (cnt_v < V_SYNC + V_BACK + V_DISP      )
                     ? 1'b1 : 1'b0;
/*
//VGA请求，左半边
assign ch0_VGA_req = (cnt_h >= H_SYNC + H_BACK - 1) && (cnt_h < H_SYNC + H_BACK + H_DISP/2 - 1) &&
                     (cnt_v >= V_SYNC + V_BACK    ) && (cnt_v < V_SYNC + V_BACK + V_DISP      )
                     ? 1'b1 : 1'b0;
//VGA请求，右半边                  
assign ch1_VGA_req = (cnt_h >= H_SYNC + H_BACK + H_DISP/2 - 1) && (cnt_h < H_SYNC + H_BACK + H_DISP - 1) &&
                     (cnt_v >= V_SYNC + V_BACK               ) && (cnt_v < V_SYNC + V_BACK + V_DISP    )
                     ? 1'b1 : 1'b0;
*/
//==========================================================================
//==    VGA数据输出
//==========================================================================
//VGA打拍对齐
always @(posedge clk) begin
    ch0_VGA_de <= ch0_VGA_req;
    ch1_VGA_de <= ch1_VGA_req;
end

//VGA数据输出
assign VGA_data = ch0_VGA_de ? ch0_VGA_din :
                  ch1_VGA_de ? ch1_VGA_din : 16'b0;

//VGA数据使能
assign VGA_de = (cnt_h >= H_SYNC + H_BACK) && (cnt_h < H_SYNC + H_BACK + H_DISP) &&
                (cnt_v >= V_SYNC + V_BACK) && (cnt_v < V_SYNC + V_BACK + V_DISP)
                ? 1'b1 : 1'b0;



endmodule