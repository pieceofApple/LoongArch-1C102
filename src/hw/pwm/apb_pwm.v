`include "config.v"
//使能信号没加
module apb_pwm(
    input                         apb_pclk,
    input                         apb_prstn,
    input                         apb_psel,
	input  [`ADDR_APB-1:0]        apb_paddr,
	input                         apb_pwrite,
	input                         apb_penable,
    input  reg [`DATA_APB-1:0]    apb_pwdata,
    output reg [`DATA_APB-1:0]    apb_prdata,
    
    // pwm01 signals
    output reg                    pwm01
);

reg [31:0] div_freq_r;//分频系数
reg [31:0] comp_r;//比较值
reg [31:0] state_r;//状态寄存器

// pwm_counter Registers
reg [31:0] pwm_counter;

// 定义状态
typedef enum logic [2:0] {
    IDLE,
    READ,
    WRITE
} state_type;

// 状态寄存器和下一状态逻辑
reg [2:0] state, next_state;

always @(*) begin
    case (state)
        IDLE: begin
            if (apb_psel && apb_penable) begin
                if (apb_pwrite) begin
                    next_state = WRITE;
                end
                else
                    next_state = READ;
            end else begin
                next_state = IDLE;
            end
        end
        READ: begin
            next_state = IDLE;
        end
        WRITE: begin
            next_state = IDLE;
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

// 状态转移
always @(posedge apb_pclk or negedge apb_prstn) begin
    if (~apb_prstn) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

// 输出逻辑
always @(posedge apb_pclk) begin
    case (state)
        IDLE: begin
            div_freq_r = 32'h00000000;
            comp_r = 32'h00000000;
            state_r = 32'h00000000;
            // 在 IDLE 状态下不执行任何操作
        end
        READ: begin
            // 读取操作的处理逻辑
            // 可以根据 apb_PADDR 的值进行读取操作
            case (apb_paddr)
                8'h30: apb_prdata <= div_freq_r; 
                8'h34: apb_prdata <= comp_r;
                8'h38: apb_prdata <= state_r;
                default: ; // 默认情况下不做操作
            endcase
        end
        WRITE: begin
            // 写入操作的处理逻辑
            // 可以根据 apb_paddr 和 apb_PWDATA 的值进行写入操作
            case (apb_paddr)
                8'h30: div_freq_r <= apb_pwdata;
                8'h34: comp_r     <= apb_pwdata;
                8'h38: state_r    <= apb_pwdata;
                default: ; // 默认情况
            endcase
        end
        default: begin
            // 默认情况下不执行任何操作
        end
    endcase
end

// PWM Logic
always @(posedge apb_pclk or negedge apb_prstn) begin
    if (~apb_prstn) begin
        pwm01 <= 1'b0;
    end else begin
        if (apb_psel && apb_penable && (state_r == 32'h0000_0001)) begin
            if (pwm_counter < comp_r) begin
                pwm01 <= 1'b1;
            end else begin
                pwm01 <= 1'b0;
            end
            
            if (pwm_counter == div_freq_r - 1) begin
                pwm_counter <= 32'h0000_0000;
            end else begin
                pwm_counter <= pwm_counter + 1;
            end
        end else begin
            pwm01 <= 1'b0;
            pwm_counter <= 32'h0000_0000;
        end
    end
end


endmodule
