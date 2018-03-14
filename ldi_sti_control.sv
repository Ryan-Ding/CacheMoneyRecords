import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module ldi_sti_control
(
    /* Input and output port declarations */
	 input clk,
	 input mem_resp,
	 input lc3b_opcode opcode,

	 output logic proceed
);

logic ldi_sti;

enum int unsigned {
    /* List of states */
	first_access,
	second_access
} state, next_state;

always_comb
begin :
    /* Default output assignments */
	 /* Default assignments */
		proceed = 1'b0;
		ldi_sti = 1'b0;
		next_state = state;
		
		if(opcode == op_sti || op_ldi)
			ldi_sti = 1'b1;
		else if (opcode == op_str || op_ldr || op_str || op_ldb || op_stb)
			ldi_sti = 1'b0;
		
    /* Actions for each state */
	 case(state)
	 
			first_access: begin
			if(!ldi_sti && mem_resp)
				proceed = 1'b1;
			else if (ldi_sti && mem_resp)
				next_state = second_access;
			end
			
			second_access:begin
			if(mem_resp)
			begin
				proceed = 1'b1;
				next_state = first_access;
			end
			
			end
			
			default: /* Do nothing */;
		endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end

endmodule : ldi_sti_control
