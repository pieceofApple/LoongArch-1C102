module apb_Game(
    input  wire          apb_pclk,    
    input  wire          apb_prstn, 
    input  wire          apb_psel,    
    input  wire   [31:0] apb_paddr,   
    input  wire          apb_pwrite,  
    input  wire   [31:0] apb_pwdata,  
    input  wire          apb_penable,  
    output reg    [31:0] apb_prdata,  

    input  wire    [9:0] test_x, 
    input  wire    [9:0] test_y, 
    input  wire    [9:0] test_z,
    input  wire    [7:0] score1,
    input  wire    [7:0] score2,
    input  wire    [7:0] score3,
    input  wire    [7:0] score4,
    input  wire    [15:0]key_output,                               

    output reg     [9:0] x_coordinate,
    output reg     [9:0] y_coordinate,
    output reg     [6:0] blood_1,
    output reg     [6:0] blood_2,
    output reg     [6:0] energy_1,
    output reg     [6:0] energy_2,
    output reg     [1:0] energy_count_1, 
    output reg     [1:0] energy_count_2,
    output reg     [9:0] player1_x,
    output reg     [9:0] player1_y,
    output reg     [9:0] prop1_x,
    output reg     [9:0] prop1_y,
    output reg     [9:0] player2_x,
    output reg     [9:0] player2_y,
    output reg     [9:0] prop2_x,
    output reg     [9:0] prop2_y,
    output reg           player1_direction,
    output reg           player2_direction,

    output reg    [19:0] video,
    output wire          video_enable1,//用于产生1个周期使能信号,去使能0.5s计时器
    output wire          video_enable2,//用于产生1个周期使能信号,去使能0.5s计时器
    output reg    [12:0] audio,
    output wire          audio_enable//用于产生1个周期使能信号

);


wire read_en;
assign read_en  = apb_penable & apb_psel & (~apb_pwrite);

wire write_en;
assign write_en = apb_penable & apb_psel & apb_pwrite;


reg [7:0]addr_reg;
always@(posedge apb_pclk or negedge apb_prstn) begin
  if(~apb_prstn) addr_reg <= 8'b0;
  else if(write_en|read_en) addr_reg <= apb_paddr[7:0];
end

reg rd_en_reg;
always@(posedge apb_pclk or negedge apb_prstn) begin
  if(~apb_prstn) rd_en_reg <= 1'b0;
  else if(read_en) rd_en_reg <= 1'b1;
  else rd_en_reg <= 1'b0;
end

reg wr_en_reg;
always@(posedge apb_pclk or negedge apb_prstn) begin
  if(~apb_prstn) wr_en_reg <= 1'b0;
  else if(write_en) wr_en_reg <= 1'b1;
  else wr_en_reg <= 1'b0;
end

