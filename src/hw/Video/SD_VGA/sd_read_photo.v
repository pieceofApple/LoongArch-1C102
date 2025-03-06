//----------------------------------------------------------------------------------------
// File name:           sd_read_photo
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SD卡读取图片
//----------------------------------------------------------------------------------------

module sd_read_photo(
    input   wire         clk           ,  //时钟信号
    input   wire         rst_n         ,  //复位信号,低电平有效    
    input   wire         rd_busy       ,  //SD卡读忙信号
    output  reg          rd_start_en   ,  //开始写SD卡数据信号
    output  reg  [31:0]  rd_sec_addr   ,  //读数据扇区地址
    output  reg          wr_load       ,
    output  reg  [7:0]   photo_load_cnt,//图片切换计数器（游戏结束或者切换按键按下时 触发）
    input   wire [5:0]   GAME_SWITCH   ,
    input   wire         GAME_OVER   
    );

//parameter define                          
parameter GAME_BACKGROUND_1     = 32'd17372;  //第一张图片扇区起始地址 
parameter WATING                = 32'd19772;  //第二张图片扇区起始地址
parameter GAME_OVER_BACKGROUND  = 32'd18272;
parameter FIGHT_BACKGROUND      = 32'd18772;

parameter lori_stand_left       = 32'd20672;    //85% 128*192
parameter mai_stand_left        = 32'd21572;     //83% 128*192
parameter lori_move_left        = 32'd16400;    //85% 128*192
parameter mai_move_left         = 32'd16484;     //83% 128*192
parameter lori_move_right       = 32'd16568;    //85% 128*192
parameter lori_stand_right      = 32'd16652;    //85% 128*192
parameter mai_move_right        = 32'd16736;     //83% 128*192
parameter mai_stand_right       = 32'd16820;     //83% 128*192
parameter mai_defense_left      = 32'd16904;     //83% 128*192
parameter mai_defense_right     = 32'd16988;     //83% 128*192
parameter mai_hit_left          = 32'd17056;     //83% 128*192
parameter mai_hit_right         = 32'd17104;     //83% 128*192
parameter mai_jineng_left       = 32'd17144;     //83% 128*192
parameter mai_jineng_project    = 32'd17208;     //83% 128*192
parameter mai_jineng_right      = 32'd17272;     //83% 128*192
parameter mai_jump_left         = 32'd17336;     //83% 128*192

parameter mai_jump_right        = 32'd23552;     //83% 128*192
parameter mai_lightkick_left    = 32'd23680;     //83% 128*192
parameter mai_lightkick_right   = 32'd23808;     //83% 128*192
parameter mai_lightpunch_left   = 32'd23936;     //83% 128*192
parameter mai_lightpunch_right  = 32'd24064;     //83% 128*192

parameter mai_heavykick_left    = 32'd24832;     //83% 128*192
parameter mai_heavykick_right   = 32'd24704;     //83% 128*192
parameter mai_heavypunch_left   = 32'd24576;     //83% 128*192
parameter mai_heavypunch_right  = 32'd24448;     //83% 128*192

parameter mai_jinenghit_left    = 32'd27008;     //83% 128*192
parameter mai_jinenghit_right   = 32'd26880;     //83% 128*192


parameter lori_defense_left     = 32'd24960;     //83% 128*192
parameter lori_defense_right    = 32'd25088;     //83% 128*192
parameter lori_hit_left         = 32'd25216;     //83% 128*192
parameter lori_hit_right        = 32'd25344;     //83% 128*192
parameter lori_jineng_left      = 32'd25472;     //83% 128*192
parameter lori_jineng_project   = 32'd25600;     //83% 128*192
parameter lori_jineng_right     = 32'd25728;     //83% 128*192
parameter lori_jump_left        = 32'd25856;     //83% 128*192
parameter lori_jump_right       = 32'd25984;     //83% 128*192
parameter lori_lightkick_left   = 32'd26112;     //83% 128*192
parameter lori_lightkick_right  = 32'd26240;     //83% 128*192
parameter lori_lightpunch_left  = 32'd26368;     //83% 128*192
parameter lori_lightpunch_right = 32'd26496;     //83% 128*192

parameter lori_heavykick_left   = 32'd24192;     //83% 128*192
parameter lori_heavykick_right  = 32'd24320;     //83% 128*192
parameter lori_heavypunch_left  = 32'd26752;     //83% 128*192
parameter lori_heavypunch_right = 32'd26624;     //83% 128*192

