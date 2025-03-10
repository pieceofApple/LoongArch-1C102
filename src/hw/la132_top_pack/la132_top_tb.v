`timescale 100 ps/100 ps



module la132_top_tb ;

reg mode_lisa;
reg [31:0] inst_xor;
reg [31:0] boot_pc;
reg clk;
reg clk_count;
reg hard_resetn;
reg soft_resetn;
wire sleeping;
wire can_high_freq;
wire cpu_debug_mode;
wire [31:0] cpu_fetch_pc;
reg nmi;
reg [5:0] ext_int;
reg [3:0] prid_revision;
reg [9:0] cpunum;
wire [3:0] arid;
wire [31:0] araddr;
wire [3:0] arlen;
wire [2:0] arsize;
wire [1:0] arburst;
wire [1:0] arlock;
wire [3:0] arcache;
wire [2:0] arprot;
wire arvalid;
reg arready;
reg [3:0] rid;
reg [31:0] rdata;
reg [1:0] rresp;
reg rlast;
reg rvalid;
wire rready;
wire [3:0] awid;
wire [31:0] awaddr;
wire [3:0] awlen;
wire [2:0] awsize;
wire [1:0] awburst;
wire [1:0] awlock;
wire [3:0] awcache;
wire [2:0] awprot;
wire awvalid;
reg awready;
wire [3:0] wid;
wire [31:0] wdata;
wire [3:0] wstrb;
wire wlast;
wire wvalid;
reg wready;
reg [3:0] bid;
reg [1:0] bresp;
reg bvalid;
wire bready;
wire inst_sram_en;
wire [3:0] inst_sram_strb;
wire inst_sram_wr;
wire inst_sram_fetch;
wire [31:0] inst_sram_addr;
wire [31:0] inst_sram_wdata;
reg [31:0] inst_sram_rdata;
wire data_sram_en;
wire [3:0] data_sram_strb;
wire data_sram_wr;
wire data_sram_fetch;
wire [31:0] data_sram_addr;
wire [31:0] data_sram_wdata;
reg [31:0] data_sram_rdata;
reg inst_sram_ack;
reg inst_sram_rrdy;
reg inst_sram_resp;
reg data_sram_ack;
reg data_sram_rrdy;
reg data_sram_resp;
wire ljtag_prrst;
reg ljtag_lock;
reg trstn;
reg tck;
reg tms;
reg tdi;
wire tdo;
wire [0:0] dcc_ram_tagv_req_bus;
wire [0:0] dcc_ram_data_req_bus;
wire [0:0] dcc_ram_lrud_req_bus;
reg [0:0] dcc_ram_tagv_resp_bus;
reg [0:0] dcc_ram_data_resp_bus;
reg [0:0] dcc_ram_lrud_resp_bus;
wire [0:0] icc_ram_tagv_req_bus;
wire [0:0] icc_ram_data_req_bus;
wire [0:0] icc_ram_lrud_req_bus;
reg [0:0] icc_ram_tagv_resp_bus;
reg [0:0] icc_ram_data_resp_bus;
reg [0:0] icc_ram_lrud_resp_bus;
wire [31:0] wb_pc;
wire [4:0] wb_rf_dest;
wire wb_rf_wen;
wire [31:0] wb_rf_value;
reg ibus0_valid;
reg [31:0] ibus0_base;
reg [31:0] ibus0_mask;
reg ibus1_valid;
reg [31:0] ibus1_base;
reg [31:0] ibus1_mask;
reg ibus2_valid;
reg [31:0] ibus2_base;
reg [31:0] ibus2_mask;
reg ibus3_valid;
reg [31:0] ibus3_base;
reg [31:0] ibus3_mask;
reg dbus0_valid;
reg [31:0] dbus0_base;
reg [31:0] dbus0_mask;
reg dbus1_valid;
reg [31:0] dbus1_base;
reg [31:0] dbus1_mask;
reg dbus2_valid;
reg [31:0] dbus2_base;
reg [31:0] dbus2_mask;
reg dbus3_valid;
reg [31:0] dbus3_base;
reg [31:0] dbus3_mask;
reg test_mode;
la132_top la132_top_ins (
    .mode_lisa(mode_lisa),
    .inst_xor(inst_xor[31:0]),
    .boot_pc(boot_pc[31:0]),
    .clk(clk),
    .clk_count(clk_count),
    .hard_resetn(hard_resetn),
    .soft_resetn(soft_resetn),
    .sleeping(sleeping),
    .can_high_freq(can_high_freq),
    .cpu_debug_mode(cpu_debug_mode),
    .cpu_fetch_pc(cpu_fetch_pc[31:0]),
    .nmi(nmi),
    .ext_int(ext_int[5:0]),
    .prid_revision(prid_revision[3:0]),
    .cpunum(cpunum[9:0]),
    .arid(arid[3:0]),
    .araddr(araddr[31:0]),
    .arlen(arlen[3:0]),
    .arsize(arsize[2:0]),
    .arburst(arburst[1:0]),
    .arlock(arlock[1:0]),
    .arcache(arcache[3:0]),
    .arprot(arprot[2:0]),
    .arvalid(arvalid),
    .arready(arready),
    .rid(rid[3:0]),
    .rdata(rdata[31:0]),
    .rresp(rresp[1:0]),
    .rlast(rlast),
    .rvalid(rvalid),
    .rready(rready),
    .awid(awid[3:0]),
    .awaddr(awaddr[31:0]),
    .awlen(awlen[3:0]),
    .awsize(awsize[2:0]),
    .awburst(awburst[1:0]),
    .awlock(awlock[1:0]),
    .awcache(awcache[3:0]),
    .awprot(awprot[2:0]),
    .awvalid(awvalid),
    .awready(awready),
    .wid(wid[3:0]),
    .wdata(wdata[31:0]),
    .wstrb(wstrb[3:0]),
    .wlast(wlast),
    .wvalid(wvalid),
    .wready(wready),
    .bid(bid[3:0]),
    .bresp(bresp[1:0]),
    .bvalid(bvalid),
    .bready(bready),
    .inst_sram_en(inst_sram_en),
    .inst_sram_strb(inst_sram_strb[3:0]),
    .inst_sram_wr(inst_sram_wr),
    .inst_sram_fetch(inst_sram_fetch),
    .inst_sram_addr(inst_sram_addr[31:0]),
    .inst_sram_wdata(inst_sram_wdata[31:0]),
    .inst_sram_rdata(inst_sram_rdata[31:0]),
    .data_sram_en(data_sram_en),
    .data_sram_strb(data_sram_strb[3:0]),
    .data_sram_wr(data_sram_wr),
    .data_sram_fetch(data_sram_fetch),
    .data_sram_addr(data_sram_addr[31:0]),
    .data_sram_wdata(data_sram_wdata[31:0]),
    .data_sram_rdata(data_sram_rdata[31:0]),
    .inst_sram_ack(inst_sram_ack),
    .inst_sram_rrdy(inst_sram_rrdy),
    .inst_sram_resp(inst_sram_resp),
    .data_sram_ack(data_sram_ack),
    .data_sram_rrdy(data_sram_rrdy),
    .data_sram_resp(data_sram_resp),
    .ljtag_prrst(ljtag_prrst),
    .ljtag_lock(ljtag_lock),
    .trstn(trstn),
    .tck(tck),
    .tms(tms),
    .tdi(tdi),
    .tdo(tdo),
    .dcc_ram_tagv_req_bus(dcc_ram_tagv_req_bus[0:0]),
    .dcc_ram_data_req_bus(dcc_ram_data_req_bus[0:0]),
    .dcc_ram_lrud_req_bus(dcc_ram_lrud_req_bus[0:0]),
    .dcc_ram_tagv_resp_bus(dcc_ram_tagv_resp_bus[0:0]),
    .dcc_ram_data_resp_bus(dcc_ram_data_resp_bus[0:0]),
    .dcc_ram_lrud_resp_bus(dcc_ram_lrud_resp_bus[0:0]),
    .icc_ram_tagv_req_bus(icc_ram_tagv_req_bus[0:0]),
    .icc_ram_data_req_bus(icc_ram_data_req_bus[0:0]),
    .icc_ram_lrud_req_bus(icc_ram_lrud_req_bus[0:0]),
    .icc_ram_tagv_resp_bus(icc_ram_tagv_resp_bus[0:0]),
    .icc_ram_data_resp_bus(icc_ram_data_resp_bus[0:0]),
    .icc_ram_lrud_resp_bus(icc_ram_lrud_resp_bus[0:0]),
    .wb_pc(wb_pc[31:0]),
    .wb_rf_dest(wb_rf_dest[4:0]),
    .wb_rf_wen(wb_rf_wen),
    .wb_rf_value(wb_rf_value[31:0]),
    .ibus0_valid(ibus0_valid),
    .ibus0_base(ibus0_base[31:0]),
    .ibus0_mask(ibus0_mask[31:0]),
    .ibus1_valid(ibus1_valid),
    .ibus1_base(ibus1_base[31:0]),
    .ibus1_mask(ibus1_mask[31:0]),
    .ibus2_valid(ibus2_valid),
    .ibus2_base(ibus2_base[31:0]),
    .ibus2_mask(ibus2_mask[31:0]),
    .ibus3_valid(ibus3_valid),
    .ibus3_base(ibus3_base[31:0]),
    .ibus3_mask(ibus3_mask[31:0]),
    .dbus0_valid(dbus0_valid),
    .dbus0_base(dbus0_base[31:0]),
    .dbus0_mask(dbus0_mask[31:0]),
    .dbus1_valid(dbus1_valid),
    .dbus1_base(dbus1_base[31:0]),
    .dbus1_mask(dbus1_mask[31:0]),
    .dbus2_valid(dbus2_valid),
    .dbus2_base(dbus2_base[31:0]),
    .dbus2_mask(dbus2_mask[31:0]),
    .dbus3_valid(dbus3_valid),
    .dbus3_base(dbus3_base[31:0]),
    .dbus3_mask(dbus3_mask[31:0]),
    .test_mode(test_mode)
);


// Parameters
parameter CLK_PERIOD = 10; // ??????
parameter SIM_TIME   = 1000; // ??????
// Clock generation
always #((CLK_PERIOD)/2) clk <= ~clk;

// Stimulus
initial begin
    $dumpfile("cpu_core_tb.vcd");
    $dumpvars(0, la132_top_tb);

    // Initialize inputs
    mode_lisa = 1'b1 ;
    inst_xor = 32'h0;
    boot_pc = 32'h1c000000;
    clk_count = 1'b0;
    hard_resetn = 1'b0;
    soft_resetn = 1'b0;
    nmi = 1'b0;
    ext_int = 6'b000000;
    prid_revision = 4'b0000;
    cpunum = 10'b0000000000;
    test_mode = 1'b0;

    // Apply reset
    hard_resetn = 1'b0;
    #100;
    hard_resetn = 1'b1;

    // Add test stimuli here

    // End simulation
    #SIM_TIME;
    $finish;
end



endmodule
