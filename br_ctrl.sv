import lc3b_types::*;

module br_ctrl
(
    input branch_enable,
	 input lc3b_opcode opcode,
    output logic[1:0] out
);

always_comb
begin
	out = 2'b00;
		case(opcode):
			op_br : begin 
				if (branch_enable == 1) out = 2'b01;
				else out = 2'b00;
			end
			op_jmp : begin
				out = 2'b01;
			end
			op_jsr : begin
				out = 2'b01;
			end
			op_trap : begin
				out = 2'b10;
			end
end

endmodule : br_ctrl
