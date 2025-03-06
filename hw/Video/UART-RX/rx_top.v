module rx_top
(
    CLK, RSTn, RX_Pin_In, RX_En_Sig,x_pos,y_pos
);

     input CLK;
	 input RSTn;			//SW0
	 input RX_Pin_In;		//F12
	 input RX_En_Sig;		//SW1
	 

	 wire neg_sig; //synthesis keep;
	 wire BPS_CLK; //synthesis keep;
	 wire Count_Sig;  //synthesis keep;
	 wire RX_Done_Sig;	//synthesis keep;
	wire [7:0]RX_Data;	 	 
	 
	reg CLK_500K; //synthesis keep;
	reg[9:0] cnt2;

	//产生500K时钟
	always @ (posedge CLK or negedge RSTn)	
		if(!RSTn) 
		  begin
			  cnt2 <= 10'd0;
			  CLK_500K <= 1'b0;
		  end
		else if(cnt2 == 10'd49) 
		  begin
			  cnt2 <= 10'd0;
			  CLK_500K <= ~CLK_500K;
		  end
		else cnt2 <= cnt2+1'b1;
	 
	/**********************************/
	 
	detect_module U1
	(
	   .CLK( CLK_500K ),
		.RSTn( RSTn ),
		.RX_Pin_In( RX_Pin_In ),    // input - from top
		.neg_sig( neg_sig ) 			// output - to U3
	);
	
   /**********************************/

	rx_bps_module U2
	(
	   .CLK( CLK_500K ),
		.RSTn( RSTn ),
		.Count_Sig( Count_Sig ),   // input - from U3
	   .BPS_CLK( BPS_CLK )        // output - to U3
	);	 
	
   /**********************************/
		 
	rx_control_module U3
	(
		.CLK( CLK_500K ),
	   .RSTn( RSTn ),
			  
		.neg_sig( neg_sig ),      // input - from U1
		.RX_En_Sig( RX_En_Sig ),  // input - from top
		.RX_Pin_In( RX_Pin_In ),  // input - from top
		.BPS_CLK( BPS_CLK ),      // input - from U2
			  
	   .Count_Sig( Count_Sig ),    // output - to U2
		.RX_Data( RX_Data ),        // output - to U4
		.RX_Done_Sig( RX_Done_Sig ) // output - to U4		  
	 );
	 
	/************************************/
 /*
	LED_display_module U4
	(
		.CLK( CLK_500K ) ,	
		.RSTn( RSTn ) ,	
		.RX_Done_Sig( RX_Done_Sig ) ,	// input - from U3 
		.RX_Data( x_pos[7:0] ) ,	// input - from U3
		.LED_Out( LED_Out ) 	// output - to top
	);
*/

output reg [9:0] x_pos;
reg [3:0] x1;
reg [3:0] x2;
reg [3:0] x3;

reg [3:0] y1;
reg [3:0] y2;
reg [3:0] y3;

output reg [9:0] y_pos;
reg [2:0] rx_flag;
reg save_done;
/*
always@(posedge CLK_500K or negedge RSTn)
    if(RSTn == 1'b0)begin
        x_pos    <=  10'd0;
        y_pos    <=  10'd0;
    end
    else begin
		if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd0) begin
    		x_pos <= x_pos+100*RX_Data[3:0];
    		rx_flag <= 3'd2;
    	end
    	else if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd1) begin
    		x_pos <= x_pos+10*RX_Data[3:0];
    		rx_flag <= 3'd3;
    	end
    	else if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd2) begin
    		x_pos <= x_pos+RX_Data[3:0];
    		rx_flag <= 3'd4;
    	end
    	else if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd3) begin
    		y_pos <= y_pos+100*RX_Data[3:0];
    		rx_flag <= 3'd5;
    	end
    	else if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd4) begin
    		y_pos <= y_pos+10*RX_Data[3:0];
    		rx_flag <= 3'd6;
    	end
    	else if(RX_DATA[7:4] == 4'ha&&rx_flag == 3'd5) begin
    		y_pos <= y_pos+RX_Data[3:0];
    		rx_flag <= 3'd0;
    	end 
    	// else if(rx_flag == 3'd7&&RX_Data == 8'h42) begin
    	// 	rx_flag <= 3'd0;
    	// end
    	else;
    end
*/


always @(posedge CLK_500K or negedge RSTn) begin
	if (RSTn == 1'b0) begin
		x_pos    <=  10'd0;
        y_pos    <=  10'd0;
	end
	else if (save_done) begin
		x_pos <= x1*100+x2*10+x3;
		y_pos <= y1*100+y2*10+y3;

	end
end


always@(posedge CLK_500K or negedge RSTn)
    if(RSTn == 1'b0)begin
        x1<=0;
		x2<=0;
		x3<=0;

		y1<=0;
		y2<=0;
		y3<=0;
    end
    else begin
		if (BPS_CLK) begin
			if(RX_Data[7:4] == 4'h1) begin
    		x1 <= RX_Data[3:0];
    		rx_flag <= 3'd2;
    	end
    	else if(RX_Data[7:4] == 4'h2) begin
    		x2 <= RX_Data[3:0];
    		rx_flag <= 3'd3;
    	end
    	else if(RX_Data[7:4] == 4'h3) begin
    		x3 <= RX_Data[3:0];
    		rx_flag <= 3'd4;
    	end
    	else if(RX_Data[7:4] == 4'h4) begin
    		y1 <= RX_Data[3:0];
    		rx_flag <= 3'd5;
    	end
    	else if(RX_Data[7:4] == 4'h5) begin
    		y2 <= RX_Data[3:0];
    		rx_flag <= 3'd6;
    	end
    	else if(RX_Data[7:4] == 4'h6) begin
    		y3 <= RX_Data[3:0];
    		save_done<=1'b1;
    		rx_flag <= 3'd7;
    	end 
    	else if(rx_flag == 3'd7) begin
    		save_done<=1'b0;
    	end 
    	// else if(rx_flag == 3'd7&&RX_Data == 8'h42) begin
    	// 	rx_flag <= 3'd0;
    	// end
    	else ;
		end
		else;
    end
	/************************************/
	
	


	 	 
endmodule
