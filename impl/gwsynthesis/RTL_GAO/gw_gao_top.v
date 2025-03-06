module gw_gao(
    \video[19] ,
    \video[18] ,
    \video[17] ,
    \video[16] ,
    \video[15] ,
    \video[14] ,
    \video[13] ,
    \video[12] ,
    \video[11] ,
    \video[10] ,
    \video[9] ,
    \video[8] ,
    \video[7] ,
    \video[6] ,
    \video[5] ,
    \video[4] ,
    \video[3] ,
    \video[2] ,
    \video[1] ,
    \video[0] ,
    ov5640_pclk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \video[19] ;
input \video[18] ;
input \video[17] ;
input \video[16] ;
input \video[15] ;
input \video[14] ;
input \video[13] ;
input \video[12] ;
input \video[11] ;
input \video[10] ;
input \video[9] ;
input \video[8] ;
input \video[7] ;
input \video[6] ;
input \video[5] ;
input \video[4] ;
input \video[3] ;
input \video[2] ;
input \video[1] ;
input \video[0] ;
input ov5640_pclk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \video[19] ;
wire \video[18] ;
wire \video[17] ;
wire \video[16] ;
wire \video[15] ;
wire \video[14] ;
wire \video[13] ;
wire \video[12] ;
wire \video[11] ;
wire \video[10] ;
wire \video[9] ;
wire \video[8] ;
wire \video[7] ;
wire \video[6] ;
wire \video[5] ;
wire \video[4] ;
wire \video[3] ;
wire \video[2] ;
wire \video[1] ;
wire \video[0] ;
wire ov5640_pclk;
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
    .trig0_i({\video[19] ,\video[18] ,\video[17] ,\video[16] ,\video[15] ,\video[14] ,\video[13] ,\video[12] ,\video[11] ,\video[10] ,\video[9] ,\video[8] ,\video[7] ,\video[6] ,\video[5] ,\video[4] ,\video[3] ,\video[2] ,\video[1] ,\video[0] }),
    .data_i({\video[19] ,\video[18] ,\video[17] ,\video[16] ,\video[15] ,\video[14] ,\video[13] ,\video[12] ,\video[11] ,\video[10] ,\video[9] ,\video[8] ,\video[7] ,\video[6] ,\video[5] ,\video[4] ,\video[3] ,\video[2] ,\video[1] ,\video[0] }),
    .clk_i(ov5640_pclk)
);

endmodule
