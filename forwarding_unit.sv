import lc3b_types::*;

module forwarding_unit
(
	input lc3b_reg if_id_sr1,
	input lc3b_reg if_id_sr2,
	input lc3b_reg id_ex_sr1,
	input lc3b_reg id_ex_sr2,
	input lc3b_reg id_ex_dest,
	input lc3b_reg ex_mem_dest,
	input lc3b_reg mem_wb_dest,
	input logic ex_mem_load_regfile,
	input logic mem_wb_load_regfile,
	input logic id_ex_sr1use,
	input logic id_ex_sr2use,
	input logic if_id_sr1use,
	input logic if_id_sr2use,
	input lc3b_opcode id_ex_opcode,
	output logic ir_id_mux_sel,
	output logic ctrl_id_mux_sel,
	output lc3b_sel2 forwardmuxsr1_sel,
	output lc3b_sel2 forwardmuxsr2_sel,
	output logic forward_fetch_stall
);

always_comb
begin
	forwardmuxsr1_sel = 2'b00;
	forwardmuxsr2_sel = 2'b00;
	ir_id_mux_sel = 1'b0;
	ctrl_id_mux_sel = 1'b0;
	forward_fetch_stall = 1'b0;
	//exe hazard
	if ( ex_mem_load_regfile && ex_mem_dest == id_ex_sr1 && id_ex_sr1use )
		forwardmuxsr1_sel = 2'b01;
	if (ex_mem_load_regfile && ex_mem_dest == id_ex_sr2 && id_ex_sr2use )
		forwardmuxsr2_sel = 2'b01;
	//mem hazard and not exe hazard
	if (( mem_wb_load_regfile && mem_wb_dest == id_ex_sr1 && id_ex_sr1use ) && (!( ex_mem_load_regfile && ex_mem_dest == id_ex_sr1 && id_ex_sr1use)))
		forwardmuxsr1_sel = 2'b10;
	if (( mem_wb_load_regfile && mem_wb_dest == id_ex_sr2 && id_ex_sr2use ) && (!(ex_mem_load_regfile && ex_mem_dest == id_ex_sr2 && id_ex_sr2use )))
		forwardmuxsr2_sel = 2'b10;

	//insert bubble
	if ( (id_ex_opcode == op_ldr || id_ex_opcode == op_ldb || id_ex_opcode == op_ldi) && (( id_ex_dest == if_id_sr1 && if_id_sr1use ) || ( id_ex_dest == if_id_sr2 && if_id_sr2use ) ))
	begin
		ir_id_mux_sel = 1'b1;
		ctrl_id_mux_sel = 1'b1;
		forward_fetch_stall = 1'b1;
	end
//	else if (  )
	
end

endmodule: forwarding_unit