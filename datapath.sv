import lc3b_types::*;

module datapath
(
    input clk,

    /* control signals */
    input lc3b_line instruction_mem_in,
	 input lc3b_line data_mem_in,

	 output lc3b_word pc_out,
	 output lc3b_line wdata,
	 output lc3b_word mem_address

	

    /* declare more ports here */
);

// get instruction from 128 bits memory output
assign instruction_data = instruction_mem_in >> (16 * pc_out[3:1]);
assign mem_rdata = data_mem_in >> (16 * mem_address[3:1]);

// expanded from 16 to 128 bits
assign wdata = sr1_ex_mem_out << (16 * aluout_ex_mem_out[3:1]);
assign mem_address = aluout_ex_mem_out;

//if_id pipeline register out
assign pc_reg_if_id_out = if_id_reg_out[15:0];
assign ir_if_id_out = if_id_reg_out[31:16];

//id_ex pipeline register out
assign pc_reg_id_ex_out = id_ex_reg_out[15:0];
assign sr1_id_ex_out = id_ex_reg_out[31:16];
assign sr2_id_ex_out = id_ex_reg_out[47:32];
assign ir_id_ex_out = id_ex_reg_out[63:48];
assign crtl_reg_id_ex_out = id_ex_reg_out[95:64];

// ex_mem pipeline register out
assign pc_reg_ex_mem_out = ex_mem_reg_out[15:0];
assign sr1_ex_mem_out = ex_mem_reg_out[31:16];
assign aluout_ex_mem_out = ex_mem_reg_out[47:32];
assign ir_ex_mem_out = ex_mem_reg_out[63:48];
assign crtl_reg_ex_mem_out = ex_mem_reg_out[95:64];

// mem_wb pipleline register out
assign pc_reg_mem_wb_out = mem_wb_reg_out[15:0];
assign mem_data_mem_wb_out = mem_wb_reg_out[31:16];
assign aluout_mem_wb_out = mem_wb_reg_out[47:32];
assign crtl_reg_mem_wb_out = mem_wb_reg_out[79:48];

mux4 pcmux(
	.sel(br_ctrl_out),
	.a(pc_plus2_out),
	.b(aluout_ex_mem_out),
	.c(wbmux_out),
	.d(),
	.f(pcmux_out)
);

register pc
(
    .clk,
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 pc_plus2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

//if_id pipeline register
register #(.width(32)) if_id_reg
(
	.clk,
	.load(load_if_id_reg),
	.in({instruction_data, pc_plus2_out}),
	.out(if_id_reg_out)
);

// decode stage

//control rom
control_rom control_rom
(
.opcode(ir_if_id_out[15:12]),
.ctrl(control_out)
);

//store mux
mux2 #(.width(3)) storemux(
	.sel(storemux_sel),
	.a(ir_if_id_out[8:6]),
	.b(ir_if_id_out[11:9]),
	.f(storemux_out)
);

//dest mux
mux2 #(.width(3)) destmux(
	.sel(destmux_sel),
	.a(ir_if_id_out[11:9]),
	.b(3'b111),
	.f(destmux_out)
);

//reg file
regfile regfile
(
    .clk,
    .load(load_regfile),
    .in(wbmux_out),
    .src_a(storemux_out), 
	 .src_b(ir_if_id_out[2:0]),
	 .dest(destmux_out),
    .reg_a(sr1_out), 
	 .reg_b(sr2_out)
);

//id_ex pipeline register
register #(.width(96)) id_ex_reg
(
	.clk,
	.load(load_id_ex_reg),
	.in({control_out ,ir_if_id_out ,sr2_out, sr1_out, pc_reg_if_id_out}),
	.out(id_ex_reg_out)
);

adj #(.width(6)) adj6
(
	 .in(ir_id_ex_out[5:0]),
    .out(adj6_out)
);

adj #(.width(9)) adj9
(
	 .in(ir_id_ex_out[8:0]),
    .out(adj9_out)
);

adj #(.width(11)) adj11
(
	 .in(ir_id_ex_out[10:0]),
    .out(adj11_out)
);

sext #(.width(6)) sext6
(
	 .in(ir_id_ex_out[5:0]),
    .out(sext6_out)
);

sext #(.width(5)) sext5
(
	 .in(ir_id_ex_out[4:0]),
    .out(sext5_out)
);

zext #(.width(4)) zext4 
(
	.in(ir_id_ex_out[3:0]),
	.out(zext4_out)
);

mux8 #(.width(16)) alumux8 
(
	.sel(alumux8_sel),
   .a(sr2_id_ex_out),
	.b(sext5_out),
	.c(zext4_out)
	.d(adj9_out),
	.e(adj11_out),
	.f(sext6_out),
	.g(adj6_out),
	.h(),
	.out(alumux8_out)
);

mux2 #(.width(16)) alumux2
(
	.sel(alumux2_sel),
   .a(pc_reg_id_ex_out),
	.b(sr1_id_ex_out),
	.out(alumux2_out)
);

alu alu
(
	 .aluop(aluop),
    .a(alumux2_out),
	 .b(alumux8_out),
    .f(alu_out)
);

mux2 #(.width(16)) aluoutmux
(
	.sel(aluoutmux_sel),
   .a(alu_out),
	.b(zextshf_8_out),
	.out(aluoutmux_out)
);

zext_shift #(.width(8)) zextshf_8
(
	.in(ir_id_ex_out[7:0]),
   .out(zextshf_8_out)
);

// piaapsfasj
register #(.width(96)) ex_mem_reg
(
	.clk,
	.load(load_ex_mem_reg),
	.in({control_out ,ir_if_id_out ,aluoutmux_out, sr1_id_ex_out, pc_reg_if_id_out}),
	.out(ex_mem_reg_out)
);

// memory write back pipeline register
register #(.width(80)) mem_wb_reg
(
	.clk,
	.load(load_mem_wb_reg),
	.in({crtl_reg_ex_mem_out,aluout_ex_mem_out, mem_rdata, pc_reg_ex_mem_out}),
	.out(mem_wb_reg_out)
);

mux4 #(.width(16)) wbmux
(
	.sel(wbmux_sel),
	.a(pc_reg_mem_wb_out),
	.b(mem_data_mem_wb_out),
	.c(aluout_mem_wb_out),
	.d(),
	.f(wbmux_out)
);

register #(.width(3)) cc
(
	.clk,
	.load(load_cc),
	.in(gencc_out),import lc3b_types::*;

module cccomp
(
    input lc3b_reg ir_in,
	 input lc3b_nzp nzp_in,
    output logic out
);

always_comb
begin
		out = (ir_in[0] & nzp_in[0]) + (ir_in[1] & nzp_in[1]) + (ir_in[2] & nzp_in[2]);
end

endmodule : cccomp

	.out(cc_out)
);

cccomp cccomp
(
    .ir_in(dest),
	 .nzp_in(cc_out),
    .out(branch_enable)
);

gencc gencc
(
    .in(wbmux_out),
    .out(gencc_out)
);
br_ctrl br_ctrl
(
    .branch_enable(branch_enable),
	 .opcode(crtl_reg_mem_wb_out.opcode),
    .out(br_ctrl_out)
);

endmodule : datapath