`timescale  1ns/1ns
////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/03/15
// Module Name   : vga_pic
// Project Name  : vga_rom_pic_jump
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : 图像数据生成模块
// 
// Revision      : V1.0
// Additional Comments:该部分代码主要参考野火的公开文档 同时根据我们自己的需求对部分基础操作函数进行了优化
////////////////////////////////////////////////////////////////////////

module  vga_pic
(
    input   wire            vga_clk     ,   //输入工作时钟,频率25MHz
    input   wire            sys_clk     ,
    input   wire            sys_rst_n   ,   //输入复位信号,低电平有效

    input   wire    [15:0]  sd_photo_rgb_1,
    output  wire            sdram_rd_en,
    output  wire    [20:0]  sdram_addr_out,
    output  wire    [20:0]  sdram_addr_out_end,
    input   wire    [7:0]   photo_load_cnt,
    output  wire            sdram_rst,

    input   wire            VGA_EN      ,
    input   wire    [9:0]   pix_x       ,   //输入VGA有效显示区域像素点X轴坐标
    input   wire    [9:0]   pix_y       ,   //输入VGA有效显示区域像素点Y轴坐标
    input   wire    [9:0]   pix_x_2       ,   //输出有效显示区域像素点X轴坐标
    input   wire    [9:0]   pix_y_2       ,   //输出有效显示区域像素点Y轴坐标

    input   wire    [15:0]  back_photo_rgb,
    output  wire            back_photo_req, 

    input   wire    [9:0]   hand_x       ,   //手部x
    input   wire    [9:0]   hand_y       ,   //手部y
    input   wire    [5:0]   GAME_SWITCH  ,
    input   wire            back         ,
    output  wire            GAME_OVER    ,

    input   wire    [6:0]   blood_1      ,
    input   wire    [6:0]   blood_2      ,
    input   wire    [6:0]   energy_1     ,
    input   wire    [6:0]   energy_2     ,
    input   wire    [1:0]   energy_count_1,
    input   wire    [1:0]   energy_count_2,


    input   wire    [9:0]   figure_x_1_1   ,
    input   wire    [9:0]   figure_y_1_1   ,
    input   wire    [9:0]   figure_x_2_1   ,
    input   wire    [9:0]   figure_y_2_1   ,
    input   wire    [9:0]   figure_state_1_1,
    input   wire    [9:0]   figure_state_2_1,
    input   wire            figure_toward_1_1,
    input   wire            figure_toward_2_1,


    output  wire    [15:0]  pix_data_out    //输出VGA显示图像数据

);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//

parameter   H_VALID         =   10'd640     ,   //行有效数据
            V_VALID         =   10'd480     ;   //场有效数据

parameter  PHOTO_H_PIXEL    =   20'd640     ;  //设置SDRAM缓存大小
parameter  PHOTO_V_PIXEL    =   20'd480     ;  //设置SDRAM缓存大小
parameter  PHOTO_TOTAL_PIX  =   21'd307200;
parameter  PHOTO_H_1        =   20'd128     ;  //设置SDRAM缓存大小
parameter  PHOTO_V_1        =   20'd190     ;  //设置SDRAM缓存大小
parameter  PIC_TOTAL_PIC    =   21'd24320;

parameter   H_PIC           =   10'd60     ,   //图片长度
            W_PIC           =   10'd57     ,   //图片宽度
            PIC_SIZE        =   14'd3420   ;   //图片像素个数

parameter   RED             =   16'hF800    ,   //红色
            ORANGE          =   16'hFC00    ,   //橙色
            YELLOW          =   16'hFFE0    ,   //黄色
            GREEN           =   16'h07E0    ,   //绿色
            CYAN            =   16'h07FF    ,   //青色
            BLUE            =   16'h001F    ,   //蓝色
            PURPPLE         =   16'hF81F    ,   //紫色
            BLACK           =   16'h0000    ,   //黑色
            WHITE           =   16'hFFFF    ,   //白色
            GRAY            =   16'hD69A    ,   //灰色
            BACKGROUND      =   16'b1111111110110000,
            IGNORE          =   16'b0001010111011011;

//控制水果miss或被切后的出现时间常数
parameter   banana_TIME     =   25'd100_000_000,
            apple_TIME      =   25'd100_000_000,
            watermelon_TIME =   25'd100_000_000,
            pineapple_TIME  =   25'd100_000_000;


parameter clock_w           =   10'd5,      //倒计时数码管长宽
          clock_l           =   10'd20,
          clock_x           =   10'd289,    //倒计时数码管位置
          clock_y           =   10'd24,
          clock_TIME        =   25'd25_000_000,
          zero              =   7'b1111110,
          one               =   7'b0110000,
          two               =   7'b1101101,
          three             =   7'b1111001,
          four              =   7'b0110011,
          five              =   7'b1011011,
          six               =   7'b1011111,
          seven             =   7'b1110000,
          eight             =   7'b1111111,
          nine              =   7'b1111011;

parameter IDLE              =   10'b00000_00000,      
          MOVE              =   10'b00000_00001,
          DEFENSE           =   10'b00000_00010,    
          LIGHTPUNCH        =   10'b00000_00100,
          HEAVYPUNCH        =   10'b00000_01000,
          LIGHTKICK         =   10'b00000_10000,
          HEAVYKICK         =   10'b00001_00000,
          JUMP              =   10'b00010_00000,
          HIT               =   10'b00100_00000,
          JINENG            =   10'b01000_00000,
          JINENGHIT         =   10'b10000_00000,
          LEFT              =   1'b0,
          RIGHT             =   1'b1;
parameter PHOTO_NUM         =   8'd46;

//wire  define
wire            rd_en       ;   //ROM读使能
reg    [15:0]   pic_data    ;   //自ROM读出的图片数据


wire    [15:0]  knife    ;   //自ROM读出的图片数据
wire    [15:0]  banana    ;   //自ROM读出的图片数据
wire    [15:0]  apple    ;   //自ROM读出的图片数据
wire    [15:0]  watermelon    ;   //自ROM读出的图片数据
wire    [15:0]  pineapple    ;   //自ROM读出的图片数据



//reg   define
reg    [13:0]   rom_addr    ;   //读ROM地址

reg             pic_valid   ;   //图片数据有效信号
reg    [15:0]   pix_data    ;   //背景色彩信息



reg    [9:0]    figure_x_1   ;
reg    [9:0]    figure_y_1   ;
reg    [9:0]    figure_x_2   ;
reg    [9:0]    figure_y_2   ;
reg    [9:0]    figure_state_1;
reg    [9:0]    figure_state_2;
reg             figure_toward_1;
reg             figure_toward_2;

always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|GAME_SWITCH[1]==1'b0|GAME_OVER)begin
        figure_x_1   <=50;
        figure_y_1   <=240;
        figure_x_2   <=450;
        figure_y_2   <=240;
        figure_state_1<=IDLE;
        figure_state_2<=IDLE;
        figure_toward_1<=RIGHT;
        figure_toward_2<=LEFT;
        end
    else if((pix_x == (H_VALID - 1'b1))&&(pix_y == (V_VALID -1'b1))) begin
        figure_x_1   <=figure_x_1_1;
        figure_y_1   <=figure_y_1_1;
        figure_x_2   <=figure_x_2_1;
        figure_y_2   <=figure_y_2_1;
        figure_state_1<=figure_state_1_1;
        figure_state_2<=figure_state_2_1;
        figure_toward_1<=figure_toward_1_1;
        figure_toward_2<=figure_toward_2_1;        
    end
    else begin
        figure_x_1   <=figure_x_1;
        figure_y_1   <=figure_y_1;
        figure_x_2   <=figure_x_2;
        figure_y_2   <=figure_y_2;
        figure_state_1<=figure_state_1;
        figure_state_2<=figure_state_2;
        figure_toward_1<=figure_toward_1;
        figure_toward_2<=figure_toward_2;             
    end

end

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//

//--------------------------------------------苹果控制器-------------------------------------------------//

reg             y_flag2;
reg             kill_flag2;    //为1表示水果被切掉
reg             miss_flag2;    //为1表示水果掉出屏幕
reg     [9:0]   x_move_2      ;   //图片横向移动量
reg     [9:0]   y_move_2      ;   //图片纵向移动量
wire            rd_en2       ;   //ROM读使能
reg     [13:0]  rom_addr2    ;   //读ROM地址

//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        kill_flag2 <= 1'b0;
        end
    else    if((hand_move_x+41 <= x_move_2+H_PIC)&&(hand_move_x+41 >= x_move_2) &&(hand_move_y+4 <= y_move_2+W_PIC)&&(hand_move_y+4 >= y_move_2)&& (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            kill_flag2 <= 1'b1;
        end
    else if((kill_flag2==1'b1)&&change_flag2==1'b1)
            kill_flag2 <= 1'b0;
    end


//y_flag:图片上下移动标志
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)
        y_flag2  <=  1'b0;
    else    if(y_move_2 == 0)
        y_flag2  <=  1'b0;
    else    if((y_move_2 >= (V_VALID - W_PIC - 1'b1))
            && (pix_x == (H_VALID - 1'b1))
            && (pix_y == (V_VALID - 1'b1)))
        y_flag2  <=  1'b1;
//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|change_flag2|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        y_move_2   <=  10'd0;
        miss_flag2 <= 1'b0;
        x_move_2   <= 10'd100;                            //图片x轴起始位置
        end
    else if((y_flag2 == 1'b0) && (pix_x == (H_VALID - 1'b1)) && (pix_y == (V_VALID -1'b1)))begin
            y_move_2   <=  y_move_2 + 2'd1;
            miss_flag2 <= 1'b0;
            x_move_2   <= 10'd100;                            //图片x轴起始位置
        end
    else if((y_flag2 == 1'b1) && (pix_x == (H_VALID - 1'b1)) && (pix_y == (V_VALID -1'b1)))begin
            miss_flag2 <= 1'b1;
            x_move_2   <= 10'd100;                            //图片x轴起始位置
        end
    end


//----------------------苹果计数器-----------------------------------//

reg               change_flag2  ;          // 图片切换标志位
reg    [24:0]     change_cnt2;             // 图片切换计数器
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n|GAME_SWITCH[0]==1'b0|GAME_OVER) begin
        change_cnt2 <= 25'd0;
        change_flag2<= 1'b0;
    end
    else if(kill_flag2|miss_flag2) begin
            if(change_cnt2 == apple_TIME - 1'b1) begin      
                change_cnt2 <= 25'd0;
                change_flag2 <= 1'b1;
            end
            else begin
                change_cnt2 <= change_cnt2 + 25'd1;
                change_flag2 <= 1'b0;
            end
                
    end
end
//----------------------苹果计数器-----------------------------------//


//--------------------------------------------苹果控制器-------------------------------------------------//


//--------------------------------------------香蕉控制器-------------------------------------------------//

reg             kill_flag1;    //为1表示水果被切掉
reg             miss_flag1;    //为1表示水果掉出屏幕
reg     [9:0]   x_move_1      ;   //图片横向移动量
reg     [9:0]   y_move_1      ;   //图片纵向移动量
reg             x_flag      ;   //图片左右移动标志
reg             y_flag      ;   //图片上下移动标志
wire            rd_en1       ;   //ROM读使能
reg     [13:0]  rom_addr1    ;   //读ROM地址

//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        kill_flag1 <= 1'b0;
        end
    else    if((hand_move_x +41<= x_move_1+H_PIC)&&(hand_move_x+41 >= x_move_1) &&(hand_move_y +4<= y_move_1+W_PIC)&&(hand_move_y +4>= y_move_1)&& (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            kill_flag1 <= 1'b1;
        end
    else if((kill_flag1==1'b1)&&change_flag1==1'b1)
            kill_flag1 <= 1'b0;
end



//y_flag:图片上下移动标志
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)
        y_flag  <=  1'b0;
    else    if(y_move_1 == 0)
        y_flag  <=  1'b0;
    else    if((y_move_1 >= (V_VALID - W_PIC - 1'b1))
            && (pix_x == (H_VALID - 1'b1))
            && (pix_y == (V_VALID - 1'b1)))
        y_flag  <=  1'b1;
//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin

    if(sys_rst_n == 1'b0|change_flag1|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        y_move_1   <=  10'd0;
        miss_flag1 <= 1'b0;
        x_move_1   <= 10'd200;                            //图片x轴起始位置
        end
    else    if((y_flag == 1'b0) && (pix_x == (H_VALID - 1'b1)) && (pix_y == (V_VALID -1'b1)))begin
            y_move_1   <=  y_move_1 + 2'd1;
            miss_flag1 <= 1'b0;
            x_move_1   <= 10'd200;                            //图片x轴起始位置
        end
    else    if((y_flag == 1'b1) && (pix_x == (H_VALID - 1'b1)) && (pix_y == (V_VALID -1'b1)))begin
            miss_flag1 <= 1'b1;
            x_move_1   <= 10'd200;                            //图片x轴起始位置
        end
end


//----------------------香蕉计数器-----------------------------------//

reg               change_flag1  ;          // 图片切换标志位
reg    [24:0]     change_cnt1;             // 图片切换计数器
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n|GAME_SWITCH[0]==1'b0|GAME_OVER) begin
        change_cnt1 <= 25'd0;
        change_flag1<= 1'b0;
    end
    else if(kill_flag1|miss_flag1) begin
            if(change_cnt1 == banana_TIME - 1'b1) begin      
                change_cnt1 <= 25'd0;
                change_flag1 <= 1'b1;
            end
            else begin
                change_cnt1 <= change_cnt1 + 25'd1;
                change_flag1 <= 1'b0;
            end
                
    end
end
//----------------------香蕉计数器-----------------------------------//




//--------------------------------------------香蕉控制器-------------------------------------------------//


//--------------------------------------------西瓜控制器-------------------------------------------------//

reg             kill_flag3;    //为1表示水果被切掉
reg             miss_flag3;    //为1表示水果掉出屏幕
reg     [9:0]   x_move_3      ;   //图片横向移动量
reg     [9:0]   y_move_3      ;   //图片纵向移动量
reg             x_flag3      ;   //图片左右移动标志
reg             y_flag3      ;   //图片上下移动标志
wire            rd_en3       ;   //ROM读使能
reg     [13:0]  rom_addr3    ;   //读ROM地址

//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        kill_flag3 <= 1'b0;
        end
    else    if((hand_move_x +41<= x_move_3+H_PIC)&&(hand_move_x +41>= x_move_3) &&(hand_move_y +4<= y_move_3+W_PIC)&&(hand_move_y +4>= y_move_3)&& (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            kill_flag3 <= 1'b1;
        end
    else if((kill_flag3==1'b1)&&change_flag3==1'b1)
            kill_flag3 <= 1'b0;
    end



//y_flag:图片上下移动标志
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)
        y_flag3  <=  1'b0;
    else    if(y_move_3 == 0)
        y_flag3  <=  1'b0;
    else    if((y_move_3 >= (V_VALID - W_PIC - 1'b1))
            && (pix_x == (H_VALID - 1'b1))
            && (pix_y == (V_VALID - 1'b1)))
        y_flag3  <=  1'b1;
//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|change_flag3|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        y_move_3   <=  10'd0;
        miss_flag3 <= 1'b0;
        x_move_3   <= 10'd300;                            //图片x轴起始位置
        end
    else    if((y_flag3 == 1'b0) && (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            y_move_3   <=  y_move_3 + 2'd1;
            miss_flag3 <= 1'b0;
            x_move_3   <= 10'd300;                            //图片x轴起始位置
        end
    else    if((y_flag3 == 1'b1) && (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
        miss_flag3 <= 1'b1;
        x_move_3   <= 10'd300;                            //图片x轴起始位置
        end
end


//----------------------西瓜计数器-----------------------------------//

reg               change_flag3  ;          // 图片切换标志位
reg    [24:0]     change_cnt3;             // 图片切换计数器
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n|GAME_SWITCH[0]==1'b0|GAME_OVER) begin
        change_cnt3 <= 25'd0;
        change_flag3<= 1'b0;
    end
    else if(kill_flag3|miss_flag3) begin
            if(change_cnt3 == watermelon_TIME - 1'b1) begin      
                change_cnt3 <= 25'd0;
                change_flag3 <= 1'b1;
            end
            else begin
                change_cnt3 <= change_cnt3 + 25'd1;
                change_flag3 <= 1'b0;
            end
                
    end
end
//----------------------西瓜计数器-----------------------------------//

//--------------------------------------------西瓜控制器-------------------------------------------------//


//--------------------------------------------菠萝控制器-------------------------------------------------//

reg             kill_flag4;    //为1表示水果被切掉
reg             miss_flag4;    //为1表示水果掉出屏幕
reg     [9:0]   x_move_4      ;   //图片横向移动量
reg     [9:0]   y_move_4      ;   //图片纵向移动量
reg             x_flag4      ;   //图片左右移动标志
reg             y_flag4      ;   //图片上下移动标志
wire            rd_en4       ;   //ROM读使能
reg     [13:0]  rom_addr4    ;   //读ROM地址

//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        kill_flag4 <= 1'b0;
        end
    else    if((hand_move_x +41<= x_move_4+H_PIC)&&(hand_move_x +41>= x_move_4) &&(hand_move_y +4<= y_move_4+W_PIC)&&(hand_move_y +4>= y_move_4)&& (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            kill_flag4 <= 1'b1;
        end
    else if((kill_flag4==1'b1)&&change_flag4==1'b1)
            kill_flag4 <= 1'b0;
    end



//y_flag:图片上下移动标志
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0|GAME_SWITCH[0]==1'b0|GAME_OVER)
        y_flag4  <=  1'b0;
    else    if(y_move_4 == 0)
        y_flag4  <=  1'b0;
    else    if((y_move_4 >= (V_VALID - W_PIC - 1'b1))
            && (pix_x == (H_VALID - 1'b1))
            && (pix_y == (V_VALID - 1'b1)))
        y_flag4  <=  1'b1;
//y_move_1:图片纵向移动量
always@(posedge vga_clk or negedge sys_rst_n)begin
    if(sys_rst_n == 1'b0|change_flag4|GAME_SWITCH[0]==1'b0|GAME_OVER)begin
        y_move_4   <=  10'd0;
        miss_flag4 <= 1'b0;
        x_move_4   <= 10'd500;                            //图片x轴起始位置
        end
    else    if((y_flag4 == 1'b0) && (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
            y_move_4   <=  y_move_4 + 2'd1;
            miss_flag4 <= 1'b0;
            x_move_4   <= 10'd500;                            //图片x轴起始位置
        end
    else    if((y_flag4 == 1'b1) && (pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1)))begin
        miss_flag4 <= 1'b1;
        x_move_4   <= 10'd500;                            //图片x轴起始位置
        end
end


//----------------------菠萝计数器-----------------------------------//

reg               change_flag4  ;          // 图片切换标志位
reg    [24:0]     change_cnt4;             // 图片切换计数器
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n|GAME_SWITCH[0]==1'b0|GAME_OVER) begin
        change_cnt4 <= 25'd0;
        change_flag4<= 1'b0;
    end
    else if(kill_flag4|miss_flag4) begin
            if(change_cnt4 == pineapple_TIME - 1'b1) begin      
                change_cnt4 <= 25'd0;
                change_flag4 <= 1'b1;
            end
            else begin
                change_cnt4 <= change_cnt4 + 25'd1;
                change_flag4 <= 1'b0;
            end
                
    end
end
//----------------------菠萝计数器-----------------------------------//

//--------------------------------------------菠萝控制器-------------------------------------------------//





//--------------------------------------------刀控制器-------------------------------------------------//
reg [9:0] hand_move_x;
reg [9:0] hand_move_y;
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n|GAME_SWITCH[0]==1'b0|GAME_OVER) begin
        // reset
        hand_move_x <= 0;
        hand_move_y <= 0;
    end
    else if((hand_x<H_VALID - H_PIC - 2'd1)&&(hand_y<V_VALID - 2'd1-W_PIC)&&(pix_x == (H_VALID - 1'b1))
                && (pix_y == (V_VALID -1'b1))) begin
        hand_move_x <= hand_x;
        hand_move_y <= hand_y;
    end
end
//--------------------------------------------刀控制器-------------------------------------------------//


//--------------------------------------------倒计时控制器-------------------------------------------------//

reg [6:0] clock_shi;
reg [6:0] clock_ge;
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n|(GAME_SWITCH[1]==1'b0&&GAME_SWITCH[0]==1'b0)|GAME_OVER) begin
        // reset
        clock_shi <= 7'd0;
    end
    // else if((pix_x == (H_VALID - 1'b1))
    //             && (pix_y == (V_VALID -1'b1))) begin
    else if(GAME_SWITCH[1]) begin
        case(clock_time_shi)
            0:clock_shi<=zero;
            1:clock_shi<=one;
            2:clock_shi<=two;
            3:clock_shi<=three;
            4:clock_shi<=four;
            5:clock_shi<=five;
            6:clock_shi<=six;
            7:clock_shi<=seven;
            8:clock_shi<=eight;
            9:clock_shi<=nine;
            default:clock_shi <= clock_shi;
        endcase
    end

    else if(GAME_SWITCH[0]) begin
        clock_shi<=zero;
    end
    // else clock_shi <= clock_shi;
end

always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n|(GAME_SWITCH[1]==1'b0&&GAME_SWITCH[0]==1'b0)|GAME_OVER) begin
        // reset
        clock_ge <= 7'd0;
    end
    // else if((pix_x == (H_VALID - 1'b1))
    //             && (pix_y == (V_VALID -1'b1))) begin
    else if(GAME_SWITCH[1])begin
        case(clock_time_ge)
            0:clock_ge<=zero;
            1:clock_ge<=one;
            2:clock_ge<=two;
            3:clock_ge<=three;
            4:clock_ge<=four;
            5:clock_ge<=five;
            6:clock_ge<=six;
            7:clock_ge<=seven;
            8:clock_ge<=eight;
            9:clock_ge<=nine;
            default:clock_ge <= clock_ge;
        endcase
    end

    else if(GAME_SWITCH[0])begin
        case(game1_cnt)
            0:clock_ge<=zero;
            1:clock_ge<=one;
            2:clock_ge<=two;
            3:clock_ge<=three;
            4:clock_ge<=four;
            5:clock_ge<=five;
            6:clock_ge<=six;
            7:clock_ge<=seven;
            8:clock_ge<=eight;
            9:clock_ge<=nine;
            default:clock_ge <= clock_ge;
        endcase
    end

    // else clock_ge <= clock_ge;
end




reg    [3:0]      clock_time_ge;
reg    [3:0]      clock_time_shi;
reg    [24:0]     cnt_time;             //倒计时计数器
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n|GAME_SWITCH[1]==1'b0|GAME_OVER|!load_over|game2_over) begin
        cnt_time       <= 25'd0;
        clock_time_ge  <= 4'd9;
        clock_time_shi <= 4'd9;
    end
    else if(1) begin
            if(cnt_time == clock_TIME - 1'b1) begin      
                cnt_time <= 25'd0;
                if(clock_time_ge <= 0) begin
                    clock_time_ge <= 4'd9;
                    clock_time_shi <= clock_time_shi-4'd1;
                end
                else clock_time_ge <= clock_time_ge-4'd1;
            end
            else begin
                cnt_time <= cnt_time + 25'd1;
            end
                
    end
end

//--------------------------------------------倒计时控制器-------------------------------------------------//



//--------------------------------------------游戏结束控制器-------------------------------------------------//

//--------------------------------------水果忍者---------------------------------//
reg         game1_over;
reg         locked1;
reg         locked2;
reg         locked3;
reg         locked4;
reg [3:0]   game1_cnt;
always @(posedge vga_clk or negedge sys_rst_n ) begin
    if(!sys_rst_n|GAME_SWITCH[5]) begin
        game1_over <= 0;
        game1_cnt <= 0;
        locked1 <= 0;
        locked2 <= 0;
        locked3 <= 0;
        locked4 <= 0;
    end
    else if(miss_flag1&&!locked1) begin
         game1_cnt <= game1_cnt + 1;
         locked1 <= 1;
    end
    else if(miss_flag2&&!locked2) begin
         game1_cnt <= game1_cnt + 1;
         locked2 <= 1;
    end
    else if(miss_flag3&&!locked3) begin
         game1_cnt <= game1_cnt + 1;
         locked3 <= 1;
    end
    else if(miss_flag4&&!locked4) begin
         game1_cnt <= game1_cnt + 1;
         locked4 <= 1;
    end
    else if(locked1&&!miss_flag1) locked1 <= 0;
    else if(locked2&&!miss_flag2) locked2 <= 0;
    else if(locked3&&!miss_flag3) locked3 <= 0;
    else if(locked4&&!miss_flag4) locked4 <= 0;
    else 
        if(game1_cnt >= 4'd6) begin
           game1_over <= 1;
           game1_cnt <= 4'd6;
        end  

end
//--------------------------------------水果忍者---------------------------------//

//--------------------------------------拳皇---------------------------------//

reg game2_over;
reg clock_cnt;

always @(posedge vga_clk or negedge sys_rst_n ) begin
    if(!sys_rst_n|GAME_SWITCH[5]) begin
        game2_over <= 0;
        clock_cnt  <= 0;
    end
    else if (blood_1==0||blood_2==0) begin
        game2_over <= 1;
    end
    else if (clock_time_ge==9&&clock_time_shi==9) begin
        clock_cnt <= 1;
    end
    else if (clock_cnt&&clock_time_ge==0&&clock_time_shi==0) begin
        game2_over <= 1;
    end
end

//--------------------------------------拳皇---------------------------------//

reg GAME_OVER;
always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        GAME_OVER <= 0;
    end
    else if(game1_over||game2_over) begin
        GAME_OVER <= 1;
    end

    else  begin
        GAME_OVER <= 0;
    end
end
//--------------------------------------------游戏结束控制器-------------------------------------------------//



//----------------------所有图片显示区域划定-----------------------------------//


assign  back_photo_req = VGA_EN;

//----------------------水果忍者使能-----------------------------------//

assign  rd_en = (((pix_x >= (hand_move_x))                            
                && (pix_x < (hand_move_x + H_PIC))) 
                &&((pix_y >= (hand_move_y))
                && ((pix_y < (hand_move_y + W_PIC)))))&&GAME_SWITCH[0]&&!GAME_OVER;



assign  rd_en1 = (((pix_x >= (x_move_1))
                && (pix_x < (x_move_1 + H_PIC))) 
                &&((pix_y >= (y_move_1))
                && ((pix_y < (y_move_1 + W_PIC))))&&(!kill_flag1)&&(!miss_flag1))&&GAME_SWITCH[0]&&!GAME_OVER;

assign  rd_en2 = (((pix_x >= (x_move_2))
                && (pix_x < (x_move_2 + H_PIC))) 
                &&((pix_y >= (y_move_2))
                && ((pix_y < (y_move_2 + W_PIC))))&&(!kill_flag2)&&(!miss_flag2))&&GAME_SWITCH[0]&&!GAME_OVER;

assign  rd_en3 = (((pix_x >= (x_move_3))
                && (pix_x < (x_move_3 + H_PIC))) 
                &&((pix_y >= (y_move_3))
                && ((pix_y < (y_move_3 + W_PIC))))&&(!kill_flag3)&&(!miss_flag3))&&GAME_SWITCH[0]&&!GAME_OVER;

assign  rd_en4 = (((pix_x >= (x_move_4))
                && (pix_x < (x_move_4 + H_PIC))) 
                &&((pix_y >= (y_move_4))
                && ((pix_y < (y_move_4 + W_PIC))))&&(!kill_flag4)&&(!miss_flag4))&&GAME_SWITCH[0]&&!GAME_OVER;
//----------------------水果忍者使能-----------------------------------//


//----------------------拳皇显示使能-----------------------------------//

//----------------------倒计时使能------------------------------//

wire rd_en_clock_shi_1,rd_en_clock_shi_2,rd_en_clock_shi_3,rd_en_clock_shi_4,rd_en_clock_shi_5,rd_en_clock_shi_6,rd_en_clock_shi_7;
wire rd_en_clock_ge_1,rd_en_clock_ge_2,rd_en_clock_ge_3,rd_en_clock_ge_4,rd_en_clock_ge_5,rd_en_clock_ge_6,rd_en_clock_ge_7;


assign  rd_en_clock_shi_1 = (((pix_x >= (clock_x + 5))
                            && (pix_x < (clock_x + 5 + clock_l))) 
                            &&((pix_y >= (clock_y))
                            && ((pix_y < (clock_y + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[6];

assign  rd_en_clock_shi_2 = (((pix_x >= (clock_x + 25))
                            && (pix_x < (clock_x + 25 + clock_w))) 
                            &&((pix_y >= (clock_y + 5))
                            && ((pix_y < (clock_y + 5 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[5];

assign  rd_en_clock_shi_3 = (((pix_x >= (clock_x + 25))
                            && (pix_x < (clock_x + 25 + clock_w))) 
                            &&((pix_y >= (clock_y + 30))
                            && ((pix_y < (clock_y + 30 +clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[4];

assign  rd_en_clock_shi_4 = (((pix_x >= (clock_x + 5))
                            && (pix_x < (clock_x + 5 + clock_l))) 
                            &&((pix_y >= (clock_y + 50))
                            && ((pix_y < (clock_y + 50 + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[3];

assign  rd_en_clock_shi_5 = (((pix_x >= (clock_x))
                            && (pix_x < (clock_x + clock_w))) 
                            &&((pix_y >= (clock_y + 30))
                            && ((pix_y < (clock_y + 30 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[2];

assign  rd_en_clock_shi_6 = (((pix_x >= (clock_x))
                            && (pix_x < (clock_x + clock_w))) 
                            &&((pix_y >= (clock_y + 5))
                            && ((pix_y < (clock_y + 5 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[1];

assign  rd_en_clock_shi_7 = ( ( (pix_x >= (clock_x + 5))
                            && (pix_x < (clock_x + 5 + clock_l))) 
                            &&((pix_y >= (clock_y + 25))
                            && ((pix_y < (clock_y + 25 + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_shi[0];



assign  rd_en_clock_ge_1 = (((pix_x >= (clock_x + 5 + 32))
                            && (pix_x < (clock_x + 5 + 32 + clock_l))) 
                            &&((pix_y >= (clock_y))
                            && ((pix_y < (clock_y + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[6];

assign  rd_en_clock_ge_2 = (((pix_x >= (clock_x + 25 + 32))
                            && (pix_x < (clock_x + 25 + 32 + clock_w))) 
                            &&((pix_y >= (clock_y + 5))
                            && ((pix_y < (clock_y + 5 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[5];

assign  rd_en_clock_ge_3 = (((pix_x >= (clock_x + 25 + 32))
                            && (pix_x < (clock_x + 25 + 32 + clock_w))) 
                            &&((pix_y >= (clock_y + 30))
                            && ((pix_y < (clock_y + 30 +clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[4];

assign  rd_en_clock_ge_4 = (((pix_x >= (clock_x + 5 + 32 ))
                            && (pix_x < (clock_x + 5 + 32 + clock_l))) 
                            &&((pix_y >= (clock_y + 50))
                            && ((pix_y < (clock_y + 50 + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[3];

assign  rd_en_clock_ge_5 = (((pix_x >= (clock_x + 32))
                            && (pix_x < (clock_x + 32 + clock_w))) 
                            &&((pix_y >= (clock_y + 30))
                            && ((pix_y < (clock_y + 30 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[2];

assign  rd_en_clock_ge_6 = (((pix_x >= (clock_x + 32))
                            && (pix_x < (clock_x + 32 + clock_w))) 
                            &&((pix_y >= (clock_y + 5))
                            && ((pix_y < (clock_y + 5 + clock_l)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[1];

assign  rd_en_clock_ge_7 = (((pix_x >= (clock_x + 5 + 32))
                            && (pix_x < (clock_x + 5 + 32 + clock_l))) 
                            &&((pix_y >= (clock_y + 25))
                            && ((pix_y < (clock_y + 25 + clock_w)))))&&(GAME_SWITCH[1]||GAME_SWITCH[0])&&!GAME_OVER&&clock_ge[0];


//----------------------倒计时使能------------------------------//



//----------------------血条使能------------------------------//
wire  rd_en_blood_1,rd_en_blood_2;
wire  rd_en_blood_1_range,rd_en_blood_2_range;


assign  rd_en_blood_1 = pix_x >= (69+2+200-2*blood_1)
                            && pix_x < (69+202)
                            &&pix_y >= (33+2)
                            && pix_y < (33+12)&&GAME_SWITCH[1]&&!GAME_OVER;


assign  rd_en_blood_2 = pix_x >= (367+2)
                            && pix_x < (367+202-200+2*blood_2)
                            &&pix_y >= (33+2)
                            && pix_y < (33+12)&&GAME_SWITCH[1]&&!GAME_OVER;


assign  rd_en_blood_1_range = ( (pix_x >= 69&&pix_x<(69+2)&&pix_y>=33&&pix_y<(33+14))
                            || (pix_x < (69+204)&&pix_x>=(69+202)&&pix_y>=33&&pix_y<(33+14)) 
                            || (pix_y >= 33&&pix_y<(33+2)&&pix_x >= 69&&pix_x < (69+204))
                            || (pix_y < (33+14)&&pix_y>=(33+12)&&pix_x >= 69&&pix_x < (69+204)) )
                            &&GAME_SWITCH[1]&&!GAME_OVER;


assign  rd_en_blood_2_range = ( (pix_x >= 367&&pix_x<(367+2)&&pix_y>=33&&pix_y<(33+14))
                            || (pix_x < (367+204)&&pix_x>=(367+202)&&pix_y>=33&&pix_y<(33+14)) 
                            || (pix_y >= 33&&pix_y<(33+2)&&pix_x >= 367&&pix_x < (367+204))
                            || (pix_y < (33+14)&&pix_y>=(33+12)&&pix_x >= 367&&pix_x < (367+204)) )
                            &&GAME_SWITCH[1]&&!GAME_OVER;



//----------------------血条使能------------------------------//

//----------------------能量条使能------------------------------//
wire  rd_en_energy_1,rd_en_energy_2;
wire  rd_en_energy_range,rd_en_energy_2_range;


assign  rd_en_energy_1 = (pix_x >=  (69+2+200-2*energy_1)
                            && pix_x < (69+202)
                            && pix_y >= (447+2)
                            && pix_y < (447+12) )&&GAME_SWITCH[1]&&!GAME_OVER;
                          

assign  rd_en_energy_2 = (pix_x >= (367+2)
                            && pix_x < (367+202-200+2*energy_2)
                            && pix_y >= (447+2)
                            && pix_y < (447+12) )&&GAME_SWITCH[1]&&!GAME_OVER;


assign  rd_en_energy_1_range = ( (pix_x >= 69&&pix_x<(69+2)&&pix_y>=447&&pix_y<(447+14))
                            || (pix_x < (69+204)&&pix_x>=(69+202)&&pix_y>=447&&pix_y<(447+14)) 
                            || (pix_y >= 447&&pix_y<(447+2)&&pix_x >= 69&&pix_x < (69+204))
                            || (pix_y < (447+14)&&pix_y>=(447+12)&&pix_x >= 69&&pix_x < (69+204)) )
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_2_range = ( (pix_x >= 367&&pix_x<(367+2)&&pix_y>=447&&pix_y<(447+14))
                            || (pix_x < (367+204)&&pix_x>=(367+202)&&pix_y>=447&&pix_y<(447+14)) 
                            || (pix_y >= 447&&pix_y<(447+2)&&pix_x >= 367&&pix_x < (367+204))
                            || (pix_y < (447+14)&&pix_y>=(447+12)&&pix_x >= 367&&pix_x < (367+204)) )
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_1_1 = (pix_x>=71&&pix_x<79&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_1>=2'd1)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_1_2 = (pix_x>=81&&pix_x<89&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_1>=2'd2)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_1_3 = (pix_x>=91&&pix_x<99&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_1>=2'd3)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_2_1 = (pix_x>=561&&pix_x<569&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_2>=2'd1)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_2_2 = (pix_x>=551&&pix_x<559&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_2>=2'd2)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_2_3 = (pix_x>=541&&pix_x<549&&pix_y>=437&&pix_y<437+10)
                            &&(energy_count_2>=2'd3)
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_1_range = ( (pix_x >= 69&&pix_x<(69+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 79&&pix_x<(79+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 89&&pix_x<(89+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 99&&pix_x<(99+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 69&&pix_x<(99+2)&&pix_y>=435&&pix_y<437) )                          
                            &&GAME_SWITCH[1]&&!GAME_OVER;

assign  rd_en_energy_green_2_range = ( (pix_x >= 569&&pix_x<(569+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 559&&pix_x<(559+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 549&&pix_x<(549+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 539&&pix_x<(539+2)&&pix_y>=437&&pix_y<(437+10))
                            || (pix_x >= 539&&pix_x<(569+2)&&pix_y>=435&&pix_y<437) )
                            &&GAME_SWITCH[1]&&!GAME_OVER;

//----------------------能量条使能------------------------------//


//----------------------SDRAM图片载入完成信号------------------------------//
reg load_over;
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        load_over   <=  1'b0;
    else if((pix_x==639)&&(pix_y==479)&&(photo_load_cnt==PHOTO_NUM+8'd1)&&GAME_SWITCH[1])
        load_over   <=  1'b1;
    else if(!GAME_SWITCH[1])
        load_over   <=  1'b0;
    else load_over <= load_over;

//----------------------SDRAM图片载入完成信号------------------------------//

//----------------------人物1使能------------------------------//
wire rd_en_figure_1,rd_en_figure_1_2;
assign  rd_en_figure_1 =  (((pix_x >= (figure_x_1))
                && (pix_x < (figure_x_1 + 128)))     
                &&((pix_y >= (figure_y_1)) 
                && ((pix_y < (figure_y_1 + 190)))))&&GAME_SWITCH[1]&&!GAME_OVER&&load_over;

//----------------------人物1使能------------------------------//

//----------------------人物2使能------------------------------//
wire rd_en_figure_2,rd_en_figure_2_2;
assign  rd_en_figure_2 =  (((pix_x >= (figure_x_2))
                && (pix_x < (figure_x_2 + 128)))     
                &&((pix_y >= (figure_y_2)) 
                && ((pix_y < (figure_y_2 + 190)))))&&GAME_SWITCH[1]&&!GAME_OVER&&load_over;

//----------------------人物2使能------------------------------//


//----------------------读SDRAM使能------------------------------//

assign sdram_rd_en = rd_en_figure_1|rd_en_figure_2;

//----------------------读SDRAM使能------------------------------//


//----------------------所有图片显示区域划定-----------------------------------//
//pic_valid:图片数据有效信号
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        pic_valid   <=  1'b1;
    else
        pic_valid   <=  rd_en|rd_en1|rd_en2|rd_en3|rd_en4|back_photo_req;

//----------------------所有图片显示区域划定-----------------------------------//



//----------------------水果忍者读地址切换-----------------------------------//
//rom_addr:读ROM地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr    <=  14'd0;
    else    if(rom_addr == (PIC_SIZE - 1'b1))
        rom_addr    <=  14'd0;
    else    if(rd_en == 1'b1)
        rom_addr    <=  rom_addr + 1'b1;
    else if(rd_en == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr    <=  14'd0;



//rom_addr1:读ROM地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr1    <=  14'd0;
    else    if(rom_addr1 == (PIC_SIZE - 1'b1))
        rom_addr1    <=  14'd0;
    else    if(rd_en1 == 1'b1)
        rom_addr1    <=  rom_addr1 + 1'b1;
    else if(rd_en1 == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr1    <=  14'd0;

//rom_addr2:读ROM地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr2    <=  14'd0;
    else    if(rom_addr2 == (PIC_SIZE - 1'b1))
        rom_addr2    <=  14'd0;
    else    if(rd_en2 == 1'b1)
        rom_addr2    <=  rom_addr2 + 1'b1;
    else if(rd_en2 == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr2    <=  14'd0;

//rom_addr3:读ROM地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr3    <=  14'd0;
    else    if(rom_addr3 == (PIC_SIZE - 1'b1))
        rom_addr3    <=  14'd0;
    else    if(rd_en3 == 1'b1)
        rom_addr3    <=  rom_addr3 + 1'b1;
    else if(rd_en3 == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr3    <=  14'd0;


//rom_addr4:读ROM地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr4    <=  14'd0;
    else    if(rom_addr4 == (PIC_SIZE - 1'b1))
        rom_addr4    <=  14'd0;
    else    if(rd_en4 == 1'b1)
        rom_addr4    <=  rom_addr4 + 1'b1;
    else if(rd_en4 == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr4    <=  14'd0;


always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rom_addr    <=  14'd0;
    else    if(rom_addr == (PIC_SIZE - 1'b1))
        rom_addr    <=  14'd0;
    else    if(rd_en == 1'b1)
        rom_addr    <=  rom_addr + 1'b1;
    else if(rd_en == 1'b0&&!GAME_SWITCH[0]&&!GAME_OVER)
        rom_addr    <=  14'd0;

//----------------------水果忍者读地址切换-----------------------------------//

//----------------------拳皇读地址切换-----------------------------------//

wire [20:0] display_y_1;
wire [20:0] display_y_2;
assign display_y_1 = pix_y-figure_y_1;
assign display_y_2 = pix_y-figure_y_2;


reg [20:0] sdram_addr_1;
//sdram_addr_1:读sdram地址
always@(posedge vga_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0) begin
        sdram_addr_1    <=  PHOTO_TOTAL_PIX;
    end

    else    if(rd_en_figure_1 == 1'b1)  begin

//----------------------人物1站立---------------------------//
        if(figure_state_1==IDLE) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*0;
            end
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*1;
            end
        end 
//----------------------人物1站立---------------------------//
//----------------------人物1移动---------------------------//
        else if(figure_state_1==MOVE) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*2;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*3;
            end
        end
//----------------------人物1移动---------------------------//
//----------------------人物1防御---------------------------//
        else if(figure_state_1==DEFENSE) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*4;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*5;
            end
        end
//----------------------人物1防御---------------------------//
//----------------------人物1轻拳---------------------------//
        else if(figure_state_1==LIGHTPUNCH) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*13;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*14;
            end
        end
//----------------------人物1轻拳---------------------------//
//----------------------人物1重拳---------------------------//
        else if(figure_state_1==HEAVYPUNCH) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*34;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*35;
            end
        end
//----------------------人物1重拳---------------------------//

//----------------------人物1轻踢---------------------------//
        else if(figure_state_1==LIGHTKICK) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*15;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*16;
            end
        end
//----------------------人物1轻踢---------------------------//

//----------------------人物1重踢---------------------------//
        else if(figure_state_1==HEAVYKICK) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*36;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*37;
            end
        end
//----------------------人物1重踢---------------------------//

//----------------------人物1跳跃---------------------------//
        else if(figure_state_1==JUMP) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*11;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*12;
            end
        end
//----------------------人物1跳跃---------------------------//

//----------------------人物1受击---------------------------//
        else if(figure_state_1==HIT) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*6;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*7;
            end
        end
//----------------------人物1受击---------------------------//

//----------------------人物1大招---------------------------//
        else if(figure_state_1==JINENG) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*8;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*9;
            end
        end
//----------------------人物1大招---------------------------//
//----------------------人物1技能受击---------------------------//
        else if(figure_state_1==JINENGHIT) begin
            if(figure_toward_1==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*42;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_1<<7)+PIC_TOTAL_PIC*43;
            end
        end
//----------------------人物1技能受击---------------------------//
        else sdram_addr_1    <=  sdram_addr_1;
    end



    else    if(rd_en_figure_2 == 1'b1) begin
//----------------------人物2站立---------------------------//
        if(figure_state_2==IDLE) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*17;
            end
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*18;
            end
        end 
//----------------------人物2站立---------------------------//
//----------------------人物2移动---------------------------//
        else if(figure_state_2==MOVE) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*19;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*20;
            end
        end
//----------------------人物2移动---------------------------//
//----------------------人物2防御---------------------------//
        else if(figure_state_2==DEFENSE) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*21;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*22;
            end
        end
//----------------------人物2防御---------------------------//
//----------------------人物2轻拳---------------------------//
        else if(figure_state_2==LIGHTPUNCH) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*30;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*31;
            end
        end
//----------------------人物2轻拳---------------------------//
//----------------------人物2重拳---------------------------//
        else if(figure_state_2==HEAVYPUNCH) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*38;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*39;
            end
        end
//----------------------人物2重拳---------------------------//

//----------------------人物2轻踢---------------------------//
        else if(figure_state_2==LIGHTKICK) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*32;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*33;
            end
        end
//----------------------人物2轻踢---------------------------//

//----------------------人物2重踢---------------------------//
        else if(figure_state_2==HEAVYKICK) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*40;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*41;
            end
        end
//----------------------人物2重踢---------------------------//

//----------------------人物2跳跃---------------------------//
        else if(figure_state_2==JUMP) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*28;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*29;
            end
        end
//----------------------人物2跳跃---------------------------//

//----------------------人物2受击---------------------------//
        else if(figure_state_2==HIT) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*23;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*24;
            end
        end
//----------------------人物2受击---------------------------//

//----------------------人物2大招---------------------------//
        else if(figure_state_2==JINENG) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*25;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*26;
            end
        end
//----------------------人物2大招---------------------------//
//----------------------人物2技能受击---------------------------//
        else if(figure_state_2==JINENGHIT) begin
            if(figure_toward_2==LEFT) begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*44;
            end 
            else begin
                sdram_addr_1    <=  PHOTO_TOTAL_PIX+(display_y_2<<7)+PIC_TOTAL_PIC*45;
            end
        end
//----------------------人物2技能受击---------------------------//

        else sdram_addr_1    <=  sdram_addr_1;
    end




    else begin
        sdram_addr_1 <= sdram_addr_1;
    end

assign  sdram_rst = (pix_x ==10'h3ff||pix_x == figure_x_1||pix_x == figure_x_2 )?1'd1:1'd0;   //读sdram地址载入使能
assign  sdram_addr_out = sdram_addr_1;                         //SDRAM读起始地址
assign  sdram_addr_out_end = sdram_addr_1+128;                 //SDRAM读最大地址


//----------------------拳皇读地址切换-----------------------------------//



// //----------------------人物1计数器-----------------------------------//

// reg               figure_flag1;          // 图片切换标志位
// reg    [24:0]     figure_cnt1;             // 图片切换计数器
// always @(posedge vga_clk or negedge sys_rst_n) begin
//     if(!sys_rst_n|GAME_SWITCH[1]==1'b0|GAME_OVER) begin
//         figure_cnt1 <= 25'd0;
//         figure_flag1<= 1'b0;
//     end
//     else begin
//         if(figure_cnt1 >= figure1_TIME - 1'b1&&rd_en_figure_1_2==0&&rd_en_figure_1==0) begin      
//             figure_cnt1 <= 25'd0;
//             figure_flag1 <= ~figure_flag1;
//         end
//         else begin
//             figure_cnt1 <= figure_cnt1 + 25'd1;
//         end
                
//     end
// end
// //----------------------人物1计数器-----------------------------------//

// //----------------------人物2计数器-----------------------------------//

// reg               figure_flag2;          // 图片切换标志位
// reg    [24:0]     figure_cnt2;             // 图片切换计数器
// always @(posedge vga_clk or negedge sys_rst_n) begin
//     if(!sys_rst_n|GAME_SWITCH[1]==1'b0|GAME_OVER) begin
//         figure_cnt2 <= 25'd0;
//         figure_flag2<= 1'b0;
//     end
//     else begin
//         if(figure_cnt2 >= figure2_TIME - 1'b1&&rd_en_figure_2_2==0&&rd_en_figure_2==0) begin      
//             figure_cnt2 <= 25'd0;
//             figure_flag2 <= ~figure_flag2;
//         end
//         else begin
//             figure_cnt2 <= figure_cnt2 + 25'd1;
//         end
                
//     end
// end
// //----------------------人物2计数器-----------------------------------//







//----------------------最终像素输出-----------------------------------//
reg change_flag_r,change_flag_l;

always @(posedge vga_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        pic_data <= 0;
    end
    else begin

        //----------------------水果忍者显示像素mux-----------------------------------//
        if(rd_en|rd_en1&&!rd_en2&&!rd_en3&&!rd_en4&&GAME_SWITCH[0]) begin
            if (rd_en&&rd_en1) begin
                if ((knife != IGNORE)&&!(banana != BACKGROUND))
                    pic_data <= knife;
                else if(!(knife != IGNORE)&&(banana != BACKGROUND))
                    pic_data <= banana;
                else if((knife != IGNORE)&&(banana != BACKGROUND))
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(rd_en&&!rd_en1) begin
                if (knife != IGNORE)
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(!rd_en&&rd_en1) 
                if (banana != BACKGROUND)
                    pic_data <= banana;
                else pic_data <= back_photo_rgb;
            else pic_data <= back_photo_rgb;
        end

        else if(rd_en|!rd_en1&&rd_en2&&!rd_en3&&!rd_en4&&GAME_SWITCH[0]) begin
            if (rd_en&&rd_en2) begin
                if ((knife != IGNORE)&&!(apple != BACKGROUND))
                    pic_data <= knife;
                else if(!(knife != IGNORE)&&(apple != BACKGROUND))
                    pic_data <= apple;
                else if((knife != IGNORE)&&(apple != BACKGROUND))
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(rd_en&&!rd_en2) begin
                if (knife != IGNORE)
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(!rd_en&&rd_en2) 
                if (apple != BACKGROUND)
                    pic_data <= apple;
                else pic_data <= back_photo_rgb;
            else pic_data <= back_photo_rgb;
        end

        else if(rd_en|!rd_en1&&!rd_en2&&rd_en3&&!rd_en4&&GAME_SWITCH[0]) begin
            if (rd_en&&rd_en3) begin
                if ((knife != IGNORE)&&!(watermelon != BACKGROUND))
                    pic_data <= knife;
                else if(!(knife != IGNORE)&&(watermelon != BACKGROUND))
                    pic_data <= watermelon;
                else if((knife != IGNORE)&&(watermelon != BACKGROUND))
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(rd_en&&!rd_en3) begin
                if (knife != IGNORE)
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(!rd_en&&rd_en3) 
                if (watermelon != BACKGROUND)
                    pic_data <= watermelon;
                else pic_data <= back_photo_rgb;
            else pic_data <= back_photo_rgb;
        end

        else if(rd_en|!rd_en1&&!rd_en2&&!rd_en3&&rd_en4&&GAME_SWITCH[0]) begin
            if (rd_en&&rd_en4) begin
                if ((knife != IGNORE)&&!(pineapple != BACKGROUND))
                    pic_data <= knife;
                else if(!(knife != IGNORE)&&(pineapple != BACKGROUND))
                    pic_data <= pineapple;
                else if((knife != IGNORE)&&(pineapple != BACKGROUND))
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(rd_en&&!rd_en4) begin
                if (knife != IGNORE)
                    pic_data <= knife;
                else pic_data <= back_photo_rgb;
            end
            else if(!rd_en&&rd_en4) 
                if (pineapple != BACKGROUND)
                    pic_data <= pineapple;
                else pic_data <= back_photo_rgb;
            else pic_data <= back_photo_rgb;
        end
        //----------------------水果忍者显示像素mux-----------------------------------//

        //--------------------------拳皇显示像素mux-----------------------------------//
        else if(rd_en_clock_shi_1|rd_en_clock_shi_2|rd_en_clock_shi_3|rd_en_clock_shi_4|rd_en_clock_shi_5|rd_en_clock_shi_6|rd_en_clock_shi_7|
                rd_en_clock_ge_1 |rd_en_clock_ge_2 |rd_en_clock_ge_3 |rd_en_clock_ge_4 |rd_en_clock_ge_5 |rd_en_clock_ge_6 |rd_en_clock_ge_7
                &&(GAME_SWITCH[1]||GAME_SWITCH[0])) begin
            pic_data <= RED;
        end

        else if(rd_en_blood_1|rd_en_blood_2|rd_en_blood_1_range|rd_en_blood_2_range&&GAME_SWITCH[1]) begin
            if(rd_en_blood_1|rd_en_blood_2&&!rd_en_blood_1_range&&!rd_en_blood_2_range) pic_data <= RED;
            else pic_data <= BLACK;
        end

        else if(rd_en_energy_1|rd_en_energy_2|rd_en_energy_1_range|rd_en_energy_2_range&&GAME_SWITCH[1]) begin
            if(rd_en_energy_1|rd_en_energy_2&&!rd_en_energy_1_range&&!rd_en_energy_2_range) pic_data <= ORANGE;
            else pic_data <= BLACK;
        end

        else if(rd_en_energy_green_1_1|rd_en_energy_green_1_2|rd_en_energy_green_1_3|
                rd_en_energy_green_2_1|rd_en_energy_green_2_2|rd_en_energy_green_2_3|
                rd_en_energy_green_1_range|rd_en_energy_green_2_range&&GAME_SWITCH[1])begin
             if(rd_en_energy_green_1_1|rd_en_energy_green_1_2|rd_en_energy_green_1_3|
                rd_en_energy_green_2_1|rd_en_energy_green_2_2|rd_en_energy_green_2_3
                &&!rd_en_energy_green_1_range&&!rd_en_energy_green_2_range) pic_data <= GREEN;
            else pic_data<=BLACK;
        end

        else if(sdram_rd_en&&GAME_SWITCH[1]&&pix_x>=0&&pix_x<640&&pix_y>=0&&pix_y<480) begin
            if(sd_photo_rgb_1==16'hffff)
                pic_data <= back_photo_rgb;
            else
                 pic_data <= sd_photo_rgb_1;
        end


        //--------------------------拳皇显示像素mux-----------------------------------//


        else pic_data <= back_photo_rgb;


    end
end


//pix_data_out:输出VGA显示图像数据
assign  pix_data_out = (pic_valid == 1'b1) ? pic_data : back_photo_rgb;

//----------------------最终像素输出-----------------------------------//



//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//

//-------------rom_pic_inst-------------

//----------------------水果忍者图片rom-----------------------------------//
/*
rom_pic rom_pic_knife
(
    .addra    (rom_addr   ),  //输入读ROM地址,14bit
    .clka      (vga_clk    ),  //输入读时钟,vga_clk,频率25MHz,1bit
    .rsta       (~rd_en      ),  //输入读使能,1bit

    .doa          (knife   )   //输出读数据,16bit
);

rom_pic2 rom_pic_banana
(
    .addra    (rom_addr1   ),  //输入读ROM地址,14bit
    .clka      (vga_clk    ),  //输入读时钟,vga_clk,频率25MHz,1bit
    .rsta       (~rd_en1      ),  //输入读使能,1bit

    .doa          (banana   )   //输出读数据,16bit
);

rom_pic3 rom_pic_apple
(
    .addra    (rom_addr2   ),  //输入读ROM地址,14bit
    .clka      (vga_clk    ),  //输入读时钟,vga_clk,频率25MHz,1bit
    .rsta       (~rd_en2      ),  //输入读使能,1bit

    .doa          (apple   )   //输出读数据,16bit
);

rom_pic4 rom_pic_watermelon
(
    .addra    (rom_addr3   ),  //输入读ROM地址,14bit
    .clka      (vga_clk    ),  //输入读时钟,vga_clk,频率25MHz,1bit
    .rsta       (~rd_en3      ),  //输入读使能,1bit

    .doa          (watermelon   )   //输出读数据,16bit
);

rom_pic5 rom_pic_pineapple
(
    .addra    (rom_addr4   ),  //输入读ROM地址,14bit
    .clka      (vga_clk    ),  //输入读时钟,vga_clk,频率25MHz,1bit
    .rsta       (~rd_en4      ),  //输入读使能,1bit

    .doa          (pineapple   )   //输出读数据,16bit
);
*/
//----------------------水果忍者图片rom-----------------------------------//






endmodule
