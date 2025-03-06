`timescale 1ns/1ns
`include "config.v"



module godson_mcu_tb ;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

	reg         CLK50M;
	reg         RSTN; 
	wire        pps_led;
	
	reg  		  LJTAG_TRST;
	wire  		  LJTAG_TMS; 
	wire		  LJTAG_TDO; 
	wire		  LJTAG_TDI; 
	wire		  LJTAG_TCK;

	wire        led0;


godson_mcu_top a_godson_mcu_top (
	.CLK50M(CLK50M),
	.RSTN(RSTN),
	.pps_led(pps_led),

	.LJTAG_TRST(LJTAG_TRST),
	.LJTAG_TMS(LJTAG_TMS),
	.LJTAG_TDO(LJTAG_TDO), 
	.LJTAG_TDI(LJTAG_TDI), 
	.LJTAG_TCK(LJTAG_TCK),

	.led0(led0)	

);


GSR GSR(.GSRI(1'b1));

// Clock generation
always #((CLK_PERIOD / 2)) CLK50M = ~CLK50M;

// Reset generation
initial begin
	CLK50M = 1'b0;
	RSTN = 1'b1;
	LJTAG_TRST = 0;


#3_000_000
$finish;

end

initial begin

end

endmodule

