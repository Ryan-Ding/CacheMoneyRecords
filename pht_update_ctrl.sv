import lc3b_types::*;

module pht_update_ctrl
(
    input clk,
    input actual_taken,
	 input [1:0] current_state,
    output logic [1:0] next_states
);


always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	next_states = current_state;
	case(current_state)
		2'b10: //wt:
			if(actual_taken) next_states = 2'b11;
			else next_states = 2'b01;
		2'b11: //st: 
			if (actual_taken) next_states = 2'b11;
			else next_states = 2'b10;
		2'b01: //wn: 
			if(actual_taken) next_states = 2'b10;
			else next_states = 2'b00;
		2'b00: //sn:
			if(actual_taken) next_states = 2'b01;
			else next_states = 2'b00;
	endcase
end


endmodule : pht_update_ctrl
