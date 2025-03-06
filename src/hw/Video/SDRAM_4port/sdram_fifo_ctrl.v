//**************************************************************************
// *** 名称 : sdram_fifo_ctrl
// *** 作者 : 正点原子
// *** 日期 : 2019/7/18
// *** 描述 : SDRAM 读写端口FIFO控制模块
//**************************************************************************

module sdram_fifo_ctrl
(
input                       clk_ref                 , //SDRAM控制器时钟
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
input                       sdram_init_done         , //SDRAM 初始化完成标志
input                       sdram_pingpang_en       , //SDRAM 乒乓操作使能
//SDRAM 控制器写端口 --------------------------------
output  reg                 sdram_wr_req            , //SDRAM 写请求
input                       sdram_wr_ack            , //SDRAM 写响应
output  reg     [23:0]      sdram_wr_addr           , //SDRAM 写地址
output          [15:0]      sdram_din               , //写入SDRAM中的数据 
//SDRAM 控制器读端口 --------------------------------
output  reg                 sdram_rd_req            , //SDRAM 读请求
input                       sdram_rd_ack            , //SDRAM 读响应
output  reg     [23:0]      sdram_rd_addr           , //SDRAM 读地址 
input           [15:0]      sdram_dout                //从SDRAM中读出的数据 
);
//========================< 参数 >==========================================
localparam IDLE             = 4'd0                  ; //空闲状态
localparam SDRAM_DONE       = 4'd1                  ; //SDRAM初始化完成状态
localparam WR_KEEP          = 4'd2                  ; //读FIFO保持状态
localparam RD_KEEP          = 4'd3                  ; //写FIFO保持状态
//========================< 信号 >==========================================
reg                         wr_ack_r1               ; //sdram写响应寄存器      
reg                         wr_ack_r2               ;
reg                         rd_ack_r1               ; //sdram读响应寄存器      
reg                         rd_ack_r2               ;
reg                         wr_load_r1              ; //写端口复位寄存器      
reg                         wr_load_r2              ;
reg                         rd_load_r1              ; //读端口复位寄存器      
reg                         rd_load_r2              ;
reg                         ch0_sw_bank_en          ;
reg                         ch1_sw_bank_en          ;
reg                         ch0_rw_bank_flag        ;
reg                         ch1_rw_bank_flag        ;
reg                         sw_wrFIFO               ; //写FIFO切换信号
reg                         sw_rdFIFO               ; //读FIFO切换信号
reg     [22:0]              ch0_rd_addr             ; //读FIFO0地址
reg     [22:0]              ch1_rd_addr             ; //读FIFO1地址
reg     [22:0]              ch0_wr_addr             ; //写FIFO0地址
reg     [22:0]              ch1_wr_addr             ; //写FIFO1地址
reg     [ 3:0]              state                   ; //读写FIFO控制状态
reg     [12:0]              rd_cnt                  ;
wire                        wr_done                 ;  //sdram_wr_ack 下降沿标志位      
wire                        rd_done                 ;  //sdram_rd_ack 下降沿标志位    
wire                        wr_load_pos             ;  //wr_load      上升沿标志位      
wire                        rd_load_pos             ;  //rd_load      上升沿标志位      
wire    [10:0]              wrFIFO_use0             ;  //写端口FIFO0中的数据量
wire    [10:0]              rdFIFO_use0             ;  //读端口FIFO0中的数据量
wire    [10:0]              wrFIFO_use1             ;  //写端口FIFO1中的数据量
wire    [10:0]              rdFIFO_use1             ;  //读端口FIFO1中的数据量
wire    [15:0]              sdram_dout0             ;  //读端口FIFO0中读出数据
wire    [15:0]              sdram_dout1             ;  //读端口FIFO1中读出数据
wire    [15:0]              sdram_din0              ;
wire    [15:0]              sdram_din1              ;
wire                        sdram_wr_ack0           ;
wire                        sdram_wr_ack1           ;
wire                        sdram_rd_ack0           ;
wire                        sdram_rd_ack1           ;
//==========================================================================
//==                        代码
//========================================================================== 
//检测下降沿
assign wr_done = wr_ack_r2 & ~wr_ack_r1;  
assign rd_done = rd_ack_r2 & ~rd_ack_r1;

//写端口FIFO0中读请求切换
assign sdram_wr_ack0 = sw_wrFIFO ? 1'b0 : sdram_wr_ack;

//写端口FIFO1中读请求切换
assign sdram_wr_ack1 = sw_wrFIFO ? sdram_wr_ack : 1'b0;

//读端口FIFO0中写请求切换
assign sdram_rd_ack0 = sw_rdFIFO ? 1'b0 : sdram_rd_ack;

//读端口FIFO1中写请求切换
assign sdram_rd_ack1 = sw_rdFIFO ? sdram_rd_ack : 1'b0;

