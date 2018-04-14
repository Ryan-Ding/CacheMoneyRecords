import lc3b_types::*;

module ewb_datapath
(
	input clk,
	input load_data,
	input lc3b_word cpu_addr,
	input lc3b_line cpu_wdata,
	input datamux_sel,
	output lc3b_line mem_wdata,
	output lc3b_word mem_addr
);

lc3b_line data_out;
lc3b_word wb_addr;
register #(.width(128)) ewb_data_reg
(
	.clk,
	.load(load_data),
	.in(cpu_wdata),
	.out(data_out)
);

register #(.width(16)) ewb_addr_reg
(
	.clk,
	.load(load_data),
	.in(cpu_addr),
	.out(wb_addr)
);

mux2 #(.width(128)) datamux
(
	.sel(datamux_sel),
	.a(cpu_wdata),
	.b(data_out),
	.f(mem_wdata)
);

mux2 #(.width(16)) addrmux
(
	.sel(datamux_sel),
	.a(cpu_addr),
	.b(wb_addr),
	.f(mem_addr)
);

 
endmodule : ewb_datapath