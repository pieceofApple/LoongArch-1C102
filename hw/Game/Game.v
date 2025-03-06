module Game(
input clk,
input RSTn,

output reg   [9:0] test_x,
output reg   [9:0] test_y,
output reg   [9:0] test_z,

input        [7:0] input_data,
output reg   [7:0] score1,
output reg   [7:0] score2,
output reg   [7:0] score3,
output reg   [7:0] score4,

input       [15:0] key_game,
output reg  [15:0] key_output,

input       [19:0] video,
input              video_enable1,
input              video_enable2,
output reg  [19:0] video_signal,
input       [12:0] audio,
input              audio_enable,
output reg  [12:0] audio_signal,

output             busy_player1,
output             busy_player2
 );
//INPUT:NONE OUTPUT:xx,yy,zz-----------------------------------------------//
parameter TIME_1S =26'd8_000_000;
parameter TIME_200MS =26'd1_600_000;

reg[25:0]cnt_1s;

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
		cnt_1s<=26'b0;
	end
	else if (cnt_1s==TIME_200MS) begin
		cnt_1s<=26'b0;	
	end
	else cnt_1s<=cnt_1s+1'b1;
end

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
		test_x<=26'd0;	
		test_y<=26'd0;
		test_z<=26'd0;
	end
	else if (test_x==10'd560&&test_y==10'd420&&test_z==10'd140)begin
		test_x<=26'd0;	
		test_y<=26'd0;
		test_z<=26'd0;
	end
	else if (cnt_1s==TIME_200MS) begin
		test_x<=test_x+3'd4;	
		test_y<=test_y+2'd3;
		test_z<=test_z+1'd1;	
	end
end

// //INPUT:flag1234 OUTPUT:score1234-----------------------------------------------//
reg [7:0]past;
always @(posedge clk or negedge RSTn) begin
    if (~RSTn) begin
        past<=8'b0000_0000;
    end
    else if(past!=input_data)begin
        past<=input_data;
    end
end

always @(posedge clk or negedge RSTn) begin
    if (~RSTn) begin
        score1<=8'b0;
        score2<=8'b0;
        score3<=8'b0;
        score4<=8'b0;
    end
    else if(past!=input_data) begin
        if(past[0]==1'b0&&input_data[0]==1'b1)score1<=score1+1'b1;
        if(past[1]==1'b0&&input_data[1]==1'b1)score2<=score2+1'b1;
        if(past[2]==1'b0&&input_data[2]==1'b1)score3<=score3+1'b1;
        if(past[3]==1'b0&&input_data[3]==1'b1)score4<=score4+1'b1;
    end   	  
end

// //INPUT:[15:0]key_game OUTPUT:[15:0]key_output-----------------------------------------//
// //                键盘扫描器和缓冲器           ---------------//
reg[25:0] cnt_20ms;
always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    cnt_20ms<=26'b0;
	end
	else if (cnt_20ms==26'd160_000||key_game==16'b1111_1111_1111_1111) begin
	cnt_20ms<=26'b0;	
	end
	else if(key_game!=16'b1111_1111_1111_1111)begin
	cnt_20ms<=cnt_20ms+1'b1;
	end
end

reg[15:0]key_buffer;
always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    	key_buffer<=16'b1111_1111_1111_1111;
	end
	else if (key_game!=16'b1111_1111_1111_1111) begin
		key_buffer<=key_game;	
	end
	else if (key_game==16'b1111_1111_1111_1111) begin
		key_buffer<=16'b1111_1111_1111_1111;
	end
end
//    用于检测按键状态的输出模块           //
always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
		key_output<=16'b0;
	end
	else if (cnt_20ms==26'd160_000&&key_game==key_buffer) begin
		key_output<=key_game;	
	end
	else if(key_game==16'b1111_1111_1111_1111)begin
		key_output<=16'b1111_1111_1111_1111;
	end
end

//INPUT:[19:0]video OUTPUT:[19:0]video_signal--------------------------------------------//
//*用于四个普攻和受击,技能,技能受击的动画//
parameter SHORT1        = 26'd3_200_000;//0.4s
parameter SHORT1_TOTAL  = 26'd4_800_000;//0.6s
parameter LONG1         = 26'd4_800_000;//0.6s
parameter LONG1_TOTAL   = 26'd6_400_000;//0.8s
parameter JINENG1       = 26'd8_000_000;//1.0s
parameter JINENG1_TOTAL = 26'd9_600_000;//1.2s

parameter SHORT2        = 26'd3_200_000;//0.4s
parameter SHORT2_TOTAL  = 26'd4_800_000;//0.6s
parameter LONG2         = 26'd4_800_000;//0.6s
parameter LONG2_TOTAL   = 26'd6_400_000;//0.8s
parameter JINENG2       = 26'd8_000_000;//1.0s
parameter JINENG2_TOTAL = 26'd9_600_000;//1.2s

reg        cnt_enable1;//用于攻击动画计时器的使能(1s的定时器,0.8s动作,0.2s僵直)
reg [25:0] cnt_video1 ;//用于给攻击动画定时1s
reg        cnt_enable2;//用于攻击动画计时器的使能(1s的定时器,0.8s动作,0.2s僵直)
reg [25:0] cnt_video2 ;//用于给攻击动画定时1s
reg [25:0] video1;
reg [25:0] video1_total;
reg [25:0] video2;
reg [25:0] video2_total;

always @(posedge clk or negedge RSTn) begin
 	if (~RSTn) begin
	video1<=26'b0;
	video1_total<=26'b0;
 	end
 	else begin
 	case(video[9:0])
 		10'b00_0000_0100:begin video1<=SHORT1; video1_total<=SHORT1_TOTAL; end//玩家1轻拳
 		10'b00_0000_1000:begin video1<=LONG1;  video1_total<=LONG1_TOTAL;  end//玩家1重拳
 		10'b00_0001_0000:begin video1<=SHORT1; video1_total<=SHORT1_TOTAL; end//玩家1轻脚
 		10'b00_0010_0000:begin video1<=LONG1;  video1_total<=LONG1_TOTAL;  end//玩家1重脚
 		10'b00_1000_0000:begin 
							case(video[19:10])
								10'b00_0000_0100:begin video1<=SHORT1; video1_total<=SHORT1_TOTAL; end 
								10'b00_0000_1000:begin video1<=LONG1;  video1_total<=LONG1_TOTAL;  end
								10'b00_0001_0000:begin video1<=SHORT1; video1_total<=SHORT1_TOTAL; end 
								10'b00_0010_0000:begin video1<=LONG1;  video1_total<=LONG1_TOTAL;  end  
								default:         begin video1<=26'b0;  video1_total<=26'b0;        end
								endcase 
 						 end                                                  //玩家1受击
 		10'b01_0000_0000:begin video1<=JINENG1;  video1_total<=JINENG1_TOTAL;  end//玩家1技能
 		10'b10_0000_0000:begin video1<=JINENG1;  video1_total<=JINENG1_TOTAL;  end//玩家1技能受击     
 	    default:begin video1<=26'b0; video1_total<=26'b0; end
 	endcase
 	end
 end 

always @(posedge clk or negedge RSTn) begin
 	if (~RSTn) begin
	video2<=26'b0;
	video2_total<=26'b0;
 	end
 	else begin
 	case(video[19:10])
 		10'b00_0000_0100:begin video2<=SHORT2; video2_total<=SHORT2_TOTAL; end//玩家2轻拳
 		10'b00_0000_1000:begin video2<=LONG2;  video2_total<=LONG2_TOTAL;  end//玩家2重拳
 		10'b00_0001_0000:begin video2<=SHORT2; video2_total<=SHORT2_TOTAL; end//玩家2轻脚
 		10'b00_0010_0000:begin video2<=LONG2;  video2_total<=LONG2_TOTAL;  end//玩家2重脚
 		10'b00_1000_0000:begin 
							case(video[9:0])
								10'b00_0000_0100:begin video2<=SHORT2; video2_total<=SHORT2_TOTAL; end 
								10'b00_0000_1000:begin video2<=LONG2;  video2_total<=LONG2_TOTAL;  end
								10'b00_0001_0000:begin video2<=SHORT2; video2_total<=SHORT2_TOTAL; end 
								10'b00_0010_0000:begin video2<=LONG2;  video2_total<=LONG2_TOTAL;  end 
								default:         begin video2<=26'b0;  video2_total<=26'b0;        end
								endcase 
 						 end                                                  //玩家2受击
 		10'b01_0000_0000:begin video2<=JINENG2;  video2_total<=JINENG2_TOTAL;  end//玩家2技能
 		10'b10_0000_0000:begin video2<=JINENG2;  video2_total<=JINENG2_TOTAL;  end//玩家2技能受击
 		default:begin video2<=26'b0; video2_total<=26'b0; end
 	endcase
 	end
 end 

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    cnt_enable1<=1'b0;
	end
	else if 
	((video[9:0]==10'b00_0000_0100||video[9:0]==10'b00_0000_1000||video[9:0]==10'b00_0001_0000||video[9:0]==10'b00_0010_0000
	||video[9:0]==10'b00_1000_0000||video[9:0]==10'b01_0000_0000||video[9:0]==10'b10_0000_0000)
	&&cnt_video1==video1_total&&video1_total!=26'b0) 
	begin
	cnt_enable1<=1'b0;
	end
	else if (video_enable1) begin
	cnt_enable1<=1'b1;	
	end
end

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    cnt_video1<=26'b0;
	end
	else if
	((video[9:0]==10'b00_0000_0100||video[9:0]==10'b00_0000_1000||video[9:0]==10'b00_0001_0000||video[9:0]==10'b00_0010_0000
	||video[9:0]==10'b00_1000_0000||video[9:0]==10'b01_0000_0000||video[9:0]==10'b10_0000_0000)
	&&cnt_video1==video1_total&&video1_total!=26'b0)
	begin
	cnt_video1<=26'b0;
	end
	else if(cnt_enable1)begin
	cnt_video1<=cnt_video1+1'b1;
	end
end

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    cnt_enable2<=1'b0;
	end
	else if
	((video[19:10]==10'b00_0000_0100||video[19:10]==10'b00_0000_1000||video[19:10]==10'b00_0001_0000||video[19:10]==10'b00_0010_0000
	||video[19:10]==10'b00_1000_0000||video[19:10]==10'b01_0000_0000||video[19:10]==10'b10_0000_0000)
	&&cnt_video2==video2_total&&video2_total!=26'b0)
	begin
	cnt_enable2<=1'b0;
	end
	else if (video_enable2) begin
	cnt_enable2<=1'b1;	
	end
end

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
    cnt_video2<=26'b0;
	end
	else if
	((video[19:10]==10'b00_0000_0100||video[19:10]==10'b00_0000_1000||video[19:10]==10'b00_0001_0000||video[19:10]==10'b00_0010_0000
	||video[19:10]==10'b00_1000_0000||video[19:10]==10'b01_0000_0000||video[19:10]==10'b10_0000_0000)
	&&cnt_video2==video2_total&&video2_total!=26'b0)
	begin
	cnt_video2<=26'b0;
	end
	else if(cnt_enable2)begin
	cnt_video2<=cnt_video2+1'b1;
	end
end

assign busy_player1 = 
   	((video[9:0]==10'b00_0000_0100||video[9:0]==10'b00_0000_1000||video[9:0]==10'b00_0001_0000||video[9:0]==10'b00_0010_0000
	||video[9:0]==10'b00_1000_0000||video[9:0]==10'b01_0000_0000||video[9:0]==10'b10_0000_0000)
	&&cnt_video1==video1_total&&video1_total!=26'b0)
? 1'b1:1'b0;
assign busy_player2 = 
	((video[19:10]==10'b00_0000_0100||video[19:10]==10'b00_0000_1000||video[19:10]==10'b00_0001_0000||video[19:10]==10'b00_0010_0000
	||video[19:10]==10'b00_1000_0000||video[19:10]==10'b01_0000_0000||video[19:10]==10'b10_0000_0000)
	&&cnt_video2==video2_total&&video2_total!=26'b0)
? 1'b1:1'b0;
//用于四个普攻和受击,技能,技能受击的动画*//

//*用于移动的动画//
parameter MOVE1       = 26'd 2_000_000;//0.25s走
parameter MOVE1_TOTAL = 26'd 4_000_000;//0.25s站，总共0.5s
parameter MOVE2       = 26'd 2_000_000;
parameter MOVE2_TOTAL = 26'd 4_000_000;
reg [25:0]cnt_move1;
reg [25:0]cnt_move2;

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
	cnt_move1<=26'b0;
	end
	else if (cnt_move1==MOVE1_TOTAL) begin
	cnt_move1<=26'b0;		
	end
	else cnt_move1<=cnt_move1+1'b1;
end

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
	cnt_move2<=26'b0;
	end
	else if (cnt_move2==MOVE2_TOTAL) begin
	cnt_move2<=26'b0;		
	end
	else cnt_move2<=cnt_move2+1'b1;
end
//用于移动的动画*//

always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
	video_signal<=20'b00_0000_0000_0000_0000;
	end
	else if (video!=20'b0) begin
		case(video[9:0])
			10'b00_0000_0001:begin if(cnt_move1 >26'b0&&cnt_move1 <=MOVE1)   video_signal[9:0]  <=10'b00_0000_0001; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 移动
			10'b00_0000_0010:                                                video_signal[9:0]  <=10'b00_0000_0010;                                               //玩家1 防御
			10'b00_0000_0100:begin if(cnt_video1>26'b0&&cnt_video1<=video1)  video_signal[9:0]  <=10'b00_0000_0100; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 轻拳
			10'b00_0000_1000:begin if(cnt_video1>26'b0&&cnt_video1<=video1)  video_signal[9:0]  <=10'b00_0000_1000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 重拳
			10'b00_0001_0000:begin if(cnt_video1>26'b0&&cnt_video1<=video1)  video_signal[9:0]  <=10'b00_0001_0000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 轻脚
			10'b00_0010_0000:begin if(cnt_video1>26'b0&&cnt_video1<=video1)  video_signal[9:0]  <=10'b00_0010_0000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 重脚
			10'b00_0100_0000:                                                video_signal[9:0]  <=10'b00_0100_0000;                                               //玩家1 跳跃
			10'b00_1000_0000:begin if(cnt_video2>26'b0&&cnt_video2<=video1)  video_signal[9:0]  <=10'b00_1000_0000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 受击
			10'b01_0000_0000:begin if(cnt_video1>26'b0&&cnt_video1<=video1)  video_signal[9:0]  <=10'b01_0000_0000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 技能
			10'b10_0000_0000:begin if(cnt_video2>26'b0&&cnt_video2<=video1)  video_signal[9:0]  <=10'b10_0000_0000; else video_signal[9:0]  <=10'b00_0000_0000;end//玩家1 技能受击
			default:video_signal[9:0]<=10'b0;
		endcase
		case(video[19:10])
			10'b00_0000_0001:begin if(cnt_move2 >26'b0&&cnt_move2 <=MOVE2)   video_signal[19:10]<=10'b00_0000_0001; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 移动
			10'b00_0000_0010:                                                video_signal[19:10]<=10'b00_0000_0010;                                               //玩家2 防御
			10'b00_0000_0100:begin if(cnt_video2>26'b0&&cnt_video2<=video2)  video_signal[19:10]<=10'b00_0000_0100; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 轻拳
			10'b00_0000_1000:begin if(cnt_video2>26'b0&&cnt_video2<=video2)  video_signal[19:10]<=10'b00_0000_1000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 重拳
			10'b00_0001_0000:begin if(cnt_video2>26'b0&&cnt_video2<=video2)  video_signal[19:10]<=10'b00_0001_0000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 轻脚
			10'b00_0010_0000:begin if(cnt_video2>26'b0&&cnt_video2<=video2)  video_signal[19:10]<=10'b00_0010_0000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 重脚
			10'b00_0100_0000:                                                video_signal[19:10]<=10'b00_0100_0000;                                               //玩家2 跳跃
			10'b00_1000_0000:begin if(cnt_video1>26'b0&&cnt_video1<=video2)  video_signal[19:10]<=10'b00_1000_0000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 受击
			10'b01_0000_0000:begin if(cnt_video2>26'b0&&cnt_video2<=video2)  video_signal[19:10]<=10'b01_0000_0000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 技能
			10'b10_0000_0000:begin if(cnt_video1>26'b0&&cnt_video1<=video2)  video_signal[19:10]<=10'b10_0000_0000; else video_signal[19:10]<=10'b00_0000_0000;end//玩家2 技能受击
		    default:video_signal[19:10]<=10'b0; 
		endcase		    
	end
	else  begin
		video_signal<=20'b00_0000_0000_00_0000_0000;
	end
end

//INPUT:[12:0]audio OUTPUT:[12:0]audio_signal--------------------------------------------//
always @(posedge clk or negedge RSTn) begin
	if (~RSTn) begin
	audio_signal<=13'b0_0000_0000_0000;
	end
	else if (audio!=13'b0&&audio_enable) begin
		case(audio)
			13'b0_0000_0000_0001:audio_signal<=13'b0_0000_0000_0001;
			13'b0_0000_0000_0010:audio_signal<=13'b0_0000_0000_0010;
			13'b0_0000_0000_0100:audio_signal<=13'b0_0000_0000_0100;
			13'b0_0000_0000_1000:audio_signal<=13'b0_0000_0000_1000;
			13'b0_0000_0001_0000:audio_signal<=13'b0_0000_0001_0000;
			13'b0_0000_0010_0000:audio_signal<=13'b0_0000_0010_0000;
			13'b0_0000_0100_0000:audio_signal<=13'b0_0000_0100_0000;
			13'b0_0000_1000_0000:audio_signal<=13'b0_0000_1000_0000;
			13'b0_0001_0000_0000:audio_signal<=13'b0_0001_0000_0000;
			13'b0_0010_0000_0000:audio_signal<=13'b0_0010_0000_0000;
			13'b0_0100_0000_0000:audio_signal<=13'b0_0100_0000_0000;
			13'b0_1000_0000_0000:audio_signal<=13'b0_1000_0000_0000;
			13'b1_0000_0000_0000:audio_signal<=13'b1_0000_0000_0000;
		    default:audio_signal<=13'b0; 
		endcase		    
	end
	else if(~audio_enable) begin
		audio_signal<=13'b0_0000_0000_0000;
	end
end
endmodule
