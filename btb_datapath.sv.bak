import lc3b_types::*;

module btb_datapath
(
	input clk,
	input branch_instruction,
	input lc3b_word pc_addr,
	input lc3b_word wb_addr,
	input wb_enable,
	input way0_write,
	input way1_write,
	input way2_write,
	input way3_write,
	input lru_load,
	output logic pc_hit,
	output logic wb_hit,
	output logic wb_comp0_out,
	output logic wb_comp1_out,
	output logic wb_comp2_out,
	output logic wb_comp3_out,
	output logic [2:0] lru_out,
	output lc3b_word btb_out
);

logic [2:0] pc_index_offset;
logic [2:0] wb_index_offset;
logic [1:0] pc_way_hit;
logic [1:0] wb_way_hit;
logic [2:0] lru_in;
logic pc_comp0_out;
logic pc_comp1_out;
logic pc_comp2_out;
logic pc_comp3_out;

logic [14:0] tag0_out;
logic [14:0] tag1_out;
logic [14:0] tag2_out;
logic [14:0] tag3_out;

logic valid_btb_array_out_0;
logic valid_btb_array_out_1;
logic valid_btb_array_out_2;
logic valid_btb_array_out_3;

lc3b_word dataout_mux_out;
lc3b_word data0_out;
lc3b_word data1_out;
lc3b_word data2_out;
lc3b_word data3_out;

assign pc_index_offset = pc_addr[6:4];
assign wb_index_offset = wb_addr[6:4];
assign btb_out = dataout_mux_out;

assign pc_hit = (pc_comp0_out & valid_btb_array_out_0) | (pc_comp1_out & valid_btb_array_out_1) 
| (pc_comp2_out & valid_btb_array_out_2) | (pc_comp3_out & valid_btb_array_out_3);

assign wb_hit = (wb_comp0_out & valid_btb_array_out_0) | (wb_comp1_out & valid_btb_array_out_1) 
| (wb_comp2_out & valid_btb_array_out_2) | (wb_comp3_out & valid_btb_array_out_3);

btb_sel btb_sel_pc
(
    .pc_comp0_out,
	 .pc_comp1_out,
	 .pc_comp2_out,
	 .pc_comp3_out,
    .dataout_mux_sel(pc_way_hit)
);

btb_sel btb_sel_wb
(
    .pc_comp0_out(wb_comp0_out),
	 .pc_comp1_out(wb_comp1_out),
	 .pc_comp2_out(wb_comp2_out),
	 .pc_comp3_out(wb_comp3_out),
    .dataout_mux_sel(wb_way_hit)
);

mux4 #(.width(16)) dataout_mux(
	.sel(pc_way_hit),
	.a(data0_out),
	.b(data1_out),
	.c(data2_out),
	.d(data3_out),
	.f(dataout_mux_out)
);


btb_array #(.width(16)) data0
(
    .clk(clk),
    .write(way0_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr),
    .dataout(data0_out)
);

btb_array #(.width(16)) data1
(
    .clk(clk),
    .write(way1_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr),
    .dataout(data1_out)
);

btb_array #(.width(16)) data2
(
    .clk(clk),
    .write(way2_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr),
    .dataout(data2_out)
);

btb_array #(.width(16)) data3
(
    .clk(clk),
    .write(way3_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr),
    .dataout(data3_out)
);

btb_array #(.width(15)) tag0
(
    .clk(clk),
    .write(way0_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr[15:1]),
    .dataout(tag0_out)
);

btb_array #(.width(15)) tag1
(
    .clk(clk),
    .write(way1_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr[15:1]),
    .dataout(tag1_out)
);

btb_array #(.width(15)) tag2
(
    .clk(clk),
    .write(way2_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr[15:1]),
    .dataout(tag2_out)
);

btb_array #(.width(15)) tag3
(
    .clk(clk),
    .write(way3_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
    .datain(wb_addr[15:1]),
    .dataout(tag3_out)
);

btb_array #(.width(1)) valid_btb_array_0
(
    .clk(clk),
    .write(way0_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
	 .datain(1'b1),
	 .dataout(valid_btb_array_out_0)
);

btb_array #(.width(1)) valid_btb_array_1
(
    .clk(clk),
    .write(way1_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
	 .datain(1'b1),
	 .dataout(valid_btb_array_out_1)
);

btb_array #(.width(1)) valid_btb_array_2
(
    .clk(clk),
    .write(way2_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
	 .datain(1'b1),
	 .dataout(valid_btb_array_out_2)
);

btb_array #(.width(1)) valid_btb_array_3
(
    .clk(clk),
    .write(way3_write),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
	 .datain(1'b1),
	 .dataout(valid_btb_array_out_3)
);

//pseudo LRU
btb_array #(.width(3)) lru_btb_array
(
    .clk(clk),
    .write(lru_load),
    .rindex(pc_index_offset),
	 .windex(wb_index_offset),
	 .datain(lru_in),
	 .dataout(lru_out)
);

btb_lru_state lru_state0
(
	.lru_out,
	.wb_way_hit,
	.lru_in
);

comparator #(.width(15)) pc_comp0
(
	.a(pc_addr[15:1]),
	.b(tag0_out),
	.f(pc_comp0_out)
);

comparator #(.width(15)) pc_comp1
(
	.a(pc_addr[15:1]),
	.b(tag1_out),
	.f(pc_comp1_out)
);

comparator #(.width(15)) pc_comp2
(
	.a(pc_addr[15:1]),
	.b(tag2_out),
	.f(pc_comp2_out)
);

comparator #(.width(15)) pc_comp3
(
	.a(pc_addr[15:1]),
	.b(tag3_out),
	.f(pc_comp3_out)
);

comparator #(.width(15)) wb_comp0
(
	.a(wb_addr[15:1]),
	.b(tag0_out),
	.f(wb_comp0_out)
);

comparator #(.width(15)) wb_comp1
(
	.a(wb_addr[15:1]),
	.b(tag1_out),
	.f(wb_comp1_out)
);

comparator #(.width(15)) wb_comp2
(
	.a(wb_addr[15:1]),
	.b(tag2_out),
	.f(wb_comp2_out)
);

comparator #(.width(15)) wb_comp3
(
	.a(wb_addr[15:1]),
	.b(tag3_out),
	.f(wb_comp3_out)
);

endmodule : btb_datapath