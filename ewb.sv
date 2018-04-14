import lc3b_types::*;

module ewb
(
		wishbone.slave wb_cpu_cache,
		wishbone.master wb_cache_mem
);
lc3b_word cpu_addr;
lc3b_line cpu_wdata;
lc3b_line mem_wdata;
lc3b_word mem_addr;

logic cpu_we;
logic mem_ack;
logic cpu_stb;
logic cpu_cyc;
logic cpu_ack;
logic mem_stb;
logic mem_cyc;
logic mem_we;
logic load_data;
logic datamux_sel;

assign wb_cpu_cache.DAT_S = wb_cache_mem.DAT_S;
assign wb_cpu_cache.ACK = cpu_ack;
assign wb_cpu_cache.RTY = wb_cpu_cache.STB & wb_cpu_cache.CYC & (!wb_cpu_cache.ACK);

assign cpu_wdata = wb_cpu_cache.DAT_M;
assign cpu_cyc = wb_cpu_cache.CYC;
assign cpu_stb = wb_cpu_cache.STB;
assign cpu_we = wb_cpu_cache.WE;
assign cpu_addr = wb_cpu_cache.ADR;

assign wb_cache_mem.DAT_M = mem_wdata;
assign wb_cache_mem.CYC = mem_cyc;
assign wb_cache_mem.STB = mem_stb;
assign wb_cache_mem.WE = mem_we;
assign wb_cache_mem.SEL = 16'b1111111111111111;
assign wb_cache_mem.ADR = mem_addr;

assign mem_ack = wb_cache_mem.ACK;
assign mem_rty = wb_cache_mem.RTY;

ewb_datapath ewb_datapath
(
	.clk(wb_cpu_cache.CLK),
	.load_data,
	.cpu_addr,
	.cpu_wdata,
	.datamux_sel,
	.mem_wdata,
	.mem_addr
);

ewb_control ewb_control
(	
	.clk(wb_cpu_cache.CLK),
	.cpu_we,
	.mem_ack,
	.cpu_stb,
	.cpu_cyc,
	.cpu_ack,
	.mem_stb,
	.mem_cyc,
	.mem_we,
	.load_data,
	.datamux_sel
);
endmodule : ewb