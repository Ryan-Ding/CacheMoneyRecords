import lc3b_types::*;

module choice_predictor
(
    input clk,
    input lc3b_word if_pc,
	 input lc3b_word wb_pcplus2,
    input wbisbranch,
    input lc_pred_correct,
	 input gl_pred_correct,
	 output logic pred_select
);

lc3b_word wb_pc;
logic [1:0] meta_pred;
logic [1:0] meta_update;
logic [1:0] current_state;
logic [1:0] pht_out;
logic [1:0] inc;


assign wb_pc = wb_pcplus2 - 4'h2;
assign gl_pred_taken = pht_out[1];
assign pred_select = meta_pred[1];

pattern_hist_table #(.entry (8)) meta_table
(
    .clk,
    .load(wbisbranch),
    .in(meta_update),
    .read_index(if_pc[7:0] ),
	 .write_index(wb_pc[3:0] ),
    .pht_out(meta_pred), //read
	 .current_state //write output
);

always_comb
begin

	//p0 local p1 global 0 1 inc 
	if ( lc_pred_correct && (!gl_pred_correct) )
		inc = 1;
	else if ( (!lc_pred_correct) && gl_pred_correct)
		inc = 0;
	else inc = 2;	//no update
	
	meta_update = current_state;	
	if (current_state > 0 && inc == 0)
		meta_update = current_state - 1;
	else if (current_state < 3 && inc == 1)
		meta_update = current_state + 1;
end


endmodule : choice_predictor
