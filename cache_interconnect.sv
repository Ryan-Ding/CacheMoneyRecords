import lc3b_types::*;

module cache_interconnect
(
	//wishbone from icache and dcache
	wishbone.master icache,
	wishbone.master dcache,
	//wishbone between L1 cache and L2 cache 
	wishbone.slave l2cache_slave,
	//wishbone between physical memory and L2 cache
	wishbone.master pmem_master,
	wishbone.slave pmem_slave
	
);

//declare signals
logic l2wdatamux_sel;
logic l2selmux_sel;
logic l2adrmux_sel;

logic icache_we;
logic dcache_we;
logic l2cache_we;
logic icache_stb;
logic dcache_stb;
logic l2cache_stb;
logic icache_cyc;
logic dcache_cyc;
logic l2cache_cyc;
logic l2cache_ack;
logic pmem_ack;
logic icache_ack;
logic dcache_ack;
//L1 wdata SEL address rdata
lc3b_line icache_wdata;
lc3b_line dcache_wdata;
lc3b_word icache_address;
lc3b_word dcache_address;
lc3b_word icache_sel;
lc3b_word dcache_sel;
//lc3b_line l1cache_rdata;
//L2 wdata SEL address rdata
lc3b_line l2cache_wdata;
lc3b_word l2cache_sel;
lc3b_word l2cache_address;
lc3b_line l2cache_rdata;
//physical memory rdata
lc3b_line pmem_rdata;
lc3b_word pmem_address;


//icache master
//master output
assign icache_we = icache.WE;
assign icache_stb = icache.STB;
assign icache_cyc = icache.CYC;
assign icache_sel = icache.SEL;
assign icache_address = icache.ADR;
assign icache_wdata = icache.DAT_M;
//master input
assign icache.DAT_S = l2cache_slave.DTA_S;
assign icache.ACK = icache_ack;
assign icache.RTY = l2cache_slave.RTY;

//dcache master
//dcache output ctrl input
assign dcache_we = dcache.WE;
assign dcache_stb = dcache.STB;
assign dcache_cyc = dcache.CYC;
assign dcache_sel = dcache.SEL;
assign dcache_address = dcache.ADR;
assign dcache_wdata = dcache.DAT_M;
//dcache input 
assign dcache.DAT_S = l2cache_slave.DTA_S;
assign dcache.ACK = dcache_ack;
assign dcache.RTY = l2cache_slave.RTY;

//L2 cache slave l2cache_slave
//l2cache_slave output
assign l2cache_rdata = l2cache_slave.DAT_S;
assign l2cache_ack = l2cache_slave.ACK;
//l2cache_slave input
assign l2cache_slave.WE = l2cache_we;
assign l2cache_slave.DAT_M = l2cache_wdata;
assign l2cache_slave.CYC = l2cache_cyc;
assign l2cache_slave.STB = l2cache_stb;
assign l2cache_slave.SEL = l2cache_sel;
assign l2cache_slave.ADR = l2cache_address;

//L2 cache master pmem_master
//pmem_master output
assign pmem_slave.DAT_M = pmem_master.DAT_M;
assign pmem_slave.CYC = pmem_master.CYC;
assign pmem_slave.STB = pmem_master.STB;
assign pmem_slave.WE = pmem_master.WE;
assign pmem_slave.SEL = pmem_master.SEL;
assign pmem_slave.ADR = pmem_master.ADR;
//pmem_master input
assign pmem_master.DAT_S = pmem_slave.DAT_S;
assign pmem_master.ACK = pmem_slave.ACK;
assign pmem_master.RTY = pmem_slave.RTY;

//pmem slave pmem_slave
assign pmem_ack = pmem_slave.ACK;
assign pmem_address = pmem_master.ADR;
assign pmem_rdata = pmem_slave.DAT_S;


cache_interconnect_control cache_interconnect_control
(
   /* Input and output port declarations */
	.clk(icache.CLK),
	/* Datapath controls */
	//control signal
	.l2wdatamux_sel,
	.l2selmux_sel,
	.l2adrmux_sel,
	
	//1 bit control signals
	.icache_we,
	.dcache_we,
	.l2cache_we,
	.icache_stb,
	.dcache_stb,
	.l2cache_stb,
	.icache_cyc,
	.dcache_cyc,
	.l2cache_cyc,
	.l2cache_ack,
	.pmem_ack,
	.icache_ack,
	.dcache_ack
	 
);

cache_interconnect_datapath cache_interconnect_datapath
(
	//L1 wdata SEL address rdata
	.icache_wdata,
	.dcache_wdata,
	.icache_address,
	.dcache_address,
	.icache_sel,
	.dcache_sel,
	//.l1cache_rdata,
	//L2 wdata SEL address rdata
	.l2cache_wdata,
	.l2cache_sel,
	.l2cache_address,
	.l2cache_rdata,
	//physical memory rdata
	.pmem_rdata,
	.pmem_address,
	//control signal
	.l2wdatamux_sel,
	.l2selmux_sel,
	.l2adrmux_sel
	
);


endmodule : cache_interconnect