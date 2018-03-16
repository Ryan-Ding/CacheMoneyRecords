import lc3b_types::*;

module mem_enable_ctrl
(
	 input lc3b_opcode opcode,
	 input is_even,
    output logic[1:0] out
);

always_comb
begin
	out = 2'b00;
		case(opcode) 
			op_str : out = 2'b11;
			op_ldr : out = 2'b11;
			op_sti : out = 2'b11;
			op_ldi : out = 2'b11;
			op_stb: begin
				if(is_even)
					out = 2'b01;
				else
					out = 2'b10;
				end
		endcase
end

endmodule : mem_enable_ctrl
