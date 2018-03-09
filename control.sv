//module to generate control word

import lc3b_types::*;
module control_rom
(
input lc3b_opcode opcode,
output lc3b_control_word ctrl
);

always_comb
begin
/* Default assignments */
ctrl.opcode = opcode;
ctrl.load_cc = 1’b0;
ctrl.storemux_sel;
ctrl.destmux_sel;
ctrl.alumux8_sel = 2'b00;
ctrl.alumux2_sel;
ctrl.aluoutmux_sel;
ctrl.wbmux_sel;
ctrl.mem_byte_enable = 2'b00;
/* Assign control signals based on opcode */
case(opcode)
	op_add: begin
		ctrl.aluop = alu_add;
	end
	op_and: begin
		ctrl.aluop = alu_and;
	end
	
	default: begin
	ctrl = 0; /* Unknown opcode, set control word to zero */
	end
endcase
end
endmodule : control_rom