parameter lori_jinenghit_left   = 32'd27264;     //83% 128*192
parameter lori_jinenghit_right  = 32'd27136;     //83% 128*192
//共46张图片


//640*480/256 = 1200
// 图片实际大小/512 = RD_SECTION_NUM
// parameter  RD_SECTION_NUM  = 11'd7344   ;  //单张图片总共读出的次数  
parameter  RD_SECTION_NUM       = 11'd1200 ;  //单张图片总共读出的次数  
parameter  RD_NUM               = 11'd95   ;  //单张图片总共读出的次数
parameter  RD_NUM1              = 11'd190  ;  //单张图片总共读出的次数
parameter  PHOTO_NUM             = 8'd46   ;  //总图片数

//reg define
reg    [1:0]          rd_flow_cnt      ;    //读数据流程控制计数器
reg    [10:0]         rd_sec_cnt       ;    //读扇区次数计数器
reg                   rd_addr_sw       ;    //读两张图片切换
reg    [25:0]         delay_cnt        ;    //延时切换图片计数器

reg                   rd_busy_d0       ;    //读忙信号打拍，用来采下降沿
reg                   rd_busy_d1       ;  

//wire define
wire                  neg_rd_busy      ;    //SD卡读忙信号下降沿

//*****************************************************
//**                    main code
//*****************************************************

assign  neg_rd_busy = rd_busy_d1 & (~rd_busy_d0);

//对rd_busy信号进行延时打拍,用于采rd_busy信号的下降沿
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        rd_busy_d0 <= 1'b0;
        rd_busy_d1 <= 1'b0;
    end
    else begin
        rd_busy_d0 <= rd_busy;
        rd_busy_d1 <= rd_busy_d0;
    end
end

