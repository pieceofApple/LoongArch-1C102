module gw_gao(
    \lcd_cnt[31] ,
    \lcd_cnt[30] ,
    \lcd_cnt[29] ,
    \lcd_cnt[28] ,
    \lcd_cnt[27] ,
    \lcd_cnt[26] ,
    \lcd_cnt[25] ,
    \lcd_cnt[24] ,
    \lcd_cnt[23] ,
    \lcd_cnt[22] ,
    \lcd_cnt[21] ,
    \lcd_cnt[20] ,
    \lcd_cnt[19] ,
    \lcd_cnt[18] ,
    \lcd_cnt[17] ,
    \lcd_cnt[16] ,
    \lcd_cnt[15] ,
    \lcd_cnt[14] ,
    \lcd_cnt[13] ,
    \lcd_cnt[12] ,
    \lcd_cnt[11] ,
    \lcd_cnt[10] ,
    \lcd_cnt[9] ,
    \lcd_cnt[8] ,
    \lcd_cnt[7] ,
    \lcd_cnt[6] ,
    \lcd_cnt[5] ,
    \lcd_cnt[4] ,
    \lcd_cnt[3] ,
    \lcd_cnt[2] ,
    \lcd_cnt[1] ,
    \lcd_cnt[0] ,
    LCD_RD,
    LCD_RS,
    LCD_RST,
    LCD_WR,
    lcd_pwrite,
    \A_cpu/A_axi2apb/clk_ext8m ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \lcd_cnt[31] ;
input \lcd_cnt[30] ;
input \lcd_cnt[29] ;
input \lcd_cnt[28] ;
input \lcd_cnt[27] ;
input \lcd_cnt[26] ;
input \lcd_cnt[25] ;
input \lcd_cnt[24] ;
input \lcd_cnt[23] ;
input \lcd_cnt[22] ;
input \lcd_cnt[21] ;
input \lcd_cnt[20] ;
input \lcd_cnt[19] ;
input \lcd_cnt[18] ;
input \lcd_cnt[17] ;
input \lcd_cnt[16] ;
input \lcd_cnt[15] ;
input \lcd_cnt[14] ;
input \lcd_cnt[13] ;
input \lcd_cnt[12] ;
input \lcd_cnt[11] ;
input \lcd_cnt[10] ;
input \lcd_cnt[9] ;
input \lcd_cnt[8] ;
input \lcd_cnt[7] ;
input \lcd_cnt[6] ;
input \lcd_cnt[5] ;
input \lcd_cnt[4] ;
input \lcd_cnt[3] ;
input \lcd_cnt[2] ;
input \lcd_cnt[1] ;
input \lcd_cnt[0] ;
input LCD_RD;
input LCD_RS;
input LCD_RST;
input LCD_WR;
input lcd_pwrite;
input \A_cpu/A_axi2apb/clk_ext8m ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \lcd_cnt[31] ;
wire \lcd_cnt[30] ;
wire \lcd_cnt[29] ;
wire \lcd_cnt[28] ;
wire \lcd_cnt[27] ;
wire \lcd_cnt[26] ;
wire \lcd_cnt[25] ;
wire \lcd_cnt[24] ;
wire \lcd_cnt[23] ;
wire \lcd_cnt[22] ;
wire \lcd_cnt[21] ;
wire \lcd_cnt[20] ;
wire \lcd_cnt[19] ;
wire \lcd_cnt[18] ;
wire \lcd_cnt[17] ;
wire \lcd_cnt[16] ;
wire \lcd_cnt[15] ;
wire \lcd_cnt[14] ;
wire \lcd_cnt[13] ;
wire \lcd_cnt[12] ;
wire \lcd_cnt[11] ;
wire \lcd_cnt[10] ;
wire \lcd_cnt[9] ;
wire \lcd_cnt[8] ;
wire \lcd_cnt[7] ;
wire \lcd_cnt[6] ;
wire \lcd_cnt[5] ;
wire \lcd_cnt[4] ;
wire \lcd_cnt[3] ;
wire \lcd_cnt[2] ;
wire \lcd_cnt[1] ;
wire \lcd_cnt[0] ;
wire LCD_RD;
wire LCD_RS;
wire LCD_RST;
wire LCD_WR;
wire lcd_pwrite;
wire \A_cpu/A_axi2apb/clk_ext8m ;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i({\lcd_cnt[31] ,\lcd_cnt[30] ,\lcd_cnt[29] ,\lcd_cnt[28] ,\lcd_cnt[27] ,\lcd_cnt[26] ,\lcd_cnt[25] ,\lcd_cnt[24] ,\lcd_cnt[23] ,\lcd_cnt[22] ,\lcd_cnt[21] ,\lcd_cnt[20] ,\lcd_cnt[19] ,\lcd_cnt[18] ,\lcd_cnt[17] ,\lcd_cnt[16] ,\lcd_cnt[15] ,\lcd_cnt[14] ,\lcd_cnt[13] ,\lcd_cnt[12] ,\lcd_cnt[11] ,\lcd_cnt[10] ,\lcd_cnt[9] ,\lcd_cnt[8] ,\lcd_cnt[7] ,\lcd_cnt[6] ,\lcd_cnt[5] ,\lcd_cnt[4] ,\lcd_cnt[3] ,\lcd_cnt[2] ,\lcd_cnt[1] ,\lcd_cnt[0] ,LCD_RD,LCD_RS,LCD_RST,LCD_WR,lcd_pwrite}),
    .data_i({\lcd_cnt[31] ,\lcd_cnt[30] ,\lcd_cnt[29] ,\lcd_cnt[28] ,\lcd_cnt[27] ,\lcd_cnt[26] ,\lcd_cnt[25] ,\lcd_cnt[24] ,\lcd_cnt[23] ,\lcd_cnt[22] ,\lcd_cnt[21] ,\lcd_cnt[20] ,\lcd_cnt[19] ,\lcd_cnt[18] ,\lcd_cnt[17] ,\lcd_cnt[16] ,\lcd_cnt[15] ,\lcd_cnt[14] ,\lcd_cnt[13] ,\lcd_cnt[12] ,\lcd_cnt[11] ,\lcd_cnt[10] ,\lcd_cnt[9] ,\lcd_cnt[8] ,\lcd_cnt[7] ,\lcd_cnt[6] ,\lcd_cnt[5] ,\lcd_cnt[4] ,\lcd_cnt[3] ,\lcd_cnt[2] ,\lcd_cnt[1] ,\lcd_cnt[0] ,LCD_RD,LCD_RS,LCD_RST,LCD_WR,lcd_pwrite}),
    .clk_i(\A_cpu/A_axi2apb/clk_ext8m )
);

endmodule
