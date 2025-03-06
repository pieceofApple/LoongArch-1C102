`include "config.v"
//使能信号没加
module apb_gpio(
    input                         apb_pclk,
    input                         apb_prstn,
    input                         apb_psel,
	input  [`ADDR_APB-1:0]        apb_paddr,
	input                         apb_pwrite,
	input                         apb_penable,
    input  reg [`DATA_APB-1:0]    apb_pwdata,
    output reg [`DATA_APB-1:0]    apb_prdata,
    
    // GPIOA signals
    output reg   [31:0]        gpioa_o_r,//地址0x44
    inout  wire  [31:0]        gpioa_oe_r,//地址0x40,使能
    input        [31:0]        gpioa_i,//地址0x48
    // GPIOB signals
    output reg   [31:0]        gpiob_o_r,//地址0x54
    inout  wire  [31:0]        gpiob_oe_r,//地址0x50 
    input        [31:0]        gpiob_i //地址0x58
);


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
                //gpioa_oe_r = 32'hffff_ffff;
                //gpiob_oe_r = 32'hffff_ffff;
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
            // 在 IDLE 状态下不执行任何操作
        end
        READ: begin
            // 读取操作的处理逻辑
            // 可以根据 apb_PADDR 的值进行读取操作,并将读取的数据写入 apb_PRDATA
            case (apb_paddr[7:0])
                8'h48: apb_prdata <= gpioa_i; // 读取地址 0x48 对应的 GPIO 输入数据到 apb_prdata
                8'h58: apb_prdata <= gpiob_i; // 读取地址 0x58 对应的 GPIO 输入数据到 apb_prdata
                default: ; // 默认情况下不做操作
            endcase
        end
        WRITE: begin
            // 写入操作的处理逻辑
            // 根据 apb_paddr 和 apb_PWDATA 的值进行写入操作,根据具体的外设地址空间定义写入操作
            // 根据地址的不同来控制不同的 GPIO 输出
            case (apb_paddr[7:0])
                // 地址 0x44 控制第一路 GPIO，地址 0x54 控制第二路 GPIO
                8'h44: gpioa_o_r <= apb_pwdata;
                8'h54: gpiob_o_r <= apb_pwdata;
                default: ; // 默认情况
            endcase
        end
        default: begin
            // 默认情况下不执行任何操作
        end
    endcase
end

endmodule