always@(posedge apb_pclk or negedge apb_prstn) begin
    if(~apb_prstn) begin
		x_coordinate      <=10'b0;
		y_coordinate      <=10'b0;
        blood_1           <=7'd100;
        blood_2           <=7'd100;
        energy_1          <=7'b0;
        energy_2          <=7'b0;
        energy_count_1    <=2'b0;
        energy_count_2    <=2'b0;
        player1_x         <=10'd50;
        player1_y         <=10'd240;
        prop1_x           <=10'b0;
        prop1_y           <=10'b0;
        player2_x         <=10'd450;
        player2_y         <=10'd240;
        prop2_x           <=10'b0;
        prop2_y           <=10'b0;
        player1_direction <=1'b1;//人物1朝右
        player2_direction <=1'b0;//人物2朝左

        video          <=20'b0;
        audio          <=13'b0;
    end 
    else if(wr_en_reg && apb_penable) begin
        case(addr_reg)
        8'h00:x_coordinate      <= apb_pwdata[9:0];
        8'h04:y_coordinate      <= apb_pwdata[9:0];
        8'h08:blood_1           <= apb_pwdata[6:0];
        8'h0C:blood_2           <= apb_pwdata[6:0];
        8'h10:energy_1          <= apb_pwdata[6:0];
        8'h14:energy_2          <= apb_pwdata[6:0];
        8'h18:energy_count_1    <= apb_pwdata[1:0];
        8'h1C:energy_count_2    <= apb_pwdata[1:0];
        8'h20:player1_x         <= apb_pwdata[9:0];
        8'h24:player1_y         <= apb_pwdata[9:0];
        8'h28:prop1_x           <= apb_pwdata[9:0];
        8'h2C:prop1_y           <= apb_pwdata[9:0];
        8'h30:player2_x         <= apb_pwdata[9:0];
        8'h34:player2_y         <= apb_pwdata[9:0];
        8'h38:prop2_x           <= apb_pwdata[9:0];
        8'h3C:prop2_y           <= apb_pwdata[9:0];
        8'h40:player1_direction <= apb_pwdata[0];
        8'h44:player2_direction <= apb_pwdata[0];

        8'h48:video[9:0]      <= {9'b0,apb_pwdata[0]};        //玩家1 移动
        8'h4C:video[9:0]      <= {8'b0,apb_pwdata[0],1'b0};   //玩家1 防御
        8'h50:video[9:0]      <= 10'b00_0000_0100;        //玩家1 轻拳
        8'h54:video[9:0]      <= 10'b00_0000_1000;        //玩家1 重拳
        8'h58:video[9:0]      <= 10'b00_0001_0000;        //玩家1 轻脚
        8'h5C:video[9:0]      <= 10'b00_0010_0000;        //玩家1 重脚
        8'h60:video[9:0]      <= {3'b0,apb_pwdata[0],6'b0};   //玩家1 跳跃
        8'h64:video[9:0]      <= 10'b00_1000_0000;        //玩家1 受击
        8'h68:video[9:0]      <= 10'b01_0000_0000;        //玩家1 技能
        8'h6C:video[9:0]      <= 10'b10_0000_0000;        //玩家1 技能受击

        8'h70:video[19:10]     <= {9'b0,apb_pwdata[0]};        //玩家2 移动
        8'h74:video[19:10]     <= {8'b0,apb_pwdata[0],1'b0};   //玩家2 防御
        8'h78:video[19:10]     <= 10'b00_0000_0100;        //玩家2 轻拳
        8'h7C:video[19:10]     <= 10'b00_0000_1000;        //玩家2 重拳
        8'h80:video[19:10]     <= 10'b00_0001_0000;        //玩家2 轻脚
        8'h84:video[19:10]     <= 10'b00_0010_0000;        //玩家2 重脚
        8'h88:video[19:10]     <= {3'b0,apb_pwdata[0],6'b0};   //玩家2 跳跃
        8'h8C:video[19:10]     <= 10'b00_1000_0000;        //玩家2 受击
        8'h90:video[19:10]     <= 10'b01_0000_0000;        //玩家2 技能
        8'h94:video[19:10]     <= 10'b10_0000_0000;        //玩家2 技能受击

        8'h98:audio         <= 13'h0001;
        8'h9C:audio         <= 13'h0002;
        8'hA0:audio         <= 13'h0004;
        8'hA4:audio         <= 13'h0008;
        8'hA8:audio         <= 13'h0010;
        8'hAC:audio         <= 13'h0020;
        8'hB0:audio         <= 13'h0040;
        8'hB4:audio         <= 13'h0080;
        8'hB8:audio         <= 13'h0100;
        8'hBC:audio         <= 13'h0200;
        8'hC0:audio         <= 13'h0400;
        8'hC4:audio         <= 13'h0800;
        8'hC8:audio         <= 13'h1000;

        default:begin 
                    x_coordinate      <=10'b0;
                    y_coordinate      <=10'b0;
                    blood_1           <=7'd100;
                    blood_2           <=7'd100;
                    energy_1          <=7'b0;
                    energy_2          <=7'b0;
                    energy_count_1    <=2'b0;
                    energy_count_2    <=2'b0;
                    player1_x         <=10'd50;
                    player1_y         <=10'd240;
                    prop1_x           <=10'b0;
                    prop1_y           <=10'b0;
                    player2_x         <=10'd450;
                    player2_y         <=10'd240;
                    prop2_x           <=10'b0;
                    prop2_y           <=10'b0;
                    player1_direction <=1'b1;
                    player2_direction <=1'b0;
                    video             <=20'b0;
                    audio             <=13'b0;
                end 
        endcase
    end
end

always@(*) begin
    if(rd_en_reg) begin
        case(addr_reg)
        8'hCC:apb_prdata[31:0]={22'b0,test_x};
        8'hD0:apb_prdata[31:0]={22'b0,test_y};
        8'hD4:apb_prdata[31:0]={22'b0,test_z};
        8'hD8:apb_prdata[31:0]={24'b0,score1};
        8'hDC:apb_prdata[31:0]={24'b0,score2};
        8'hE0:apb_prdata[31:0]={24'b0,score3};
        8'hE4:apb_prdata[31:0]={24'b0,score4};
        8'hE8:apb_prdata[31:0]={16'b0,key_output};
        default:apb_prdata[31:0]=32'b0;     
        endcase
    end
end

//用户自定义区域
assign video_enable1 = (wr_en_reg && apb_penable&&
    (
     addr_reg==8'h50||addr_reg==8'h54||addr_reg==8'h58||addr_reg==8'h5C||//四个普攻
     addr_reg==8'h64||addr_reg==8'h68||addr_reg==8'h6C                   //受击,技能,技能受击
    )
)?1'b1:1'b0;
assign video_enable2 = (wr_en_reg && apb_penable&&
    (
     addr_reg==8'h78||addr_reg==8'h7C||addr_reg==8'h80||addr_reg==8'h84||//四个普攻
     addr_reg==8'h8C||addr_reg==8'h90||addr_reg==8'h94                   //受击,技能,受击技能
    )
)?1'b1:1'b0;
assign audio_enable = (wr_en_reg && apb_penable&&addr_reg>=8'h98&&addr_reg<=8'hC8)?1'b1:1'b0;


endmodule
