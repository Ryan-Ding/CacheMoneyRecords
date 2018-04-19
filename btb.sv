import lc3b_types::*;

module btb
(
   input clk,
	input branch_instruction,
	input lc3b_word pc_addr,
	input lc3b_word wb_addr,
	input lc3b_word old_pc_addr,
	input wb_enable,
	output lc3b_word btb_out,
	output logic pc_hit

    /* declare more ports here */
);

logic way0_write;
logic way1_write;
logic way2_write;
logic way3_write;
logic lru_load;

logic wb_comp0_out;
logic wb_comp1_out;
logic wb_comp2_out;
logic wb_comp3_out;

logic wb_hit;
logic [2:0] lru_out;

btb_datapath btb_datapath0
(
	.clk,
	.branch_instruction,
	.pc_addr,
	.wb_addr,
	.old_pc_addr,
	.wb_enable,
	.way0_write,
	.way1_write,
	.way2_write,
	.way3_write,
	.lru_load,
	.pc_hit,
	.wb_hit,
	.wb_comp0_out,
	.wb_comp1_out,
	.wb_comp2_out,
	.wb_comp3_out,
	.lru_out,
	.btb_out
);

btb_control btb_control0
(
	.wb_enable,
	.pc_hit,
	.wb_hit,
	.wb_comp0_out,
	.wb_comp1_out,
	.wb_comp2_out,
	.wb_comp3_out,
	.lru_out,
	.way0_write,
	.way1_write,
	.way2_write,
	.way3_write,
	.lru_load
);

endmodule : btb