import lc3b_types::*;

module local_br_predictor
(
    input clk,
    input lc3b_word if_pc,
	 input lc3b_word wb_pcplus2,
    input wbisbranch,
	 input actual_taken,
    output logic lc_pred_taken,
	 output logic lc_pred_correct
);

lc3b_word wb_pc;

logic [1:0] pht_update_taken;
logic [1:0] current_state;
logic [1:0] pht_out;

assign wb_pc = wb_pcplus2 - 4'h2;
assign lc_pred_taken = pht_out[1];
assign lc_pred_correct = (current_state[1] == actual_taken);

pattern_hist_table #(.entry (8)) local_br_hist_table
(
    .clk,
    .load(wbisbranch),
    .in(pht_update_taken),
    .read_index(if_pc[7:0] ),
	 .write_index(wb_pc[7:0] ),
    .pht_out(pht_out),
	 .current_state
);

pht_update_ctrl local_bht_update_ctrl
(
    .clk,
    .actual_taken,
	 .current_state(current_state),
    .next_states(pht_update_taken)
);


endmodule : local_br_predictor
