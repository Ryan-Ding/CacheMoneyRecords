import lc3b_types::*;

module mp3
(
    input clk,

    /* Memory signals */
    input mem_resp,
    input lc3b_word mem_rdata,
    output mem_read,
    output mem_write,
    output lc3b_mem_wmask mem_byte_enable,
    output lc3b_word mem_address,
    output lc3b_word mem_wdata
);

logic bench_enable;
logic load_pc;
logic load_ir;
logic load_regfile;
logic load_mar;
logic load_mdr;
logic load_cc;
logic [1:0] pcmux_sel;
logic storemux_sel;
logic alumux_sel;
logic [1:0] regfilemux_sel;
logic [1:0] marmux_sel;
logic marmux2_sel;
logic mdrmux_sel;
logic [1:0] immediatemux_sel;
logic leamux_sel;
logic jmpmux_sel;
logic addermux_sel;
logic jsr_check;
logic destmux_sel;
logic is_even;
logic stbmux_sel;
lc3b_aluop aluop;
lc3b_opcode opcode;
lc3b_offset6 offset6;
lc3b_imm5 imm5;
lc3b_imm4 imm4;
lc3b_reg sr1;


/* Instantiate MP 0 top level blocks here */
datapath d0(.*);
control control0(.*);



endmodule : mp3
