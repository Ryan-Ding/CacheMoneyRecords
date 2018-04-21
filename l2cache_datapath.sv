import lc3b_types::*;

module l2cache_datapath
(
    input clk,

    /* control signals */
    input lc3b_word adr_i_cpu,
	 input way0_write,
	 input v0_write,
	 input v0_in,
	 input dirty0_write,
	 input dirty0_in,
	 input way1_write,
	 input v1_write,
	 input v1_in,
	 input dirty1_write,
	 input dirty1_in,
	 input lru_write,
	 input lru_in,
	 
	 input way2_write,
	 input way3_write, 
	 
	 output logic lru_out,
	 input datainmux_sel,
	 input memaddrmux_sel,
	 output logic dirty,
	 output logic hit,
	 output logic hit0,
	 
	 //cpu signals
	 output lc3b_8words dat_o_cpu,
	 input [15:0] cpu_sel,
	 input lc3b_8words dat_i_cpu,
	 
	 //mem signals
	 output lc3b_8words dat_o_mem,
	 output lc3b_word adr_o_mem,
	 input lc3b_8words dat_i_mem
	 
	 
	 
);

/* declare internal signals */
lc3b_8words datainmux_out;
lc3b_8words data0_out;
lc3b_cl2_tag tag0_out;
logic valid0_out;
logic dirty0_out;
logic comp0_out;

lc3b_8words data1_out;
lc3b_cl2_tag tag1_out;
lc3b_cl2_tag tagmux_out;
logic valid1_out;
logic dirty1_out;
logic comp1_out;
logic hit1;
lc3b_word write_back_addr;
lc3b_8words cpudatainmux_out;
//logic lru_out;

assign hit0 = (adr_i_cpu[15:8] == tag0_out) & valid0_out;
assign hit1 = (adr_i_cpu[15:8] == tag1_out) & valid1_out;
assign hit2 = (adr_i_cpu[15:8] == tag1_out) & valid2_out;
assign hit3 = (adr_i_cpu[15:8] == tag3_out) & valid3_out;

assign hit = hit0 | hit1 | hit2 | hit3;

