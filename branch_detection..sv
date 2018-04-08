import lc3b_types::*;

module branch_detection
(
    input [1:0] br_ctrl_out,
    input lc3b_word aluout_mem_wb_out,
	 input lc3b_word mem_data_mem_wb_out,
	 input lc3b_word predict_addr,
    output logic flush
);

always_comb
begin
	flush = 1'b0;
	if  (((aluout_mem_wb_out + 4'h2) != predict_addr ) & (br_ctrl_out == 2'b01) )
		flush = 1'b1;
	if (((mem_data_mem_wb_out + 4'h2) != predict_addr ) & (br_ctrl_out == 2'b10) )
		flush = 1'b1;

end

endmodule : branch_detection
