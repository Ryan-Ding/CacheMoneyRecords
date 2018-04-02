//module to generate control word

import lc3b_types::*;
module control_rom
(
input lc3b_opcode opcode,
input bit4,bit5, bit11,
output lc3b_control_word ctrl
);

always_comb
begin
/* Default assignments */
ctrl.opcode = opcode;
ctrl.aluop = alu_add;
ctrl.load_regfile = 1'b0;
ctrl.load_cc = 1'b0;
ctrl.storemux_sel = 1'b0;
ctrl.destmux_sel = 1'b0;
ctrl.alumux8_sel = 3'b000;
ctrl.alumux2_sel = 1'b0;
ctrl.ldbmux_sel = 1'b0;
ctrl.aluoutmux_sel = 2'b00;
ctrl.wbmux_sel = 2'b00;
ctrl.mem_byte_enable = 2'b11;
ctrl.mem_read = 1'b0;
ctrl.mem_write = 1'b0;
ctrl.sr2mux_sel = 1'b0;
ctrl.mem_mar_sel=1'b0;
ctrl.sr1use = 1'b0;
ctrl.sr2use = 1'b0;
/* Assign control signals based on opcode */
case(opcode)
	op_add: begin
		ctrl.aluop = alu_add;
		ctrl.load_cc = 1'b1;
		ctrl.destmux_sel = 1'b0;
		if (bit5 == 0) begin
			ctrl.alumux8_sel = 2'b00;
			ctrl.sr1use = 1'b1;
			ctrl.sr2use = 1'b1;
		end
		else begin
			ctrl.alumux8_sel = 3'b001;
			ctrl.sr1use = 1'b1;
		end

		ctrl.wbmux_sel = 2'b10;
		ctrl.load_regfile = 1'b1;
	end
	op_and: begin
		ctrl.aluop = alu_and;
		ctrl.load_cc = 1'b1;
		ctrl.destmux_sel = 1'b0;
		if (bit5 == 0) begin
			ctrl.alumux8_sel = 2'b00;
			ctrl.sr1use = 1'b1;
			ctrl.sr2use = 1'b1;
		end
		else begin
			ctrl.alumux8_sel = 3'b001;
			ctrl.sr1use = 1'b1;
		end
	
		ctrl.wbmux_sel = 2'b10;
		ctrl.load_regfile = 1'b1;
	end
	op_br: begin
		ctrl.aluop = alu_add;
		ctrl.alumux2_sel = 1'b1;
		ctrl.alumux8_sel = 3'b011;
	end
	op_ldr: begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b110;

		ctrl.aluoutmux_sel = 2'b00;
		ctrl.wbmux_sel = 2'b01;
		ctrl.load_cc = 1'b1;
		ctrl.mem_read = 1'b1;
		ctrl.load_regfile = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
	end
	op_not: begin
		ctrl.aluop = alu_not;

		ctrl.aluoutmux_sel = 2'b00;
		ctrl.load_cc = 1'b1;
		ctrl.wbmux_sel = 2'b10;
		ctrl.load_regfile = 1'b1;
		ctrl.sr1use = 1'b1;
	end
	op_str:begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b110;
		ctrl.wbmux_sel = 2'b00;
		//ctrl.mem_byte_enable = 2'b11;
		ctrl.mem_write = 1'b1;
		ctrl.storemux_sel = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
		ctrl.sr2use = 1'b1;
	end
	op_shf:begin
		ctrl.alumux8_sel = 3'b010;
		ctrl.load_regfile = 1'b1;
		ctrl.load_cc = 1'b1;
		ctrl.wbmux_sel = 2'b10;
		ctrl.sr1use = 1'b1;
		if (bit4)
			begin
			if(!bit5)
				ctrl.aluop = alu_srl;
			else 
				ctrl.aluop = alu_sra;
			end
		else
			ctrl.aluop = alu_sll;
	end
	op_jmp:begin
		ctrl.aluop = alu_pass;
		ctrl.sr1use = 1'b1;
		end
	op_jsr:begin
		ctrl.destmux_sel = 1'b1;
		ctrl.load_regfile = 1'b1;
		if(bit11)
		begin
			ctrl.alumux2_sel = 1'b1;
			ctrl.alumux8_sel = 3'b100;
		end
		else begin
			ctrl.aluoutmux_sel = 2'b01;
			ctrl.sr1use = 1'b1;
		end
	end
	op_lea:begin
		ctrl.alumux2_sel = 1'b1;
		ctrl.alumux8_sel = 3'b011;
		ctrl.wbmux_sel = 2'b10;
		ctrl.load_regfile = 1'b1;
		ctrl.load_cc = 1'b1;
	end
	op_ldb: begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b101;
		ctrl.ldbmux_sel = 1'b1;
		ctrl.aluoutmux_sel = 2'b00;
		ctrl.wbmux_sel = 2'b01;
		ctrl.load_cc = 1'b1;
		ctrl.mem_read = 1'b1;
		ctrl.load_regfile = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
	end
	op_stb:begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b101;
		//ctrl.mem_byte_enable = 2'b11;
		ctrl.mem_write = 1'b1;
		ctrl.storemux_sel = 1'b1;
		ctrl.sr2mux_sel = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
	end
	
	op_ldi: begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b110;
		ctrl.wbmux_sel = 2'b01;
		ctrl.load_cc = 1'b1;
		ctrl.mem_read = 1'b1;
		ctrl.load_regfile = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
	end
	op_sti:begin
		ctrl.aluop = alu_add;
		ctrl.alumux8_sel = 3'b110;
		//ctrl.mem_byte_enable = 2'b11;
		ctrl.mem_write = 1'b1;
		ctrl.storemux_sel = 1'b1;
		ctrl.mem_mar_sel=1'b1;
		ctrl.sr1use = 1'b1;
	end
	op_trap:begin
		ctrl.destmux_sel = 1'b1;
		ctrl.load_regfile = 1'b1;
		ctrl.aluoutmux_sel = 2'b10;
		ctrl.mem_read = 1'b1;
		ctrl.mem_mar_sel=1'b1;
	end
	
		
	
	default: begin
	ctrl = 0; /* Unknown opcode, set control word to zero */
	end
endcase
end
endmodule : control_rom