//写端口FIFO中写数据切换，即选择哪个数据写道SDRAM中
assign sdram_din     = sw_wrFIFO ? sdram_din1 : sdram_din0;

//读端口FIFO中写数据切换，即选择读FIFO1来接收SDRAM中数据
assign sdram_dout0   = sw_rdFIFO ? 1'b0 : sdram_dout;

//读端口FIFO中写数据切换，即选择读FIFO0来接收SDRAM中数据
assign sdram_dout1   = sw_rdFIFO ? sdram_dout : 1'b0;

//检测上升沿
assign wr_load_pos   = ~wr_load_r2 & wr_load_r1;
assign rd_load_pos   = ~rd_load_r2 & rd_load_r1;

//寄存sdram写响应信号,用于捕获sdram_wr_ack下降沿
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n) begin
        wr_ack_r1 <= 1'b0;
        wr_ack_r2 <= 1'b0;
    end
    else begin
        wr_ack_r1 <= sdram_wr_ack;
        wr_ack_r2 <= wr_ack_r1;     
    end
end 

//寄存sdram读响应信号,用于捕获sdram_rd_ack下降沿
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n) begin
        rd_ack_r1 <= 1'b0;
        rd_ack_r2 <= 1'b0;
    end
    else begin
        rd_ack_r1 <= sdram_rd_ack;
        rd_ack_r2 <= rd_ack_r1;
    end
end 

//同步写端口复位信号，用于捕获wr_load上升沿
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n) begin
        wr_load_r1 <= 1'b0;
        wr_load_r2 <= 1'b0;
    end
    else begin
        wr_load_r1 <= wr_load;
        wr_load_r2 <= wr_load_r1;
    end
end

//同步读端口复位信号，同时用于捕获rd_load上升沿
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n) begin
        rd_load_r1 <= 1'b0;
        rd_load_r2 <= 1'b0;
    end
    else begin
        rd_load_r1 <= rd_load;
        rd_load_r2 <= rd_load_r1;
    end
end

