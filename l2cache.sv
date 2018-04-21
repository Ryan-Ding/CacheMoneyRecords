import lc3b_types::*;

module l2cache
(

		wishbone.slave wb_cpu_cache,
		wishbone.master wb_cache_mem,
		output lc3b_word l2_miss_counter,
		output lc3b_word l2_hit_counter
);



/* Instantiate MP 0 top level blocks here */

logic way0_write;
logic v0_in;
logic dirty0_in;
logic way1_write;
logic v1_in;
logic dirty1_in;
logic way2_write;
logic v2_in;
logic dirty2_in;
logic way3_write;
logic v3_in;
logic dirty3_in;

logic lru_write;
logic datainmux_sel;
logic memaddrmux_sel;
logic dirty;
logic hit;
logic [1:0] way_hit;
logic [1:0] wb_way_sel;

logic mem_ack;
logic mem_rty;
logic mem_cyc;
logic mem_stb;
logic mem_we;
	 
	 //cpu
logic cpu_cyc;
logic cpu_stb;
logic cpu_we;
logic cpu_ack;
//logic cpu_rty;

lc3b_word adr_i_cpu;
lc3b_8words dat_o_cpu;
logic [15:0] cpu_sel;
lc3b_8words dat_i_cpu;
	 
	 //mem signals
lc3b_8words dat_o_mem;
lc3b_word adr_o_mem;
lc3b_8words dat_i_mem;



assign wb_cpu_cache.DAT_S = dat_o_cpu;
assign wb_cpu_cache.ACK = cpu_ack;
//assign wb_cpu_cache.RTY = cpu_rty;
assign wb_cpu_cache.RTY = wb_cpu_cache.STB & wb_cpu_cache.CYC & (!wb_cpu_cache.ACK);

assign cpu_sel = wb_cpu_cache.SEL;
assign dat_i_cpu = wb_cpu_cache.DAT_M;
assign cpu_cyc = wb_cpu_cache.CYC;
assign cpu_stb = wb_cpu_cache.STB;
assign cpu_we = wb_cpu_cache.WE;
assign adr_i_cpu = {wb_cpu_cache.ADR,4'b0000};

assign wb_cache_mem.DAT_M = dat_o_mem;
assign wb_cache_mem.CYC = mem_cyc;
assign wb_cache_mem.STB = mem_stb;
assign wb_cache_mem.WE = mem_we;
assign wb_cache_mem.SEL = 16'b1111111111111111;
assign wb_cache_mem.ADR = adr_o_mem[15:4];

assign dat_i_mem = wb_cache_mem.DAT_S;
assign mem_ack = wb_cache_mem.ACK;
assign mem_rty = wb_cache_mem.RTY;

lc3b_word l2_total_counter;
assign l2_hit_counter = l2_total_counter - l2_miss_counter;
initial 
begin
	l2_miss_counter = 0;
	l2_total_counter = 0;
end

always_ff @ (posedge wb_cache_mem.CLK)
begin
    if (mem_ack && mem_cyc && !mem_we)
        l2_miss_counter++;
	 if (cpu_ack)
		  l2_total_counter++;
end

l2cache_control l2cache_control
(
    /* Input and output port declarations */
	 .clk(wb_cache_mem.CLK),
	 /* Datapath controls */
	 .way0_write,
	 .v0_in,
	 .dirty0_in,
	 .way1_write,
	 .v1_in,
	 .dirty1_in,
	 .way2_write,
	 .v2_in,
	 .dirty2_in,
	 .way3_write,
	 .v3_in,
	 .dirty3_in,
	 .lru_write,
	 .datainmux_sel,
	 .memaddrmux_sel,
	 .dirty,
	 .hit,
	 .way_hit,
	 .wb_way_sel,
	 // physical memory
	 .mem_ack,
	 .mem_rty,
	 .mem_cyc,
	 .mem_stb,
	 .mem_we,
	 
	 //cpu
	 .cpu_cyc,
	 .cpu_stb,
	 .cpu_we,
	 .cpu_ack
//	 output logic cpu_rty
	 
);

l2cache_datapath l2cache_datapath
(
    .clk(wb_cache_mem.CLK),

    /* control signals */
    .adr_i_cpu,
	 .way0_write,
	 .v0_in,
	 . dirty0_in,
	 .way1_write,
	 .v1_in,
	 .dirty1_in,
	 .way2_write,
	 . way3_write,
	 .v2_in,
	 .v3_in,
	 .dirty2_in,
	 .dirty3_in,
	 .lru_write, 
	 .datainmux_sel,
	 .memaddrmux_sel,
	 .dirty,
	 .hit,
	 .way_hit,
	 .wb_way_sel,
	 
	 //cpu signals
	 .dat_o_cpu,
	 .cpu_sel,
	 .dat_i_cpu,
	 
	 //mem signals
	 .dat_o_mem,
	 .adr_o_mem,
	 .dat_i_mem	 
	 
	 
);


endmodule : l2cache
