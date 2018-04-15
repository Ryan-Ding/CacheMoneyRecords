import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module counter_control
(
    /* Input and output port declarations */
	 input clk,
	 input lc3b_word mem_address,
	 input load_pc,
	 input lc3b_word l2_miss_counter,
	 input lc3b_word l2_hit_counter,
	 input lc3b_word icache_miss_counter,
	 input lc3b_word icache_hit_counter,
	 input lc3b_word dcache_miss_counter,
	 input lc3b_word dcache_hit_counter,
	 input [1:0] br_ctrl_out,
	 input flush,
	 input lc3b_word instruction,
	 output logic counter_read_mux_sel,
	 output lc3b_word counter_mux_out
);

logic [3:0] counter_mux_sel;

always_comb
begin
	counter_read_mux_sel = 0;
	counter_mux_sel = 4'b00;
	if( mem_address >= 16'hFFF0)
		counter_read_mux_sel = 1;
		case(mem_address)
			16'hFFFF: counter_mux_sel = 4'b0011;
			16'hFFFE: counter_mux_sel = 4'b0010;
			16'hFFFD: counter_mux_sel = 4'b0000;
			16'hFFFC: counter_mux_sel = 4'b0001;
			16'hFFF0: counter_mux_sel = 4'b0110;
			16'hFFF1: counter_mux_sel = 4'b0111;
			16'hFFF2: counter_mux_sel = 4'b1000;
			16'hFFF3: counter_mux_sel = 4'b1001;
			16'hFFF4: counter_mux_sel = 4'b1010;
			16'hFFF5: counter_mux_sel = 4'b1011;
			
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
	.increment(load_pc & (flush | ((instruction[15:12] == op_br) & (instruction[11]|instruction[10]|instruction[9])))),
	.count(total_branch_count)
);

incremental_counter misprediction_counter
(
	.clk,
	.increment(load_pc && flush),
	.count(misprediction_count)
);

incremental_counter stall_counter
(
	.clk,
	.increment(!load_pc),
	.count(stall_count)
);

mux16 #(.width(16)) counter_mux
(
	.sel(counter_mux_sel),
	.a(total_instruction_count),
	.b(misprediction_count),
	.c(total_branch_count),
	.d(stall_count),
	.e(),
	.f(),
	.g(l2_miss_counter),
	.h(l2_hit_counter),
	.i(icache_miss_counter),
	.j(icache_hit_counter),
	.k(dcache_miss_counter),
	.l(dcache_hit_counter),
	.m(),
	.n(),
	.o(),
	.p(),
	.out(counter_mux_out)
);

endmodule: counter_control
