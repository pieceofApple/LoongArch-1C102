//**************************************************************************
// *** 名称 : sdram_4port_top
// *** 作者 : 正点原子
// *** 日期 : 2019/7/18
// *** 描述 : SDRAM 控制器顶层模块
//**************************************************************************

module  sdram_4port_top
//========================< 端口 >==========================================
(
input                       ref_clk                 , //SDRAM 控制器参考时钟
input                       out_clk                 , //用于输出的相位偏移时钟
input                       rst_n                   , //系统复位
//通道0 ---------------------------------------------
input       [23:0]          ch0_min_addr            , //通道0 起始地址
input       [23:0]          ch0_max_addr            , //通道0 结束地址                              
input                       ch0_wr_clk              , //通道0 写端口FIFO0: 写时钟 
input                       ch0_wr_req              , //通道0 写端口FIFO0: 写请求 
input       [15:0]          ch0_wr_data             , //通道0 写端口FIFO0: 写数据
input                       ch0_rd_clk              , //通道0 读端口FIFO0: 读时钟
input                       ch0_rd_req              , //通道0 读端口FIFO0: 读请求
output      [15:0]          ch0_rd_data             , //通道0 读端口FIFO0: 读数据
//通道1 ---------------------------------------------
input       [23:0]          ch1_min_addr            , //通道1 起始地址
input       [23:0]          ch1_max_addr            , //通道1 结束地址           
input                       ch1_wr_clk              , //通道1 写端口FIFO0: 写时钟
input                       ch1_wr_req              , //通道1 写端口FIFO0: 写请求
input       [15:0]          ch1_wr_data             , //通道1 写端口FIFO0: 写数据
input                       ch1_rd_clk              , //通道1 读端口FIFO0: 读时钟
input                       ch1_rd_req              , //通道1 读端口FIFO0: 读请求
output      [15:0]          ch1_rd_data             , //通道1 读端口FIFO0: 读数据
//读写设置 ------------------------------------------
input       [ 9:0]          wr_length               , //写SDRAM时的数据突发长度 
input                       wr_load                 , //写端口复位: 复位写地址,清空写FIFO 
input       [ 9:0]          rd_length               , //从SDRAM中读数据时的突发长度 
input                       rd_load                 , //读端口复位: 复位读地址,清空读FIFO
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
output      [12:0]          sdram_addr              , //SDRAM 行/列地址
inout       [15:0]          sdram_dq                , //SDRAM 数据
output      [ 1:0]          sdram_dqm                 //SDRAM 数据掩码
);
//========================< 端口 >==========================================
//write ---------------------------------------------
wire                        sdram_wr_req            ; //SDRAM 写请求
wire                        sdram_wr_ack            ; //SDRAM 写响应
wire        [23:0]          sdram_wr_addr           ; //SDRAM 写地址
wire        [15:0]          sdram_din               ; //写入SDRAM中的数据
//read ----------------------------------------------
wire                        sdram_rd_req            ; //SDRAM 读请求
wire                        sdram_rd_ack            ; //SDRAM 读响应
wire        [23:0]          sdram_rd_addr           ; //SDRAM 读地址
wire        [15:0]          sdram_dout              ; //从SDRAM中读出的数据
//==========================================================================
//==                        信号设置
//========================================================================== 
assign  sdram_clk = out_clk; //将相位偏移时钟输出给sdram芯片
assign  sdram_dqm = 2'b00;   //读写过程中均不屏蔽数据线       
//==========================================================================
//==                        SDRAM 读写端口FIFO控制模块
//==========================================================================
sdram_fifo_ctrl u_sdram_fifo_ctrl
(
    .clk_ref                (ref_clk                ), //SDRAM控制器时钟
    .rst_n                  (rst_n                  ), //系统复位
    //通道0 -----------------------------------------
    .ch0_min_addr           (ch0_min_addr           ), //通道0 起始地址
    .ch0_max_addr           (ch0_max_addr           ), //通道0 结束地址                                                      
    .ch0_wr_clk             (ch0_wr_clk             ), //通道0 写端口FIFO0: 写时钟 
    .ch0_wr_req             (ch0_wr_req             ), //通道0 写端口FIFO0: 写请求 
    .ch0_wr_data            (ch0_wr_data            ), //通道0 写端口FIFO0: 写数据
    .ch0_rd_clk             (ch0_rd_clk             ), //通道0 读端口FIFO0: 读时钟
    .ch0_rd_req             (ch0_rd_req             ), //通道0 读端口FIFO0: 读请求
    .ch0_rd_data            (ch0_rd_data            ), //通道0 读端口FIFO0: 读数据
    //通道1 ----------------------------------------- 
    .ch1_min_addr           (ch1_min_addr           ), //通道1 起始地址
    .ch1_max_addr           (ch1_max_addr           ), //通道1 结束地址           
    .ch1_wr_clk             (ch1_wr_clk             ), //通道1 写端口FIFO0: 写时钟
    .ch1_wr_req             (ch1_wr_req             ), //通道1 写端口FIFO0: 写请求
    .ch1_wr_data            (ch1_wr_data            ), //通道1 写端口FIFO0: 写数据
    .ch1_rd_clk             (ch1_rd_clk             ), //通道1 读端口FIFO0: 读时钟
    .ch1_rd_req             (ch1_rd_req             ), //通道1 读端口FIFO0: 读请求
    .ch1_rd_data            (ch1_rd_data            ), //通道1 读端口FIFO0: 读数据
    //读写设置 --------------------------------------
    .wr_length              (wr_length              ), //写SDRAM时的数据突发长度
    .wr_load                (wr_load                ), //写端口复位: 复位写地址,清空写FIFO
    .rd_length              (rd_length              ), //从SDRAM中读数据时的突发长度
    .rd_load                (rd_load                ), //读端口复位: 复位读地址,清空读FIFO
    //用户控制端口 ----------------------------------
    .sdram_init_done        (sdram_init_done        ), //SDRAM 初始化完成标志
    .sdram_pingpang_en      (sdram_pingpang_en      ), //SDRAM 乒乓操作使能
    //SDRAM 控制器写端口 ----------------------------
    .sdram_wr_req           (sdram_wr_req           ), //SDRAM 写请求
    .sdram_wr_ack           (sdram_wr_ack           ), //SDRAM 写响应
    .sdram_wr_addr          (sdram_wr_addr          ), //SDRAM 写地址
    .sdram_din              (sdram_din              ), //写入SDRAM中的数据
    //SDRAM 控制器读端口 ----------------------------
    .sdram_rd_req           (sdram_rd_req           ), //SDRAM 读请求
    .sdram_rd_ack           (sdram_rd_ack           ), //SDRAM 读响应
    .sdram_rd_addr          (sdram_rd_addr          ), //SDRAM 读地址
    .sdram_dout             (sdram_dout             )  //从SDRAM中读出的数据
);
//==========================================================================
//==                        SDRAM控制器
//==========================================================================
sdram_controller u_sdram_controller
(
    .clk                    (ref_clk                ), //SDRAM 控制器时钟
    .rst_n                  (rst_n                  ), //系统复位
    //SDRAM 控制器写端口 ----------------------------
    .sdram_wr_req           (sdram_wr_req           ), //SDRAM 写请求
    .sdram_wr_ack           (sdram_wr_ack           ), //SDRAM 写响应
    .sdram_wr_addr          (sdram_wr_addr          ), //SDRAM 写地址
    .sdram_wr_burst         (wr_length              ), //写sdram时数据突发长度
    .sdram_din              (sdram_din              ), //写入sdram中的数据
    //SDRAM 控制器读端口 ----------------------------
    .sdram_rd_req           (sdram_rd_req           ), //SDRAM 读请求
    .sdram_rd_ack           (sdram_rd_ack           ), //SDRAM 读响应
    .sdram_rd_addr          (sdram_rd_addr          ), //SDRAM 读地址
    .sdram_rd_burst         (rd_length              ), //读SDRAM时数据突发长度
    .sdram_dout             (sdram_dout             ), //从SDRAM中读出的数据
    //SDRAM 控制器初始化 ----------------------------
    .sdram_init_done        (sdram_init_done        ), //SDRAM 初始化完成标志
    //SDRAM 芯片接口 --------------------------------
    .sdram_cke              (sdram_cke              ), //SDRAM 时钟有效
    .sdram_cs_n             (sdram_cs_n             ), //SDRAM 片选
    .sdram_ras_n            (sdram_ras_n            ), //SDRAM 行有效  
    .sdram_cas_n            (sdram_cas_n            ), //SDRAM 列有效
    .sdram_we_n             (sdram_we_n             ), //SDRAM 写有效
    .sdram_ba               (sdram_ba               ), //SDRAM Bank地址
    .sdram_addr             (sdram_addr             ), //SDRAM 行/列地址
    .sdram_dq               (sdram_dq               )  //SDRAM 数据   
);

    
endmodule