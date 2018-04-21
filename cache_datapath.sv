import lc3b_types::*;

module cache_datapath
(
    input clk,

    /* control signals */
    input lc3b_word adr_i_cpu_in,
	 
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
	 
	 input way2_write,
	 input v2_write,
	 input v2_in,
	 input dirty2_write,
	 input dirty2_in,
	 
	 input way3_write,
	 input v3_write,
	 input v3_in,
	 input dirty3_write,
	 input dirty3_in,
	 
	 input lru_write,
	 input [2:0] lru_in,
	 output logic [2:0] lru_out,
	 input [1:0] datainmux_sel,
	 input memaddrmux_sel,
	 output logic dirty,
	 output logic hit,
	 
	 
	 output logic hit0,
	 output logic hit1,
	 output logic hit2,
	 output logic hit3,
	 
	 //cpu signals
	 output lc3b_8words dat_o_cpu,
	 input [15:0] cpu_sel,
	 input lc3b_8words dat_i_cpu_in,
	 
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
logic valid1_out;
logic dirty1_out;
logic comp1_out;

lc3b_8words data2_out;
lc3b_c_tag tag2_out;
logic valid2_out;
logic dirty2_out;
logic comp2_out;

lc3b_8words data3_out;
lc3b_c_tag tag3_out;
logic valid3_out;
logic dirty3_out;
logic comp3_out;

lc3b_c_tag tagmux_out;

logic hit0;
logic hit1;
logic hit2;
logic hit3;

lc3b_word write_back_addr;
lc3b_8words cpudatainmux_out;
lc3b_word memaddrmux_out;
lc3b_8words memdatamux_out;
//logic lru_out;
lc3b_word adr_i_cpu;
lc3b_8words dat_i_cpu;


assign hit0 = (adr_i_cpu[15:7] == tag0_out) & valid0_out;
assign hit1 = (adr_i_cpu[15:7] == tag1_out) & valid1_out;
assign hit2 = (adr_i_cpu[15:7] == tag2_out) & valid2_out;
assign hit3 = (adr_i_cpu[15:7] == tag3_out) & valid3_out;

assign hit = hit0 | hit1 | hit2 | hit3;

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

//way2
//data
array #(.width(128)) data2
(
    .clk(clk),
    .write(way2_write),
    .index(adr_i_cpu[6:4]),
    .datain(datainmux_out),
    .dataout(data2_out)
);
//tag
array #(.width(9)) tag2
(
    .clk(clk),
    .write(way2_write),
    .index(adr_i_cpu[6:4]),
    .datain(adr_i_cpu[15:7]),
    .dataout(tag2_out)
);

array #(.width(1)) valid2
(
    .clk(clk),
    .write(v2_write),
    .index(adr_i_cpu[6:4]),
    .datain(v2_in),
    .dataout(valid2_out)
);

array #(.width(1)) dirty2
(
    .clk(clk),
    .write(dirty2_write),
    .index(adr_i_cpu[6:4]),
    .datain(dirty2_in),
    .dataout(dirty2_out)
);

//way3
//data
array #(.width(128)) data3
(
    .clk(clk),
    .write(way3_write),
    .index(adr_i_cpu[6:4]),
    .datain(datainmux_out),
    .dataout(data3_out)
);
//tag
array #(.width(9)) tag3
(
    .clk(clk),
    .write(way3_write),
    .index(adr_i_cpu[6:4]),
    .datain(adr_i_cpu[15:7]),
    .dataout(tag3_out)
);

array #(.width(1)) valid3
(
    .clk(clk),
    .write(v3_write),
    .index(adr_i_cpu[6:4]),
    .datain(v3_in),
    .dataout(valid3_out)
);

array #(.width(1)) dirty3
(
    .clk(clk),
    .write(dirty3_write),
    .index(adr_i_cpu[6:4]),
    .datain(dirty3_in),
    .dataout(dirty3_out)
);

// lru shit

array #(.width(1)) lru
(
    .clk(clk),
    .write(lru_write),
    .index(adr_i_cpu[6:4]),
    .datain(lru_in),
    .dataout(lru_out)
);


mux4 #(.width (128)) cpudatamux
(
	.sel(hit0), // select signal???
	.a(data1_out), 
	.b(data0_out),
	.c(data2_out),
	.d(data3_out),
	.f(dat_o_cpu)
);

mux4 #(.width (128)) memdatamux
(
	.sel(lru_out), // select signal???
	.a(data0_out), 
	.b(data1_out),
	.c(data2_out),
	.d(data3_out),
	.f(dat_o_mem)
);

mux4 #(.width (9)) tagmux
(
	.sel(lru_out), // what the fuck???
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
	.sel(lru_out), // shit 
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

//mux2 #(.width (16)) memaddrmux
//(
//	.sel(memaddrmux_sel),
//	.a(adr_i_cpu), 
//	.b(write_back_addr),
//	.f(memaddrmux_out)
//);
//
//
//mux2 #(.width (128)) memdatamux
//(
//	.sel(lru_out),
//	.a(data0_out), 
//	.b(data1_out),
//	.f(memdatamux_out)
//);
//
//
assign adr_i_cpu = adr_i_cpu_in;
assign dat_i_cpu = dat_i_cpu_in;
//register #(.width(16)) mar
//(
//    .clk(clk),
//    .load(load_mar),
//    .in(adr_i_cpu_in),
//    .out(adr_i_cpu)
//);
//
//register #(.width(128)) mdr
//(
//    .clk(clk),
//    .load(load_mdr),
//    .in(dat_i_cpu_in),
//    .out(dat_i_cpu)
//);
 
endmodule : cache_datapath