//sdram写地址0产生模块
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n)begin
        ch0_wr_addr <= 23'd0;
        ch0_sw_bank_en <= 1'b0;
        ch0_rw_bank_flag <= 1'b0;
        
    end 
    else if(wr_load_pos)begin              //检测到写端口复位信号时，写地址复位
        ch0_wr_addr <= ch0_min_addr;
        ch0_rw_bank_flag    <= 0;
        ch0_sw_bank_en <= 0;
    end                                     //若突发写SDRAM结束更改写地址
    else if(wr_done && !sw_wrFIFO) begin    
        if(sdram_pingpang_en) begin         //SDRAM 读写乒乓使能
                                            //若未到达写SDRAM的结束地址写地址累加 
            if(ch0_wr_addr[21:0] < ch0_max_addr - wr_length)
                ch0_wr_addr <= ch0_wr_addr + wr_length;
            else begin                      //切换BANK
                ch0_rw_bank_flag    <= ~ch0_rw_bank_flag;   
                ch0_sw_bank_en <= 1'b1;        //拉高切换BANK使能信号
            end            
        end                                 //乒乓操作不使能时
                                            //判断是否到达结束地址                     
        else if(ch0_wr_addr < ch0_max_addr - wr_length)
                                            //没达结束地址，地址累加一个突发长度
            ch0_wr_addr <= ch0_wr_addr + wr_length;
        else                                //若已到达结束地址，则回到写起始地址
            ch0_wr_addr <= ch0_min_addr;
    end    
    else if(ch0_sw_bank_en) begin              //如果bank切换使能信号有效
        ch0_sw_bank_en <= 1'b0;                //将使能信号置0，方便下次使用
        if(ch0_rw_bank_flag == 1'b0)                //根据bank标志信号切换BANK
            ch0_wr_addr <= {1'b0,ch0_min_addr[21:0]};
        else
            ch0_wr_addr <= {1'b1,ch0_min_addr[21:0]};     
   end
end

//sdram写地址1产生模块
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n)begin
        ch1_wr_addr <= 23'd0;
        ch1_sw_bank_en <= 1'b0;
        ch1_rw_bank_flag <= 1'b0;
    end 
    else if(wr_load_pos)begin              //检测到写端口复位信号时，写地址复位
        ch1_rw_bank_flag    <= 0;
        ch1_sw_bank_en <= 0;
        ch1_wr_addr <= ch1_min_addr;
    end                                     //若突发写SDRAM结束，更改写地址
    else if(wr_done && sw_wrFIFO) begin
        if(sdram_pingpang_en) begin         //判断若SDRAM 读写乒乓使能
                                            //若未到达写SDRAM的结束地址写地址累加 
        if(ch1_wr_addr[21:0] < ch1_max_addr - wr_length)
                ch1_wr_addr <= ch1_wr_addr + wr_length;
            else begin                      //切换BANK
                ch1_rw_bank_flag    <= ~ch1_rw_bank_flag;   
                ch1_sw_bank_en <= 1'b1;        //拉高切换BANK使能信号
            end            
        end                                 //乒乓操作不使能
                                            //未到达写SDRAM的结束地址写地址累加
        else if(ch1_wr_addr < ch1_max_addr - wr_length)
            ch1_wr_addr <= ch1_wr_addr + wr_length;
            else                            //到达写SDRAM的结束地址回到写起始地址
            ch1_wr_addr <= ch1_min_addr;
    end
    else if(ch1_sw_bank_en) begin              //如果bank切换使能信号有效
        ch1_sw_bank_en <= 1'b0;                //将使能信号置0，方便下次使用
        if(ch1_rw_bank_flag == 1'b0)                //切换BANK
            ch1_wr_addr <= {1'b0,ch1_min_addr[21:0]};
        else
            ch1_wr_addr <= {1'b1,ch1_min_addr[21:0]};     
    end
end

//sdram读地址0产生模块
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n)
        ch0_rd_addr <= 23'd0;   
    else if(rd_load_pos)                     //检测到写端口复位信号时，写地址复位
        ch0_rd_addr <= ch0_min_addr;         //若突发读SDRAM结束，更改读地址
    else if(rd_done && !sw_rdFIFO ) begin
        if(sdram_pingpang_en) begin          //判断若SDRAM 读写乒乓使能  
                                             //若未到达SDRAM的结束地址则地址累加 
            if(ch0_rd_addr[21:0] < ch0_max_addr - rd_length)
                ch0_rd_addr <= ch0_rd_addr + rd_length;                                                
            else begin                       //到达读SDRAM的结束地址，回到读起始                     
                if(ch0_rw_bank_flag == 1'b0)         //根据rw_bank_flag的值切换读BANK地址
                    ch0_rd_addr <= {1'b1,ch0_min_addr[21:0]};
                else
                    ch0_rd_addr <= {1'b0,ch0_min_addr[21:0]};    
            end    
        end                                  //若乒乓操作未使能
                                             //未到达SDRAM的结束地址地址累加
        else if(ch0_rd_addr < ch0_max_addr - rd_length)
            ch0_rd_addr <= ch0_rd_addr + rd_length;
        else                                 //若到达SDRAM的结束地址回到起始地址
            ch0_rd_addr <= ch0_min_addr;
    end
end

//sdram读地址1产生模块
always @(posedge clk_ref or negedge rst_n) begin
    if(!rst_n)
        ch1_rd_addr <= 23'd0;   
    else if(rd_load_pos)                     //检测到复位信号时地址复位
        ch1_rd_addr <= ch1_min_addr;    
                                             //判断若突发读SDRAM结束
    else if(rd_done && sw_rdFIFO) begin
        if(sdram_pingpang_en) begin          //若SDRAM 读写乒乓使能 
                                             //若未到达SDRAM的结束地址则地址累加        
            if(ch1_rd_addr[21:0] < ch1_max_addr - rd_length)
                ch1_rd_addr <= ch1_rd_addr + rd_length;                                                
            else begin                       //到达读SDRAM的结束地址                    
                if(ch1_rw_bank_flag == 1'b0)         //根据rw_bank_flag的值切换BANK地址
                    ch1_rd_addr <= {1'b1,ch1_min_addr[21:0]};
                else
                    ch1_rd_addr <= {1'b0,ch1_min_addr[21:0]};    
            end    
        end                                  //如果乒乓操作没有使能
                                             //未到达SDRAM的结束地址地址累加
        else if(ch1_rd_addr < ch1_max_addr - rd_length)
            ch1_rd_addr <= ch1_rd_addr + rd_length;
        else                                 //若已到达SDRAM的结束地址回到起始地址
            ch1_rd_addr <= ch1_min_addr;
    end
end

//读写端四个FIFO的判断逻辑       
always@(posedge clk_ref or negedge rst_n) begin
    if(!rst_n) begin                     
        sdram_wr_req  <= 0;
        sdram_wr_addr <= 0;
        sw_wrFIFO     <= 0;
        
        sdram_rd_req  <= 0;
        sw_rdFIFO     <= 0;
        sdram_rd_addr <= 0;
        
        state <= IDLE;
    end
    else begin
        case(state)
            IDLE:begin
                if(sdram_init_done)
                    state <=  SDRAM_DONE;
             end
             SDRAM_DONE:begin
                if(wrFIFO_use0 >= wr_length) begin          //进入写端FIFO0的读状态状态
                    sdram_wr_req  <= 1;
                    sdram_wr_addr <= {1'b0,ch0_wr_addr};
                    sw_wrFIFO     <= 0;
                    
                    sdram_rd_req  <= 0;
                    sdram_rd_addr <= {1'b0,ch0_rd_addr};
                    sw_rdFIFO     <= 0;
                    
                    state <= WR_KEEP;
                end
        
                else if(wrFIFO_use1 >= wr_length) begin     //进入写端FIFO1的读状态状态
                    sdram_wr_req  <= 1;
                    sdram_wr_addr <= {1'b1,ch1_wr_addr};
                    sw_wrFIFO     <= 1;
                    
                    sdram_rd_req  <= 0;
                    sdram_rd_addr <= {1'b1,ch0_rd_addr};
                    sw_rdFIFO     <= 0;
                    
                    state <= WR_KEEP;
                end
                else if((rdFIFO_use0 < rd_length)) begin    //进入读端FIFO0的写状态状态
                    sdram_wr_req  <= 0;
                    sdram_wr_addr <= {1'b0,ch0_wr_addr};
                    sw_wrFIFO     <= 0;
                  
                    sdram_rd_req  <= 1;
                    sdram_rd_addr <= {1'b0,ch0_rd_addr};
                    sw_rdFIFO     <= 0;
                    
                    state <= RD_KEEP;
                end
                else if((rdFIFO_use1 < rd_length)) begin    //进入读端FIFO1的写状态状态
                    sdram_wr_req  <= 0;
                    sdram_wr_addr <= {1'b1,ch0_wr_addr};
                    sw_wrFIFO     <= 0;
                   
                    sdram_rd_req  <= 1;
                    sdram_rd_addr <= {1'b1,ch1_rd_addr};
                    sw_rdFIFO     <= 1;
                    
                    state <= RD_KEEP;
                end  
            end
            WR_KEEP:begin
                if(wr_done) begin                           //保持写状态
                    sdram_wr_req  <= 0;
                    sdram_wr_addr <= ch0_wr_addr;
                    sw_wrFIFO     <= 0;
                    
                    state <= SDRAM_DONE;
                end    
            end
            RD_KEEP:begin
                if(rd_done) begin                           //保持读状态
                    sdram_rd_req  <= 0;
                    sdram_rd_addr <= ch0_rd_addr;
                    sw_rdFIFO     <= 0;
                    
                    state <= SDRAM_DONE;
                end    
            end   
            default:state <= IDLE;                          //默认停在空闲状态
        endcase    
    end
end
//==========================================================================
//==                        作用：写端口FIFO
//==                        类型：异步时钟
//==                        深度：2048
//==                        模式：Standard
//==========================================================================

	sdram_fifo   u_wrFIFO_0(
		.Data(ch0_wr_data), //写数据
		.Reset(~rst_n | wr_load_pos), //异步清零信号
		.WrClk(ch0_wr_clk), //写时钟
		.RdClk(clk_ref), //读时钟
		.WrEn(ch0_wr_req), //写请求
		.RdEn(sdram_wr_ack0), //读请求
		.Rnum(wrFIFO_use0), //FIFO中的数据量
		.Q(sdram_din0) //读数据
	);
    
	sdram_fifo   u_wrFIFO_1(
		.Data(ch1_wr_data), //写数据
		.Reset(~rst_n | wr_load_pos), //异步清零信号
		.WrClk(ch1_wr_clk), //写时钟
		.RdClk(clk_ref), //读时钟
		.WrEn(ch1_wr_req), //写请求
		.RdEn(sdram_wr_ack1), //读请求
		.Rnum(wrFIFO_use1), //FIFO中的数据量
		.Q(sdram_din1) //读数据
	);  
//==========================================================================
//==                        作用：读端口FIFO
//==                        类型：异步时钟
//==                        深度：2048
//==                        模式：Standard
//==========================================================================

	rd_fifo u_rdFIFO_0(
		.Data(sdram_dout0), //input [15:0] Data
		.Reset(~rst_n | rd_load_pos), //input Reset
		.WrClk(clk_ref), //input WrClk
		.RdClk(ch0_rd_clk), //input RdClk
		.WrEn(sdram_rd_ack0), //input WrEn
		.RdEn(ch0_rd_req), //input RdEn
		.Wnum(rdFIFO_use0), //output [10:0] Wnum
		.Q(ch0_rd_data) //output [15:0] Q
	);

	rd_fifo u_rdFIFO_1(
        .Data(sdram_dout1), //input [15:0] Data
        .Reset(~rst_n | rd_load_pos), //input Reset
        .WrClk(clk_ref), //input WrClk
        .RdClk(ch1_rd_clk), //input RdClk
        .WrEn(sdram_rd_ack1), //input WrEn
        .RdEn(ch1_rd_req), //input RdEn
        .Wnum(rdFIFO_use1), //output [10:0] Wnum
        .Q(ch1_rd_data) //output [15:0] Q
	);

   
endmodule 