`include "config.v"

module godson_mcu_top (
	input         CLK50M,
	input         RSTN, //Y6  B34_L18_P
	output        pps_led,
	
	input  		  LJTAG_TRST,
	inout  		  LJTAG_TMS, LJTAG_TDO, LJTAG_TDI, LJTAG_TCK,

    inout           GPIO01,
	inout           GPIO13,
	inout           GPIO18,
	inout           GPIO19,
	inout           GPIO20,
	inout           GPIO34,
	
	//uart1
	input wire         uart1_rx_i,
	output wire        uart1_tx_o,

	//slave6
    input  wire [15:0]		key_game,


	//摄像头接口
    input   wire            ov5640_pclk ,  //摄像头数据像素时钟
    input   wire            ov5640_vsync,  //摄像头场同步信号
    input   wire            ov5640_href ,  //摄像头行同步信号
    input   wire    [7:0]   ov5640_data ,  //摄像头数据
    output  wire            ov5640_rst_n,  //摄像头复位信号，低电平有效
    output  wire            ov5640_pwdn ,  //摄像头时钟选择信号, 1:使用摄像头自带的晶振
    output  wire            sccb_scl    ,  //摄像头SCCB_SCL线
    inout   wire            sccb_sda    ,  //摄像头SCCB_SDA线	

	//SDRAM接口
    output  wire            sdram_clk   ,  //SDRAM 时钟
    output  wire            sdram_cke   ,  //SDRAM 时钟使能
    output  wire            sdram_cs_n  ,  //SDRAM 片选
    output  wire            sdram_ras_n ,  //SDRAM 行有效
    output  wire            sdram_cas_n ,  //SDRAM 列有效
    output  wire            sdram_we_n  ,  //SDRAM 写有效
    output  wire    [1:0]   sdram_ba    ,  //SDRAM Bank地址
    output  wire    [1:0]   sdram_dqm   ,  //SDRAM 数据掩码
    output  wire    [12:0]  sdram_addr  ,  //SDRAM 地址
    inout   wire    [15:0]  sdram_dq    ,  //SDRAM 数据

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/******图像输出***********************************************************************************/

	//SD卡接口              
	input           video_sd_miso     ,  //SD卡SPI串行输入数据信号
	output          video_sd_clk      ,  //SD卡SPI时钟信号
	output          video_sd_cs       ,  //SD卡SPI片选信号
	output          video_sd_mosi     ,  //SD卡SPI串行输出数据信号

	//VGA
    output  wire            vga_hs      ,  //行同步信号
    output  wire            vga_vs      ,  //场同步信号
    output  wire    [15:0]  vga_rgb        //红绿蓝三原色输出 

);

	parameter ADDR_APB = 32,
			  DATA_APB_8 = 8,
			  DATA_APB_32 = 32;
    parameter RESET_TIME = 8_000_000;// 1s   40_000_000  5s

	wire            clk_ext8m;

    wire            clk_50m         ;   //50mhz时钟,提供给显示部分驱动时钟
    wire [5:0]  interrupt = 6'h00;

	reg [29 : 0] rst_cnt = 0;
	always @(posedge CLK50M or negedge RSTN)
	begin
        if(!RSTN) rst_cnt <= 0;
		else if(rst_cnt==RESET_TIME) rst_cnt <= rst_cnt;
		else rst_cnt <= rst_cnt + 1;
	end
	wire por_rst_n = (rst_cnt == RESET_TIME) ? 1'b1 : 1'b0;

	reg [22 : 0] cnt = 0;
	always @(posedge clk_ext8m)
		begin
			cnt <= cnt + 1;
		end
		
	assign pps_led = cnt[21];

    wire pll_lock;
    Gowin_PLL  pll_CLK50M_to_8M(
        .lock(pll_lock),    //output lock
        .clkout0(clk_ext8m),//output 8m稳定时钟
        .clkout1(clk_50m), //output 50mhz稳定时钟
        .clkin(CLK50M), 	//input 输入时钟
        .reset(~por_rst_n)  //input 复位
    );


	//AXI
	wire [`LID         -1 :0] s1_awid;
	wire [`Lawaddr     -1 :0] s1_awaddr;
	wire [`Lawlen      -1 :0] s1_awlen;
	wire [`Lawsize     -1 :0] s1_awsize;
	wire [`Lawburst    -1 :0] s1_awburst;
	wire [`Lawlock     -1 :0] s1_awlock;
	wire [`Lawcache    -1 :0] s1_awcache;
	wire [`Lawprot     -1 :0] s1_awprot;
	wire                      s1_awvalid;
	wire                      s1_awready;
	wire [`LID         -1 :0] s1_wid;
	wire [`Lwdata      -1 :0] s1_wdata;
	wire [`Lwstrb      -1 :0] s1_wstrb;
	wire                      s1_wlast;
	wire                      s1_wvalid;
	wire                      s1_wready;
	wire [`LID         -1 :0] s1_bid;
	wire [`Lbresp      -1 :0] s1_bresp;
	wire                      s1_bvalid;
	wire                      s1_bready;
	wire [`LID         -1 :0] s1_arid;
	wire [`Laraddr     -1 :0] s1_araddr;
	wire [`Larlen      -1 :0] s1_arlen;
	wire [`Larsize     -1 :0] s1_arsize;
	wire [`Larburst    -1 :0] s1_arburst;
	wire [`Larlock     -1 :0] s1_arlock;
	wire [`Larcache    -1 :0] s1_arcache;
	wire [`Larprot     -1 :0] s1_arprot;
	wire                      s1_arvalid;
	wire                      s1_arready;
	wire [`LID         -1 :0] s1_rid;
	wire [`Lrdata      -1 :0] s1_rdata;
	wire [`Lrresp      -1 :0] s1_rresp;
	wire                      s1_rlast;
	wire                      s1_rvalid;
	wire                      s1_rready;

	//APB
	wire          			  apb0_psel;
	wire [ADDR_APB-1:0]       apb0_paddr;
	wire           			  apb0_pwrite;
	wire           			  apb0_penable;
	wire [DATA_APB_32-1:0]    apb0_pwdata;
	wire [DATA_APB_32-1:0]    apb0_prdata;
	wire           apb0_ack = apb0_penable;

	wire          			  apb1_psel;
	wire [ADDR_APB-1:0]       apb1_paddr;
	wire           			  apb1_pwrite;
	wire           			  apb1_penable;
	wire [DATA_APB_32-1:0]    apb1_pwdata;
	wire [DATA_APB_32-1:0]    apb1_prdata;
	wire           apb1_ack = apb1_penable;

	wire          			  apb2_psel;
	wire [ADDR_APB-1:0]       apb2_paddr;
	wire           			  apb2_pwrite;
	wire           			  apb2_penable;
	wire [DATA_APB_32-1:0]    apb2_pwdata;
	wire [DATA_APB_32-1:0]    apb2_prdata;
	wire           apb2_ack = apb2_penable;

	wire          			  apb3_psel;
	wire [ADDR_APB-1:0]       apb3_paddr;
	wire           			  apb3_pwrite;
	wire           			  apb3_penable;
	wire [DATA_APB_32-1:0]    apb3_pwdata;
	wire [DATA_APB_32-1:0]    apb3_prdata;
	wire           apb3_ack = apb3_penable;

	wire          			  apb4_psel;
	wire [ADDR_APB-1:0]       apb4_paddr;
	wire           			  apb4_pwrite;
	wire           			  apb4_penable;
	wire [DATA_APB_32-1:0]    apb4_pwdata;
	wire [DATA_APB_32-1:0]    apb4_prdata;
	wire           apb4_ack = apb4_penable;

	wire          			  apb5_psel;
	wire [ADDR_APB-1:0]       apb5_paddr;
	wire           			  apb5_pwrite;
	wire           			  apb5_penable;
	wire [DATA_APB_32-1:0]    apb5_pwdata;
	wire [DATA_APB_32-1:0]    apb5_prdata;
	wire           apb5_ack = apb5_penable;

    wire          			  apb6_psel;
	wire [ADDR_APB-1:0]       apb6_paddr;
	wire           			  apb6_pwrite;
	wire           			  apb6_penable;
	wire [DATA_APB_32-1:0]    apb6_pwdata;
	wire [DATA_APB_32-1:0]    apb6_prdata;
	wire           apb6_ack = apb6_penable;

	wire          			  apb7_psel;
	wire [ADDR_APB-1:0]       apb7_paddr;
	wire           			  apb7_pwrite;
	wire           			  apb7_penable;
	wire [DATA_APB_32-1:0]    apb7_pwdata;
	wire [DATA_APB_32-1:0]    apb7_prdata;
	wire           apb7_ack = apb7_penable;

	godson_mcu_cpu A_cpu
	(
		.reset            (pll_lock         ),// (por_rst_n        ),
		.clock            (clk_ext8m        ),

		//      gpio            //
		.apb0_psel        (apb0_psel        ),
		.apb0_paddr       (apb0_paddr       ),
		.apb0_pwrite      (apb0_pwrite      ),
		.apb0_penable     (apb0_penable     ),
		.apb0_pwdata      (apb0_pwdata      ),
		//外部信号不确定的问题,用最开始的历程也跑不通，仿真时只能置零
		.apb0_prdata      (apb0_prdata      ),//32'd0  apb0_prdata   
		.apb0_ack         (apb0_ack         ),

		//      pwm01            //
		.apb1_psel        (apb1_psel        ),
		.apb1_paddr       (apb1_paddr       ),
		.apb1_pwrite      (apb1_pwrite      ),
		.apb1_penable     (apb1_penable     ),
		.apb1_pwdata      (apb1_pwdata      ),
		.apb1_prdata      (apb1_prdata      ),
		.apb1_ack         (apb1_ack         ),

		//      timer            //
		.apb2_psel        (apb2_psel        ),
		.apb2_paddr       (apb2_paddr       ),
		.apb2_pwrite      (apb2_pwrite      ),
		.apb2_penable     (apb2_penable     ),
		.apb2_pwdata      (apb2_pwdata      ),
		.apb2_prdata      (apb2_prdata      ),
		.apb2_ack         (apb2_ack         ),

		//      interrupt            //
		.apb3_psel        (apb3_psel        ),
		.apb3_paddr       (apb3_paddr       ),
		.apb3_pwrite      (apb3_pwrite      ),
		.apb3_penable     (apb3_penable     ),
		.apb3_pwdata      (apb3_pwdata      ),
		.apb3_prdata      (apb3_prdata      ),
		.apb3_ack         (apb3_ack         ),

		//      uart            //
        .apb4_psel        (apb4_psel        ),
		.apb4_paddr       (apb4_paddr       ),
		.apb4_pwrite      (apb4_pwrite      ),
		.apb4_penable     (apb4_penable     ),
		.apb4_pwdata      (apb4_pwdata      ),
		.apb4_prdata      (apb4_prdata      ),
		.apb4_ack         (apb4_ack         ),

		//      iic           //
		.apb5_psel        (apb5_psel        ),
		.apb5_paddr       (apb5_paddr       ),
		.apb5_pwrite      (apb5_pwrite      ),
		.apb5_penable     (apb5_penable     ),
		.apb5_pwdata      (apb5_pwdata      ),
		.apb5_prdata      (apb5_prdata      ),
		.apb5_ack         (apb5_ack         ),

		//      spi            //
        .apb6_psel        (apb6_psel        ),
		.apb6_paddr       (apb6_paddr       ),
		.apb6_pwrite      (apb6_pwrite      ),
		.apb6_penable     (apb6_penable     ),
		.apb6_pwdata      (apb6_pwdata      ),
		.apb6_prdata      (apb6_prdata      ),
		.apb6_ack         (apb6_ack         ),

		//      Game            //
		.apb7_psel        (apb7_psel        ),
		.apb7_paddr       (apb7_paddr       ),
		.apb7_pwrite      (apb7_pwrite      ),
		.apb7_penable     (apb7_penable     ),
		.apb7_pwdata      (apb7_pwdata      ),
		.apb7_prdata      (apb7_prdata      ),
		.apb7_ack         (apb7_ack         ),

		.interrupt        (interrupt        ),

		.ljtag_trst_i     (LJTAG_TRST       ),
		.ljtag_tms_i      (LJTAG_TMS        ),
		.ljtag_tdo_o      (LJTAG_TDO        ),
		.ljtag_tdi_i      (LJTAG_TDI        ),
		.ljtag_tck_i      (LJTAG_TCK        ),

		.s1_awid(s1_awid),
		.s1_awaddr(s1_awaddr),
		.s1_awlen(s1_awlen),
		.s1_awsize(s1_awsize),
		.s1_awburst(s1_awburst),
		.s1_awlock(s1_awlock),
		.s1_awcache(s1_awcache),
		.s1_awprot(s1_awprot),
		.s1_awvalid(s1_awvalid),
		.s1_awready(s1_awready),
		.s1_wid(s1_wid),
		.s1_wdata(s1_wdata),
		.s1_wstrb(s1_wstrb),
		.s1_wlast(s1_wlast),
		.s1_wvalid(s1_wvalid),
		.s1_wready(s1_wready),
		.s1_bid(s1_bid),
		.s1_bresp(s1_bresp),
		.s1_bvalid(s1_bvalid),
		.s1_bready(s1_bready),
		.s1_arid(s1_arid),
		.s1_araddr(s1_araddr),
		.s1_arlen(s1_arlen),
		.s1_arsize(s1_arsize),
		.s1_arburst(s1_arburst),
		.s1_arlock(s1_arlock),
		.s1_arcache(s1_arcache),
		.s1_arprot(s1_arprot),
		.s1_arvalid(s1_arvalid),
		.s1_arready(s1_arready),
		.s1_rid(s1_rid),
		.s1_rdata(s1_rdata),
		.s1_rresp(s1_rresp),
		.s1_rlast(s1_rlast),
		.s1_rvalid(s1_rvalid),
		.s1_rready(s1_rready)
	);

	GPIO_TOP my_gpio
	(
		.apb_pclk				(clk_ext8m),
		.apb_prstn				(RSTN),
		.apb_psel				(apb0_psel),
		.apb_paddr				(apb0_paddr),
		.apb_pwrite				(apb0_pwrite),
		.apb_penable			(apb0_penable),
		.apb_pwdata				(apb0_pwdata),
		.apb_prdata				(apb0_prdata),
    
        .GPIO01                 (GPIO01 ),
        .GPIO13                 (GPIO13),
		.GPIO18           		(GPIO18),
		.GPIO19                 (GPIO19),
        .GPIO20                 (GPIO20),
        .GPIO34                 (GPIO34)
	);

	wire             timer_int;
	wire             i2c_int;
	wire             uart1_int;
    wire             uart0_int;
    wire             flash_int;
    wire             spi_int;
    wire             vpwm_int;
    wire             dma_int;
	wire 			 int_o1;

	//timer  0xbfed_xxxx
	HPET_TOP my_hpet_timer (
		.apb_pclk		(clk_ext8m),
		.apb_prstn		(RSTN),
		.apb_psel   	(apb2_psel),
		.apb_paddr		(apb2_paddr [3:0] ),
		.apb_pwrite		(apb2_pwrite),
		.apb_penable	(apb2_penable),
		.apb_pwdata		(apb2_pwdata),
		.apb_prdata		(apb2_prdata),

		.int_o			(timer_int)
	);


	CONFREG  my_confreg (
		.apb_pclk		(clk_ext8m	 	    ),
		.apb_prstn		(RSTN	    ),
		.apb_psel   	(apb3_psel          ),
		.apb_paddr		(apb3_paddr [19:0]  ),
		.apb_pwrite		(apb3_pwrite	    ),
		.apb_penable	(apb3_penable	    ),
		.apb_pwdata		(apb3_pwdata [7:0]  ),
		.apb_prdata		(apb3_prdata [7:0]  ),

		.timer_int		(timer_int			),
		.i2c_int		(i2c_int			),
		.uart1_int		(uart1_int			),
		.uart0_int		(uart0_int			),
		.flash_int		(flash_int			),
		.spi_int		(spi_int			),
		.vpwm_int		(vpwm_int			),
		.dma_int		(dma_int			),

		.int_o			(int_o1				)
	);


	//uart 0xbfe8_8xxx
	UART_TOP   my_uart1 (
		.apb_pclk		(clk_ext8m	 	    ),
		.apb_prstn		(RSTN	    ),
		.apb_psel   	(apb4_psel          ),
		.apb_paddr		(apb4_paddr         ),
		.apb_pwrite		(apb4_pwrite	    ),
		.apb_penable	(apb4_penable	    ),
		.apb_pwdata		(apb4_pwdata        ),
		.apb_prdata		(apb4_prdata        ),
		
		.RsRx           (uart1_rx_i),
		.RsTx           (uart1_tx_o),

		.uart_irq       (uart1_int)
	);



//------------------------------------------------------------------------------
// Slave6:Game
//------------------------------------------------------------------------------

    wire [9:0]x_coordinate;
    wire [9:0]y_coordinate;
    wire [6:0]blood_1;
    wire [6:0]blood_2;  
    wire [6:0]energy_1;
    wire [6:0]energy_2;
    wire [1:0]energy_count_1;
    wire [1:0]energy_count_2;
    wire [9:0]player1_x;
    wire [9:0]player1_y;
    wire [9:0]prop1_x;
    wire [9:0]prop1_y;
    wire [9:0]player2_x;
    wire [9:0]player2_y;
    wire [9:0]prop2_x;
    wire [9:0]prop2_y;
    wire      player1_direction;
    wire      player2_direction;

    wire [19:0]video;
    wire       video_enable1;
    wire       video_enable2;
    wire [12:0]audio;
    wire       audio_enable;

    wire [9:0]test_x;
    wire [9:0]test_y;
    wire [9:0]test_z;
    wire [7:0]score1;
    wire [7:0]score2;
    wire [7:0]score3;
    wire [7:0]score4;
    wire [15:0]key_output;

    reg [5:0] GAME_SWITCH;
    always @(posedge clk_ext8m or negedge RSTN)begin
        if (~RSTN) GAME_SWITCH          <= 6'd0;
        else GAME_SWITCH                <= prop1_x[5:0];
    end


    apb_Game Game_Interface(
		// Connect to apb_interconnect  7 //

		.apb_pclk                   (clk_ext8m),
		.apb_prstn                	(RSTN),
		.apb_psel                   (apb7_psel),
		.apb_paddr                  (apb7_paddr),
		.apb_pwdata                 (apb7_pwdata),
		.apb_pwrite                 (apb7_pwrite),
		.apb_prdata                 (apb7_prdata),
		.apb_penable                (apb7_penable),

		.x_coordinate           	(x_coordinate),
		.y_coordinate           	(y_coordinate),
		.blood_1                	(blood_1),
		.blood_2                	(blood_2),
		.energy_1               	(energy_1),
		.energy_2               	(energy_2),
		.energy_count_1         	(energy_count_1),
		.energy_count_2         	(energy_count_2),
		.player1_x              	(player1_x),
		.player1_y              	(player1_y),
		.prop1_x                	(prop1_x),
		.prop1_y                	(prop1_y),
		.player2_x              	(player2_x),
		.player2_y              	(player2_y),
		.prop2_x                	(prop2_x),
		.prop2_y                	(prop2_y),
		.player1_direction      	(player1_direction),
		.player2_direction      	(player2_direction),

		.video                  	(video),
		.video_enable1          	(video_enable1),
		.video_enable2          	(video_enable2),
		.audio                  	(audio),
		.audio_enable           	(audio_enable),

		.score1                 	(score1),
		.score2                 	(score2),
		.score3                 	(score3),
		.score4                 	(score4),
		.test_x                 	(test_x),
		.test_y                 	(test_y),
		.test_z                 	(test_z),
		.key_output             	(key_output)
    );

    
    wire kill_flag1;
    wire kill_flag2;
    wire kill_flag3;
    wire kill_flag4;
    wire [12:0]audio_signal;
    wire [19:0]video_signal;

    Game Game(
		.clk				(clk_ext8m),
		.RSTn				(RSTN),
		.test_x				(test_x),
		.test_y				(test_y),
		.test_z				(test_z),
		.input_data			({4'b0000,kill_flag1,kill_flag2,kill_flag3,kill_flag4}),
		.score1				(score1), 
		.score2				(score2),
		.score3				(score3),
		.score4				(score4),

		.key_game			(key_game),
		.key_output			(key_output),

		.video				(video),
		.video_enable1		(video_enable1),  
		.video_enable2		(video_enable2),  
		.video_signal		(video_signal),  
		.audio				(audio),
		.audio_enable		(audio_enable),
		.audio_signal		(audio_signal),

		.busy_player1(busy_player1),
		.busy_player2(busy_player2)
    );


// ///////////////////////////////////////////////////////图像输出/////////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////图像输出/////////////////////////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////图像输出/////////////////////////////////////////////////////////////////////////////////

	Video_top Video_output
	(
		.CLK				(clk_50m),      
		.RSTn				(RSTN),  

		.GAME_SWITCH		(GAME_SWITCH),
		.RX_Pin_In			(RX_Pin_In),
		.RX_En_Sig			(RX_En_Sig),


		.blood_1			(blood_1),
		.blood_2			(blood_2),
		.energy_1			(energy_1),
		.energy_2			(energy_2),
		.energy_count_1		(energy_count_1),
		.energy_count_2		(energy_count_2), 
		.figure_x_1			(player1_x),
		.figure_y_1			(player1_y),
		.figure_x_2			(player2_x),
		.figure_y_2			(player2_y),
		.figure_state_1		(video_signal[9:0]),
		.figure_state_2		(video_signal[19:10]),
		.figure_toward_1	(player1_direction),
		.figure_toward_2	(player2_direction),
	

		//SD卡接口               
		.sd_miso			(video_sd_miso),  //SD卡SPI串行输入数据信号
		.sd_clk				(video_sd_clk),  //SD卡SPI时钟信号
		.sd_cs 				(video_sd_cs),  //SD卡SPI片选信号
		.sd_mosi			(video_sd_mosi),  //SD卡SPI串行输出数据信号

		.sdram_clk          (sdram_clk      ),  //SDRAM 芯片时钟
		.sdram_cke          (sdram_cke      ),  //SDRAM 时钟有效
		.sdram_cs_n         (sdram_cs_n     ),  //SDRAM 片选
		.sdram_ras_n        (sdram_ras_n    ),  //SDRAM 行有效
		.sdram_cas_n        (sdram_cas_n    ),  //SDRAM 列有效
		.sdram_we_n         (sdram_we_n     ),  //SDRAM 写有效
		.sdram_ba           (sdram_ba       ),  //SDRAM Bank地址
		.sdram_addr         (sdram_addr     ),  //SDRAM 行/列地址
		.sdram_dq           (sdram_dq       ),  //SDRAM 数据
		.sdram_dqm          (sdram_dqm      ),   //SDRAM 数据掩码
		
		.x_pos				(x_coordinate),
		.y_pos				(y_coordinate),

		//VGA_OUTPUT
		.VGA_HS				(vga_hs),
		.VGA_VS				(vga_vs),
		.vga_out_rgb 		(vga_rgb) 
	);



endmodule


