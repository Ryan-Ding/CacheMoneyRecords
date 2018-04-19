import lc3b_types::*;

module branch_detection
(
    input lc3b_word aluout_mem_wb_out,
	 input lc3b_word mem_data_mem_wb_out,
	 input lc3b_word predict_addr,
	 input wbisbranch,
    output logic flush
);

always_comb
begin
	flush = 1'b0;
	if  (((aluout_mem_wb_out + 4'h2) != predict_addr ) & (wbisbranch) )
		flush = 1'b1;
	if (((mem_data_mem_wb_out + 4'h2) != predict_addr ) & (wbisbranch) )
		flush = 1'b1;

end

endmodule : branch_detection
