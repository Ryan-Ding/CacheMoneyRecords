import lc3b_types::*;

module mem_address_lsb
(
	 /*memory signals*/
	 input lc3b_word mem_address,
	 output logic lsb
);

always_comb
begin
   if (mem_address[0] == 0) 
		lsb = 1'b0;
	else
		lsb = 1'b1;
end

endmodule : mem_address_lsb