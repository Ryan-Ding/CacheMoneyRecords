import lc3b_types::*;

module datapath
(
	wishbone.master ifetch,
	wishbone.master memory

    /* declare more ports here */
);


logic clk;
assign clk= ifetch.CLK;
logic [1:0] mem_byte_enable;
logic mem_resp;
assign mem_resp = memory.ACK;
logic proceed;
lc3b_word temp_address;

/* declare internal signals */

// fetch signals
lc3b_word pcmux_out;
lc3b_word pc_plus2_out;
lc3b_word instruction_data;
logic load_pc;
logic load_pcmar;
lc3b_word pcreg_out;
lc3b_word icache_memrdata;
lc3b_word instruction_mdr_out;
logic load_instruction_mdr;
lc3b_word pc_plus_reg_out;

//if_id signals
logic [31:0] if_id_reg_out;
lc3b_word pc_reg_if_id_out ;
lc3b_word ir_if_id_out ;
logic load_if_id_reg ;



// decode signals
lc3b_word sr1_out;
lc3b_word sr2_out;
lc3b_reg destmux_out;
lc3b_reg storemux_out;
lc3b_control_word control_out;
logic ir_id_mux_sel;
logic ctrl_id_mux_sel;
lc3b_word ir_id_mux_out;
lc3b_control_word ctrl_id_mux_out;

//id_ex signals
logic[92:0] id_ex_reg_out;
lc3b_control_word crtl_reg_id_ex_out;
lc3b_word pc_reg_id_ex_out;
lc3b_word sr1_id_ex_out ;
lc3b_word sr2_id_ex_out ;
lc3b_word ir_id_ex_out;
logic load_id_ex_reg;

//execute signals
lc3b_word aluoutmux_out;
lc3b_word alu_out;
lc3b_word wbmux_out;
lc3b_word adj6_out;
lc3b_word adj9_out;
lc3b_word adj11_out;
lc3b_word sext5_out;
lc3b_word zext4_out;
lc3b_word sext6_out;
lc3b_word zextshf_8_out;
lc3b_word alumux8_out;
lc3b_word alumux2_out;
lc3b_word sr2mux_out;
lc3b_sel2 forwardmuxsr1_sel;
lc3b_sel2 forwardmuxsr2_sel;
lc3b_word forwardmuxsr1_out;
lc3b_word forwardmuxsr2_out;
lc3b_reg id_ex_sr2;

//ex_mem signals
logic[92:0] ex_mem_reg_out;
lc3b_control_word crtl_reg_ex_mem_out;
lc3b_word pc_reg_ex_mem_out;
lc3b_word sr2_ex_mem_out ;
lc3b_word aluout_ex_mem_out ;
lc3b_word ir_ex_mem_out ;
logic load_ex_mem_reg ;

//MEMORY stage signals
lc3b_word mem_rdata;
lc3b_word ldbmux_out;
lc3b_word srmask_out;
lc3b_word mdrmask_out;
lc3b_word ldi_addr_register_out;
logic ldi_addr_register_load;
logic memaddrmux_sel;
logic sti_WE;
lc3b_word memaddrmux_out;

//mem_wb signals
logic[92:0] mem_wb_reg_out;
lc3b_control_word crtl_reg_mem_wb_out;
lc3b_word pc_reg_mem_wb_out ;
lc3b_word mem_data_mem_wb_out ;
lc3b_word aluout_mem_wb_out ;
lc3b_word ir_mem_wb_out ;
logic load_mem_wb_reg ;


//write back signals
lc3b_nzp gencc_out;
lc3b_nzp cc_out;
logic branch_enable;
logic[1:0] br_ctrl_out;
logic is_even;

//forward signals
logic forward_fetch_stall;



/* input signals */
lc3b_line instruction_mem_in;
lc3b_line data_mem_in;

/* output signals */
lc3b_word pc_out;
lc3b_line wdata;

lc3b_word mem_address;

logic pipeline_reg_load;
assign pipeline_reg_load = proceed & (!br_ctrl_out | ifetch.ACK);


lc3b_word pcoutmux_out;
assign ifetch.ADR = pc_out[15:4];
assign instruction_mem_in = ifetch.DAT_S;
assign ifetch.WE = 0;
assign ifetch.STB = 1;
assign ifetch.CYC = 1;