assign write_back_addr = {tagmux_out,adr_i_cpu[7:4],4'b0000};

always_comb
begin 
   dataout_mux_sel = 2'b00;
	 if(hit0)
		dataout_mux_sel = 2'b00;
	 else if(hit1)
		dataout_mux_sel = 2'b01;
	 else if(hit2)
		dataout_mux_sel = 2'b10;
	 else if(hit3)
		dataout_mux_sel = 2'b11;
end

//way0

//data
l2array #(.width(128)) data0
(
    .clk(clk),
    .write(way0_write),
    .index(adr_i_cpu[7:4]),
    .datain(datainmux_out),
    .dataout(data0_out)
);
//tag
l2array #(.width(8)) tag0
(
    .clk(clk),
    .write(way0_write),
    .index(adr_i_cpu[7:4]),
    .datain(adr_i_cpu[15:8]),
    .dataout(tag0_out)
);

l2array #(.width(1)) valid0
(
    .clk(clk),
    .write(v0_write),
    .index(adr_i_cpu[7:4]),
    .datain(v0_in),
    .dataout(valid0_out)
);

l2array #(.width(1)) dirty0
(
    .clk(clk),
    .write(dirty0_write),
    .index(adr_i_cpu[7:4]),
    .datain(dirty0_in),
    .dataout(dirty0_out)
);
//compare
//comp #(.width(9)) comp0
//(
//   /* input */
//	 .in1(adr_i_cpu[15:7]),
//	 .in2(tag0_out),
//    .out(comp0_out)
//);

//way1
//data
l2array #(.width(128)) data1
(
    .clk(clk),
    .write(way1_write),
    .index(adr_i_cpu[7:4]),
    .datain(datainmux_out),
    .dataout(data1_out)
);
//tag
l2array #(.width(8)) tag1
(
    .clk(clk),
    .write(way1_write),
    .index(adr_i_cpu[7:4]),
    .datain(adr_i_cpu[15:8]),
    .dataout(tag1_out)
);

l2array #(.width(1)) valid1
(
    .clk(clk),
    .write(v1_write),
    .index(adr_i_cpu[7:4]),
    .datain(v1_in),
    .dataout(valid1_out)
);

l2array #(.width(1)) dirty1
(
    .clk(clk),
    .write(dirty1_write),
    .index(adr_i_cpu[7:4]),
    .datain(dirty1_in),
    .dataout(dirty1_out)
);

// way2

//data
l2array #(.width(128)) data2
(
    .clk(clk),
    .write(way2_write),
    .index(adr_i_cpu[7:4]),
    .datain(datainmux_out),
    .dataout(data2_out)
);
//tag
l2array #(.width(8)) tag2
(
    .clk(clk),
    .write(way2_write),
    .index(adr_i_cpu[7:4]),
    .datain(adr_i_cpu[15:8]),
    .dataout(tag2_out)
);

l2array #(.width(1)) valid2
(
    .clk(clk),
    .write(v2_write),
    .index(adr_i_cpu[7:4]),
    .datain(v2_in),
    .dataout(valid2_out)
);

l2array #(.width(1)) dirty2
(
    .clk(clk),
    .write(dirty2_write),
    .index(adr_i_cpu[7:4]),
    .datain(dirty2_in),
    .dataout(dirty2_out)
);

// way3

//data
l2array #(.width(128)) data3
(
    .clk(clk),
    .write(way3_write),
    .index(adr_i_cpu[7:4]),
    .datain(datainmux_out),
    .dataout(data3_out)
);
//tag
l2array #(.width(8)) tag3
(
    .clk(clk),
    .write(way3_write),
    .index(adr_i_cpu[7:4]),
    .datain(adr_i_cpu[15:8]),
    .dataout(tag3_out)
);

l2array #(.width(1)) valid3
(
    .clk(clk),
    .write(v3_write),
    .index(adr_i_cpu[7:4]),
    .datain(v3_in),
    .dataout(valid3_out)
);

l2array #(.width(1)) dirty3
(
    .clk(clk),
    .write(dirty3_write),
    .index(adr_i_cpu[7:4]),
    .datain(dirty3_in),
    .dataout(dirty3_out)
);


l2array #(.width(1)) lru
(
    .clk(clk),
    .write(lru_write),
    .index(adr_i_cpu[7:4]),
    .datain(lru_in),
    .dataout(lru_out)
);



mux4 #(.width (128)) cpudatamux
(
	.sel(hit0),
	.a(data0_out), 
	.b(data1_out),
	.c(data2_out),
	.d(data3_out),
	.f(dat_o_cpu)
);

mux4 #(.width (128)) memdatamux
(
	.sel(lru_out),
	.a(data0_out), 
	.b(data1_out),
	.c(data2_out),
	.d(data4_out),
	.f(dat_o_mem)
);

mux4 #(.width (8)) tagmux
(
	.sel(lru_out),
	.a(tag0_out), 
	.b(tag1_out),
	.c(tag2_out),
	.d(tag3_out),
	.f(tagmux_out)
);

mux2 #(.width (16)) memaddrmux
(
	.sel(memaddrmux_sel),
	.a(adr_i_cpu), 
	.b(write_back_addr),
	.f(adr_o_mem)
);

mux4 #(.width (1)) dirtymux
(
	.sel(lru_out),
	.a(dirty0_out), 
	.b(dirty1_out),
	.c(dirty2_out),
	.d(dirty3_out),
	.f(dirty)
);


mux2 #(.width (128)) datainmux
(
	.sel(datainmux_sel),
	.a(dat_i_mem), 
	.b(cpudatainmux_out),
	.f(datainmux_out)
);

cpudatainmux cpudatainmux1
(
	.cpu_sel,
	.dat_o_cpu,
	.dat_i_cpu,
	.cpudatainmux_out
);

// Pseudo LRU algorithm
psuedo_lru pseudo_lru 
(
	.lru_in(lru_out),
	.way_hit(way_hit),
	.lru_out(lru_write)
);
 
endmodule : l2cache_datapath
