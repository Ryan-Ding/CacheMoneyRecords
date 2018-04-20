import lc3b_types::*;

module global_br_predictor
(
    input clk,
    input lc3b_word if_pc,
	 input lc3b_word wb_pcplus2,
    input wbisbranch,
	 input actual_taken,
    output logic gl_pred_taken,
	 output logic gl_pred_correct
);

lc3b_word wb_pc;
logic [7:0] bhrout;
logic [1:0] pht_update_taken;
logic [1:0] current_state;
logic [1:0] pht_out;


assign wb_pc = wb_pcplus2 - 4'h2;
assign gl_pred_taken = pht_out[1];
assign gl_pred_correct = (current_state[1] == actual_taken);

pattern_hist_table #(.entry (10)) pattern_hist_table
(
    .clk,
    .load(wbisbranch),
    .in(pht_update_taken),
    .read_index({if_pc[7:1],bhrout[2:0]} ),
	 .write_index({wb_pc[7:1],bhrout[2:0]} ),
    .pht_out(pht_out),
	 .current_state
);

bhr #(.width (8) ) bhr
(
    .clk,
    .load(wbisbranch),
    .taken(actual_taken),
    .bhrout
);

pht_update_ctrl pht_update_ctrl
(
    .clk,
    .actual_taken,
	 .current_state(current_state),
    .next_states(pht_update_taken)
);


endmodule : global_br_predictor
