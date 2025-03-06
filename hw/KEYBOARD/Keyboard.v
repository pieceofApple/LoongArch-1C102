module Keyboard(
    input                 clk,
    input                 rstn,
    input                 key_clear,
    input        [3 :0]   col,
    output       [3 :0]   row,
    output           interrupt_key,
    output       [15:0]   key_data
    // input        [15:0]   key
);

wire  [15:0]  key;
Keyboard_scan Keyboard_scan(
     .clk(clk)
    ,.rstn(rstn)
    ,.col(col)
    ,.row(row)
    ,.key(key)
);


wire [15:0] key_pulse;
Keyboard_filter Keyboard_filter(
     .clk(clk)
    ,.rstn(rstn)
    ,.key_in(key)
    ,.key_pulse(key_pulse)
);

assign interrupt_key = |key_pulse ;

Keyboard_reg Keyboard_reg(
     .clk(clk)
    ,.rstn(rstn)
    ,.key_clear(key_clear)
    ,.key_pulse(key_pulse)
    ,.key_reg(key_data)
);

endmodule