//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.9.02
//Part Number: GW5AT-LV138PG484AC2/I1
//Device: GW5AT-138
//Device Version: B
//Created Time: Fri May 10 20:07:42 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    pll_sdram_sd_card your_instance_name(
        .lock(lock_o), //output lock
        .clkout0(clkout0_o), //output clkout0
        .clkout1(clkout1_o), //output clkout1
        .clkout2(clkout2_o), //output clkout2
        .clkout3(clkout3_o), //output clkout3
        .clkout4(clkout4_o), //output clkout4
        .clkout5(clkout5_o), //output clkout5
        .clkin(clkin_i), //input clkin
        .reset(reset_i) //input reset
    );

//--------Copy end-------------------