reg [3:0] game_flag_last;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_flow_cnt <= 2'd0;
        rd_addr_sw <= 1'b0;
        rd_sec_cnt <= 11'd0;
        photo_load_cnt <= 8'd0;
        rd_start_en <= 1'b0;
        rd_sec_addr <= 32'd0;
        wr_load     <= 1'b0;
    end
    else begin
        rd_start_en <= 1'b0;
        case(rd_flow_cnt)
            2'd0 : begin
                //开始读取SD卡数据
                rd_flow_cnt <= rd_flow_cnt + 2'd1;
                rd_start_en <= 1'b1;
                //rd_addr_sw <= ~rd_addr_sw;    
                if(!GAME_OVER) begin                //读数据地址切换
                    case(GAME_SWITCH[3:0])
                        4'b0000 : begin
                            rd_sec_addr <= WATING;
                        end
                        4'b0001 : begin
                            rd_sec_addr <= GAME_BACKGROUND_1;
                        end
                        4'b0010 : begin
                            case(photo_load_cnt)
                                8'd0 : rd_sec_addr <= FIGHT_BACKGROUND;

                                8'd1 : rd_sec_addr <= mai_stand_left;
                                8'd2 : rd_sec_addr <= mai_stand_right;
                                8'd3 : rd_sec_addr <= mai_move_left;
                                8'd4 : rd_sec_addr <= mai_move_right;
                                8'd5 : rd_sec_addr <= mai_defense_left;
                                8'd6 : rd_sec_addr <= mai_defense_right;
                                8'd7 : rd_sec_addr <= mai_hit_left;
                                8'd8 : rd_sec_addr <= mai_hit_right;
                                8'd9 : rd_sec_addr <= mai_jineng_left;
                                8'd10 : rd_sec_addr <= mai_jineng_right;
                                8'd11 : rd_sec_addr <= mai_jineng_project;
                                8'd12 : rd_sec_addr <= mai_jump_left;
                                8'd13 : rd_sec_addr <= mai_jump_right;
                                8'd14 : rd_sec_addr <= mai_lightpunch_left;
                                8'd15 : rd_sec_addr <= mai_lightpunch_right;
                                8'd16 : rd_sec_addr <= mai_lightkick_left;
                                8'd17 : rd_sec_addr <= mai_lightkick_right;
                                8'd18 : rd_sec_addr <= lori_stand_left;
                                8'd19 : rd_sec_addr <= lori_stand_right;
                                8'd20 : rd_sec_addr <= lori_move_left;
                                8'd21 : rd_sec_addr <= lori_move_right;
                                8'd22 : rd_sec_addr <= lori_defense_left;
                                8'd23 : rd_sec_addr <= lori_defense_right;
                                8'd24 : rd_sec_addr <= lori_hit_left;
                                8'd25 : rd_sec_addr <= lori_hit_right;
                                8'd26 : rd_sec_addr <= lori_jineng_left;
                                8'd27 : rd_sec_addr <= lori_jineng_right;
                                8'd28 : rd_sec_addr <= lori_jineng_project;
                                8'd29 : rd_sec_addr <= lori_jump_left;
                                8'd30 : rd_sec_addr <= lori_jump_right;
                                8'd31 : rd_sec_addr <= lori_lightpunch_left;
                                8'd32 : rd_sec_addr <= lori_lightpunch_right;
                                8'd33 : rd_sec_addr <= lori_lightkick_left;
                                8'd34 : rd_sec_addr <= lori_lightkick_right;
                                8'd35 : rd_sec_addr <= mai_heavypunch_left;
                                8'd36 : rd_sec_addr <= mai_heavypunch_right;
                                8'd37 : rd_sec_addr <= mai_heavykick_left;
                                8'd38 : rd_sec_addr <= mai_heavykick_right;
                                8'd39 : rd_sec_addr <= lori_heavypunch_left;
                                8'd40 : rd_sec_addr <= lori_heavypunch_right;
                                8'd41 : rd_sec_addr <= lori_heavykick_left;
                                8'd42 : rd_sec_addr <= lori_heavykick_right;
                                8'd43 : rd_sec_addr <= mai_jinenghit_left;
                                8'd44 : rd_sec_addr <= mai_jinenghit_right;
                                8'd45 : rd_sec_addr <= lori_jinenghit_left;
                                8'd46 : rd_sec_addr <= lori_jinenghit_right;

                                default : rd_sec_addr <= FIGHT_BACKGROUND;
                            endcase
                            // wr_load <= 1'b1;
                        end
                        // 4'b0100 : begin
                        //     case(photo_load_cnt)
                        //         8'd0 : rd_sec_addr <= FIGHT_BACKGROUND;
                        //         8'd1 : rd_sec_addr <= GAME_BACKGROUND_1;
                        //         8'd2 : rd_sec_addr <= GAME_OVER_BACKGROUND;
                        //         8'd3 : rd_sec_addr <= WATING;
                        //         default : ;
                        //     endcase
                        // end
                        default : rd_sec_addr<=rd_sec_addr;
                    endcase
                end

                else  begin
                    rd_sec_addr <= GAME_OVER_BACKGROUND; 
                    // wr_load <= 1'b1;
                end
                game_flag_last <=  GAME_SWITCH;     
            end
            2'd1 : begin
                wr_load <= 1'b0;
                //读忙信号的下降沿代表读完一个扇区,开始读取下一扇区地址数据
                if(neg_rd_busy) begin                          
                    rd_sec_cnt <= rd_sec_cnt + 11'd1;
                    rd_sec_addr <= rd_sec_addr + 32'd1;
                    if(photo_load_cnt&&(photo_load_cnt<=PHOTO_NUM) ) begin
                        //单张图片读完
                        if(rd_sec_cnt == RD_NUM - 11'b1) begin 
                            rd_sec_cnt <= 11'd0;
                            //rd_flow_cnt <= rd_flow_cnt + 2'd1;
                            rd_flow_cnt <=2'd2;
                        end    
                        else
                            rd_start_en <= 1'b1;     
                    end

                    else begin
                        //单张图片读完
                        if(rd_sec_cnt == RD_SECTION_NUM - 11'b1) begin 
                            rd_sec_cnt <= 11'd0;
                            //rd_flow_cnt <= rd_flow_cnt + 2'd1;
                            rd_flow_cnt <=2'd2;
                        end    
                        else
                            rd_start_en <= 1'b1; 
                    end              
                end
                else ;                   
            end
            2'd2 : begin
                if(game_flag_last != GAME_SWITCH) begin
                    rd_flow_cnt <= 2'd0;
                end

                else if (GAME_SWITCH[1]&&!GAME_OVER) begin
                    if(photo_load_cnt >=PHOTO_NUM) begin 
                        photo_load_cnt <= PHOTO_NUM+8'd1; 
                        rd_flow_cnt <= 2'd2;
                    end
                    else begin 
                        photo_load_cnt <= photo_load_cnt + 8'd1;
                        rd_flow_cnt <= 2'd0;
                    end
                end

                else if(GAME_OVER) rd_flow_cnt <= 2'd0;
                else  rd_flow_cnt <= 2'd2;

            end    
            default : ;
        endcase    
    end
end


endmodule