import lc3b_types::*;

module cpudatainmux
(
	input [15:0] cpu_sel,
	input lc3b_8words dat_o_cpu,
	input lc3b_8words dat_i_cpu,
	output lc3b_8words cpudatainmux_out
);


mux2 #(.width (8)) cpudatainmux0
(
	.sel(cpu_sel[0]),
	.a(dat_o_cpu[7:0]), 
	.b(dat_i_cpu[7:0]),
	.f(cpudatainmux_out[7:0])
);

mux2 #(.width (8)) cpudatainmux1
(
	.sel(cpu_sel[1]),
	.a(dat_o_cpu[15:8]), 
	.b(dat_i_cpu[15:8]),
	.f(cpudatainmux_out[15:8])
);

mux2 #(.width (8)) cpudatainmux2
(
	.sel(cpu_sel[2]),
	.a(dat_o_cpu[23:16]), 
	.b(dat_i_cpu[23:16]),
	.f(cpudatainmux_out[23:16])
);

mux2 #(.width (8)) cpudatainmux3
(
	.sel(cpu_sel[3]),
	.a(dat_o_cpu[31:24]), 
	.b(dat_i_cpu[31:24]),
	.f(cpudatainmux_out[31:24])
);

mux2 #(.width (8)) cpudatainmux4
(
	.sel(cpu_sel[4]),
	.a(dat_o_cpu[39:32]), 
	.b(dat_i_cpu[39:32]),
	.f(cpudatainmux_out[39:32])
);

mux2 #(.width (8)) cpudatainmux5
(
	.sel(cpu_sel[5]),
	.a(dat_o_cpu[47:40]), 
	.b(dat_i_cpu[47:40]),
	.f(cpudatainmux_out[47:40])
);

mux2 #(.width (8)) cpudatainmux6
(
	.sel(cpu_sel[6]),
	.a(dat_o_cpu[55:48]), 
	.b(dat_i_cpu[55:48]),
	.f(cpudatainmux_out[55:48])
);

mux2 #(.width (8)) cpudatainmux7
(
	.sel(cpu_sel[7]),
	.a(dat_o_cpu[63:56]), 
	.b(dat_i_cpu[63:56]),
	.f(cpudatainmux_out[63:56])
);

mux2 #(.width (8)) cpudatainmux8
(
	.sel(cpu_sel[8]),
	.a(dat_o_cpu[71:64]), 
	.b(dat_i_cpu[71:64]),
	.f(cpudatainmux_out[71:64])
);

mux2 #(.width (8)) cpudatainmux9
(
	.sel(cpu_sel[9]),
	.a(dat_o_cpu[79:72]), 
	.b(dat_i_cpu[79:72]),
	.f(cpudatainmux_out[79:72])
);

mux2 #(.width (8)) cpudatainmux10
(
	.sel(cpu_sel[10]),
	.a(dat_o_cpu[87:80]), 
	.b(dat_i_cpu[87:80]),
	.f(cpudatainmux_out[87:80])
);

mux2 #(.width (8)) cpudatainmux11
(
	.sel(cpu_sel[11]),
	.a(dat_o_cpu[95:88]), 
	.b(dat_i_cpu[95:88]),
	.f(cpudatainmux_out[95:88])
);

mux2 #(.width (8)) cpudatainmux12
(
	.sel(cpu_sel[12]),
	.a(dat_o_cpu[103:96]), 
	.b(dat_i_cpu[103:96]),
	.f(cpudatainmux_out[103:96])
);

mux2 #(.width (8)) cpudatainmux13
(
	.sel(cpu_sel[13]),
	.a(dat_o_cpu[111:104]), 
	.b(dat_i_cpu[111:104]),
	.f(cpudatainmux_out[111:104])
);

mux2 #(.width (8)) cpudatainmux14
(
	.sel(cpu_sel[14]),
	.a(dat_o_cpu[119:112]), 
	.b(dat_i_cpu[119:112]),
	.f(cpudatainmux_out[119:112])
);

mux2 #(.width (8)) cpudatainmux15
(
	.sel(cpu_sel[15]),
	.a(dat_o_cpu[127:120]), 
	.b(dat_i_cpu[127:120]),
	.f(cpudatainmux_out[127:120])
);

endmodule : cpudatainmux