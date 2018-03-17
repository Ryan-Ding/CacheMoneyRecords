import lc3b_types::*;

module cache_datapath
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
	 input lc3b_8words dat_i_mem,
	 input load_mar,
	 input load_mdr
	 
	 
	 
);

/* declare internal signals */
lc3b_8words datainmux_out;
lc3b_8words data0_out;
lc3b_c_tag tag0_out;
logic valid0_out;
logic dirty0_out;
logic comp0_out;

lc3b_8words data1_out;
lc3b_c_tag tag1_out;
lc3b_c_tag tagmux_out;
logic valid1_out;
logic dirty1_out;
logic comp1_out;
logic hit1;
lc3b_word write_back_addr;
lc3b_8words cpudatainmux_out;
lc3b_word memaddrmux_out;
lc3b_8words memdatamux_out;
//logic lru_out;



assign hit0 = (adr_i_cpu[15:7] == tag0_out) & valid0_out;
assign hit1 = (adr_i_cpu[15:7] == tag1_out) & valid1_out;
assign hit = hit0 | hit1;
assign write_back_addr = {tagmux_out,adr_i_cpu[6:4],4'b0000};


//way0
//data
array #(.width(128)) data0
(
    .clk(clk),
    .write(way0_write),
    .index(adr_i_cpu[6:4]),
    .datain(datainmux_out),
    .dataout(data0_out)
);
//tag
array #(.width(9)) tag0
(
    .clk(clk),
    .write(way0_write),
    .index(adr_i_cpu[6:4]),
    .datain(adr_i_cpu[15:7]),
    .dataout(tag0_out)
);

array #(.width(1)) valid0
(
    .clk(clk),
    .write(v0_write),
    .index(adr_i_cpu[6:4]),
    .datain(v0_in),
    .dataout(valid0_out)
);

array #(.width(1)) dirty0
(
    .clk(clk),
    .write(dirty0_write),
    .index(adr_i_cpu[6:4]),
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
array #(.width(128)) data1
(
    .clk(clk),
    .write(way1_write),
    .index(adr_i_cpu[6:4]),
    .datain(datainmux_out),
    .dataout(data1_out)
);
//tag
array #(.width(9)) tag1
(
    .clk(clk),
    .write(way1_write),
    .index(adr_i_cpu[6:4]),
    .datain(adr_i_cpu[15:7]),
    .dataout(tag1_out)
);

array #(.width(1)) valid1
(

    .clk(clk),
    .write(v1_write),
    .index(adr_i_cpu[6:4]),
    .datain(v1_in),
    .dataout(valid1_out)
);

array #(.width(1)) dirty1
(
    .clk(clk),
    .write(dirty1_write),
    .index(adr_i_cpu[6:4]),
    .datain(dirty1_in),
    .dataout(dirty1_out)
);
//
array #(.width(1)) lru
(
    .clk(clk),
    .write(lru_write),
    .index(adr_i_cpu[6:4]),
    .datain(lru_in),
    .dataout(lru_out)
);



mux2 #(.width (128)) cpudatamux
(
	.sel(hit0),
	.a(data1_out), 
	.b(data0_out),
	.f(dat_o_cpu)
);

mux2 #(.width (128)) memdatamux
(
	.sel(lru_out),
	.a(data0_out), 
	.b(data1_out),
	.f(memdatamux_out)
);

mux2 #(.width (9)) tagmux
(
	.sel(lru_out),
	.a(tag0_out), 
	.b(tag1_out),
	.f(tagmux_out)
);

mux2 #(.width (16)) memaddrmux
(
	.sel(memaddrmux_sel),
	.a(adr_i_cpu), 
	.b(write_back_addr),
	.f(memaddrmux_out)
);

mux2 #(.width (1)) dirtymux
(
	.sel(lru_out),
	.a(dirty0_out), 
	.b(dirty1_out),
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

register #(.width(16)) mar
(
    .clk(clk),
    .load(load_mar),
    .in(memaddrmux_out),
    .out(adr_o_mem)
);

register #(.width(128)) mdr
(
    .clk(clk),
    .load(load_mdr),
    .in(memdatamux_out),
    .out(dat_o_mem)
);
 
endmodule : cache_datapath