assign data_mem_in = memory.DAT_S;
assign memory.DAT_M = wdata;
assign memory.ADR = mem_address[15:4];
assign temp_address = 2 * (mem_address[3:1]);
assign memory.SEL = (16'b0000000000000011 & mem_byte_enable) << temp_address;
assign memory.WE = crtl_reg_ex_mem_out.mem_write & sti_WE;
assign memory.STB = crtl_reg_ex_mem_out.mem_write | crtl_reg_ex_mem_out.mem_read;
assign memory.CYC = crtl_reg_ex_mem_out.mem_write | crtl_reg_ex_mem_out.mem_read;

assign is_even = !mem_address[0];

// ifetch
// get instruction from 128 bits memory output
assign icache_memrdata = instruction_mem_in >> (16 * pc_out[3:1]);
//assign instruction_data = {16{ifetch.ACK}} & instruction_mdr_out;
assign mem_rdata = data_mem_in >> (16 * mem_address[3:1]);
assign load_pcmar = (proceed  & ifetch.ACK) | br_ctrl_out;
//assign load_pc = (proceed | br_ctrl_out)  & ifetch.ACK;
assign load_pc = proceed & ifetch.ACK & (!forward_fetch_stall);
assign load_instruction_mdr = ifetch.ACK;


//if_id pipeline register out
assign pc_reg_if_id_out = if_id_reg_out[15:0];
assign ir_if_id_out = if_id_reg_out[31:16];
assign load_if_id_reg = ( pipeline_reg_load & (!forward_fetch_stall) );

//id_ex pipeline register out
assign pc_reg_id_ex_out = id_ex_reg_out[15:0];
assign sr1_id_ex_out = id_ex_reg_out[31:16];
assign sr2_id_ex_out = id_ex_reg_out[47:32];
assign ir_id_ex_out = id_ex_reg_out[63:48];
assign crtl_reg_id_ex_out = id_ex_reg_out[92:64];
assign load_id_ex_reg = pipeline_reg_load;

// ex_mem pipeline register out
assign pc_reg_ex_mem_out = ex_mem_reg_out[15:0];
assign sr2_ex_mem_out = ex_mem_reg_out[31:16];
assign aluout_ex_mem_out = ex_mem_reg_out[47:32];
assign ir_ex_mem_out = ex_mem_reg_out[63:48];
assign crtl_reg_ex_mem_out = ex_mem_reg_out[92:64];
assign load_ex_mem_reg = pipeline_reg_load;

//memory stage assign
// expanded from 16 to 128 bits
assign wdata = sr2_ex_mem_out << (16 * mem_address[3:1]);

// mem_wb pipleline register out
assign pc_reg_mem_wb_out = mem_wb_reg_out[15:0];
assign mem_data_mem_wb_out = mem_wb_reg_out[31:16];
assign aluout_mem_wb_out = mem_wb_reg_out[47:32];
assign ir_mem_wb_out = mem_wb_reg_out[63:48];
assign crtl_reg_mem_wb_out = mem_wb_reg_out[92:64];
assign load_mem_wb_reg = pipeline_reg_load;

mux4 pcmux(
	.sel(br_ctrl_out),
	.a(pc_plus2_out),
	.b(aluout_mem_wb_out),
	.c(mem_data_mem_wb_out),
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

//register pcmar
//(
//    .clk,
//    .load(load_pcmar),
//    .in(pcmux_out),
//    .out(pcreg_out)
//);
//
//logic pcoutmux_sel;
//assign pcoutmux_sel = (pcreg_out != pc_out) & ifetch.ACK;
//
//mux2 pcoutmux
//(
//	.sel(pcoutmux_sel),
//	.a(pc_out),
//	.b(pcreg_out),
//	.f(pcoutmux_out)
//); 


plus2 pc_plus2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

mux2 instructionmux
(
	.sel(ifetch.ACK),
	.a(16'b0),
	.b(icache_memrdata),
	.f(instruction_data)
); 

//register pc_plus_reg
//(
//    .clk,
//    .load(load_instruction_mdr),
//    .in(pc_plus2_out),
//    .out(pc_plus_reg_out)
//);

//register instruction_mdr
//(
//    .clk,
//    .load(load_instruction_mdr),
//    .in(icache_memrdata),
//    .out(instruction_mdr_out)
//);

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
.opcode(lc3b_opcode'(ir_if_id_out[15:12])),
.bit4(ir_if_id_out[4]),
.bit5(ir_if_id_out[5]),
.bit11(ir_if_id_out[11]),
.ctrl(control_out)
);

//store mux
mux2 #(.width(3)) storemux
(
	.sel(control_out.storemux_sel),
	.a(ir_if_id_out[2:0]),
	.b(ir_if_id_out[11:9]),
	.f(storemux_out)
);

//dest mux
mux2 #(.width(3)) destmux
(
	.sel(crtl_reg_mem_wb_out.destmux_sel),
	.a(ir_mem_wb_out[11:9]),
	.b(3'b111),
	.f(destmux_out)
);

//reg file
regfile regfile
(
    .clk,
    .load(crtl_reg_mem_wb_out.load_regfile),
    .in(wbmux_out),
    .src_a(ir_if_id_out[8:6]), 
	 .src_b(storemux_out),
	 .dest(destmux_out),
    .reg_a(sr1_out), 
	 .reg_b(sr2_out)
);

mux2 #(.width(16)) ir_id_mux
(
	.sel(ir_id_mux_sel),
	.a(ir_if_id_out),
	.b(16'b0),
	.f(ir_id_mux_out)
); 

mux2 #(.width(29)) ctrl_id_mux
(
	.sel(ctrl_id_mux_sel),
	.a(control_out),
	.b(29'b0),
	.f(ctrl_id_mux_out)
); 

//id_ex pipeline register
register #(.width(93)) id_ex_reg
(
	.clk,
	.load(load_id_ex_reg),
	.in({ctrl_id_mux_out ,ir_id_mux_out ,sr2_out, sr1_out, pc_reg_if_id_out}),
	.out(id_ex_reg_out)
);

//execute stage

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

mux4 #(.width(16)) forwardmuxsr2
(
	.sel(forwardmuxsr2_sel),
   .a(sr2_id_ex_out),
	.b(aluout_ex_mem_out),
	.c(wbmux_out),
	.d(),
	.f(forwardmuxsr2_out)
);

mux8 #(.width(16)) alumux8 
(
	.sel(crtl_reg_id_ex_out.alumux8_sel),
   .a(forwardmuxsr2_out),
	.b(sext5_out),
	.c(zext4_out),
	.d(adj9_out),
	.e(adj11_out),
	.f(sext6_out),
	.g(adj6_out),
	.h(),
	.out(alumux8_out)
);

mux4 #(.width(16)) forwardmuxsr1
(
	.sel(forwardmuxsr1_sel),
   .a(sr1_id_ex_out),
	.b(aluout_ex_mem_out),
	.c(wbmux_out),
	.d(),
	.f(forwardmuxsr1_out)
);

mux2 #(.width(16)) alumux2
(
	.sel(crtl_reg_id_ex_out.alumux2_sel),
   .a(forwardmuxsr1_out),
	.b(pc_reg_id_ex_out),
	.f(alumux2_out)
);

alu alu
(
	 .aluop(crtl_reg_id_ex_out.aluop),
    .a(alumux2_out),
	 .b(alumux8_out),
    .f(alu_out)
); 

srmask srmask
(
	.in(forwardmuxsr2_out),
	.is_even(is_even),
	.out(srmask_out)
);

mux2 sr2mux
(
	.sel(crtl_reg_id_ex_out.sr2mux_sel),
	.a(forwardmuxsr2_out),
	.b(srmask_out),
	.f(sr2mux_out)
);

mux4 #(.width(16)) aluoutmux
(
	.sel(crtl_reg_id_ex_out.aluoutmux_sel),
   .a(alu_out),
	.b(forwardmuxsr1_out),
	.c(zextshf_8_out),
	.d(),
	.f(aluoutmux_out)
);

zext_shift #(.width(8)) zextshf_8
(
	.in(ir_id_ex_out[7:0]),
   .out(zextshf_8_out)
);

// execute memory pipeline register
register #(.width(93)) ex_mem_reg
(
	.clk,
	.load(load_ex_mem_reg),
	.in({ crtl_reg_id_ex_out,ir_id_ex_out ,aluoutmux_out, sr2mux_out, pc_reg_id_ex_out}),
	.out(ex_mem_reg_out)
);

//memory
mdrmask mdrmask
(
	.in(mem_rdata),
	.is_even(is_even),
	.out(mdrmask_out)
);

mux2 #(.width(16)) memaddrmux
(
	.sel(memaddrmux_sel),
	.a(aluout_ex_mem_out),
	.b(ldi_addr_register_out),
	.f(mem_address)
);

//mux2 #(.width(16)) memaddrmux
//(
//	.sel(memaddrmux_sel),
//	.a(aluout_ex_mem_out),
//	.b(mem_rdata),
//	.f(memaddrmux_out)
//);

ldi_sti_control ldi_sti_control0
(
	 .clk,
	 .mem_resp,
	 .opcode(crtl_reg_ex_mem_out.opcode),
	 .proceed,
	 .ldi_addr_register_load,
	 .memaddrmux_sel,
	 .sti_WE
);

register #(.width(16)) ldi_addr_register
(
	.clk,
	.load(ldi_addr_register_load),
	.in(mem_rdata),
	.out(ldi_addr_register_out)
);

//register #(.width(16)) mem_mar
//(
//	.clk,
//	.load(crtl_reg_ex_mem_out.mem_mar_sel),
//	.in(memaddrmux_out),
//	.out(mem_address)
//);

mux2 #(.width(16)) ldbmux
(
	.sel(crtl_reg_ex_mem_out.ldbmux_sel),
	.a(mem_rdata),
	.b(mdrmask_out),
	.f(ldbmux_out)
);


// memory write back pipeline register
register #(.width(93)) mem_wb_reg
(
	.clk,
	.load(load_mem_wb_reg),
	.in({crtl_reg_ex_mem_out,ir_ex_mem_out,aluout_ex_mem_out, ldbmux_out, pc_reg_ex_mem_out}),
	.out(mem_wb_reg_out)
);

//write back stage
mux4 #(.width(16)) wbmux
(
	.sel(crtl_reg_mem_wb_out.wbmux_sel),
	.a(pc_reg_mem_wb_out),
	.b(mem_data_mem_wb_out),
	.c(aluout_mem_wb_out),
	.d(),
	.f(wbmux_out)
);

register #(.width(3)) cc
(
	.clk,
	.load(crtl_reg_mem_wb_out.load_cc),
	.in(gencc_out),
	.out(cc_out)
);

cccomp cccomp
(
    .ir_in(ir_mem_wb_out[11:9]),
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

mem_enable_ctrl mem_enable_ctrl
(
	 .opcode(crtl_reg_ex_mem_out.opcode),
	 .is_even(is_even),
    .out(mem_byte_enable)
);

mux2 #(.width(3)) storemuxex
(
	.sel(crtl_reg_id_ex_out.storemux_sel),
	.a(ir_id_ex_out[2:0]),
	.b(ir_id_ex_out[11:9]),
	.f(id_ex_sr2)
);
 
forwarding_unit forwarding_unit
(
	.if_id_sr1(ir_if_id_out[8:6]),
	.if_id_sr2(ir_if_id_out[2:0]),
	.id_ex_sr1(ir_id_ex_out[8:6]),
	.id_ex_sr2,
	.id_ex_dest(ir_id_ex_out[11:9]),
	.ex_mem_dest(ir_ex_mem_out[11:9]),
	.mem_wb_dest(ir_mem_wb_out[11:9]),
	.ex_mem_load_regfile(crtl_reg_ex_mem_out.load_regfile),
	.mem_wb_load_regfile(crtl_reg_mem_wb_out.load_regfile),
	.id_ex_sr1use(crtl_reg_id_ex_out.sr1use),
	.id_ex_sr2use(crtl_reg_id_ex_out.sr2use),
	.if_id_sr1use(control_out.sr1use),
	.if_id_sr2use(control_out.sr2use),
	.id_ex_opcode(crtl_reg_id_ex_out.opcode),
	.ir_id_mux_sel,
	.ctrl_id_mux_sel,
	.forwardmuxsr1_sel,
	.forwardmuxsr2_sel,
	.forward_fetch_stall(forward_fetch_stall)

);


endmodule : datapath