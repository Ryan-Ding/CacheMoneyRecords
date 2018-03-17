import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module ldi_sti_control
(
    /* Input and output port declarations */
	 input clk,
	 input mem_resp,
	 input lc3b_opcode opcode,

	 output logic proceed,
	 output logic ldi_addr_register_load,
	 output logic memaddrmux_sel,
	 output logic sti_WE
);

logic ldi_sti;

enum int unsigned {
    /* List of states */
	first_access,
	second_access
} state, next_state;

always_comb
begin
    /* Default output assignments */
	 /* Default assignments */
		proceed = 1'b1;
		ldi_sti = 1'b0;
		ldi_addr_register_load = 1'b0;
		memaddrmux_sel = 1'b0;
		sti_WE = 1'b1;
		next_state = state;
		
		if(opcode == op_sti || opcode == op_ldi) begin
			ldi_sti = 1'b1;
			ldi_addr_register_load = 1'b1;
			end
		else if (opcode == op_str || opcode == op_ldr || opcode == op_ldb || opcode == op_stb) begin
			ldi_sti = 1'b0;
			ldi_addr_register_load = 1'b1;
			end
		
    /* Actions for each state */
	 case(state)
	 
			first_access: begin
			if(ldi_sti)
			begin
				ldi_addr_register_load = 1'b1;
				proceed = 1'b0;
				sti_WE = 1'b0;
			end
			if(!ldi_sti && mem_resp)
				proceed = 1'b1;
			else if (ldi_sti && mem_resp)
				next_state = second_access;
			end
			
			second_access:begin
			memaddrmux_sel = 1'b1;
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
