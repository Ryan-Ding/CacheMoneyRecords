import lc3b_types::*;

module cache
(

		wishbone.slave wb_cpu_cache,
		wishbone.master wb_cache_mem,
		output lc3b_word l1_miss_counter,
		output lc3b_word l1_hit_counter
);



/* Instantiate MP 0 top level blocks here */

logic way0_write;
logic v0_write;
logic v0_in;
logic dirty0_write;
logic dirty0_in;
logic way1_write;
logic v1_write;
logic v1_in;
logic dirty1_write;
logic dirty1_in;
logic lru_write;
logic lru_in;
logic lru_out;
logic datainmux_sel;
logic memaddrmux_sel;
logic dirty;
logic hit;
logic hit0;

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
logic load_mar;
logic load_mdr;



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



logic reginmux_sel;
logic addrregmux_sel;	 

lc3b_word l1_total_counter;
assign l1_hit_counter = l1_total_counter - l1_miss_counter;
initial
begin
    l1_miss_counter = 0;
	 l1_total_counter = 0;
end

always_ff @ (posedge wb_cache_mem.CLK)
begin
    if (mem_ack && mem_cyc && !mem_we)
        l1_miss_counter++;
	 if (cpu_ack)
		  l1_total_counter++;
end


cache_control cache_controller
(
    /* Input and output port declarations */
	 .clk(wb_cache_mem.CLK),
	 /* Datapath controls */
	 .way0_write,
	 .v0_write,
	 .v0_in,
	 .dirty0_write,
	 .dirty0_in,
	 .way1_write,
	 .v1_write,
	 .v1_in,
	 .dirty1_write,
	 .dirty1_in,
	 .lru_write,
	 .lru_in,
	 .lru_out,
	 .datainmux_sel,
	 .memaddrmux_sel,
	 .dirty,
	 .hit,
	 .hit0,
	 
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
	 .cpu_ack,
	 .load_mar,
	 .load_mdr,
//	 .cpu_rty
	 
	 .reginmux_sel,
	 .addrregmux_sel
	 

);

cache_datapath cache_datapath1
(
    .clk(wb_cache_mem.CLK),

    /* control signals */
    .adr_i_cpu_in(adr_i_cpu),
	 .way0_write,
	 .v0_write,
	 .v0_in,
	 .dirty0_write,
	 .dirty0_in,
	 .way1_write,
	 .v1_write,
	 .v1_in,
	 .dirty1_write,
	 .dirty1_in,
	 .lru_write,
	 .lru_in,
	 .lru_out,
	 .datainmux_sel,
	 .memaddrmux_sel,
	 .dirty,
	 .hit,
	 .hit0,
	 
	 //cpu signals
	 .dat_o_cpu,
	 .cpu_sel,
	 .dat_i_cpu_in(dat_i_cpu),
	 
	 //mem signals
	 .dat_o_mem,
	 .adr_o_mem,
	 .dat_i_mem,
	 .load_mar,
	 .load_mdr,
	 
	 
	 .reginmux_sel,
	 .addrregmux_sel
);


endmodule : cache
