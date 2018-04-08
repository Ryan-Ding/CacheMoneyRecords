import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module counter_control
(
    /* Input and output port declarations */
	 input clk,
	 input lc3b_word mem_address,
	 input load_pc,
	 input [1:0] br_ctrl_out,
	 output logic counter_read_mux_sel,
	 output lc3b_word counter_mux_out
);

logic [1:0] counter_mux_sel;

always_comb
begin
	counter_read_mux_sel = 0;
	counter_mux_sel = 2'b00;
	if( mem_address > 16'hFFF0)
		counter_read_mux_sel = 1;
	case(mem_address)
		16'hFFFF: counter_mux_sel = 2'b11;
		16'hFFFE: counter_mux_sel = 2'b10;
		16'hFFFD: counter_mux_sel = 2'b00;
	endcase
end

lc3b_word total_instruction_count;
lc3b_word misprediction_count;
lc3b_word total_branch_count;
lc3b_word stall_count;
incremental_counter total_instruction_counter
(
	.clk,
	.increment(load_pc),
	.count(total_instruction_count)
);
//incremental_counter misprediction_counter
//{
//	.clk,
//	.increment(),
//	.count()
//};
incremental_counter total_branch_counter
(
	.clk,
	.increment(load_pc && (br_ctrl_out != 2'b00)),
	.count(total_branch_count)
);
incremental_counter stall_counter
(
	.clk,
	.increment(!load_pc),
	.count(stall_count)
);

mux4 #(.width(16)) counter_mux
(
	.sel(counter_mux_sel),
	.a(total_instruction_count),
	.b(),
	.c(total_branch_count),
	.d(stall_count),
	.f(counter_mux_out)
);

endmodule: counter_control
