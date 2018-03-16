import lc3b_types::*;

module mem_rdatabzext
(
	 /*memory signals*/
	 input lc3b_word mem_rdata,
	 input lsb,
	 output lc3b_word mem_rdatab
);

always_comb
begin
   if (lsb == 0) 
		mem_rdatab = ({8'b0,mem_rdata[7:0]});
	else
		mem_rdatab = ({8'b0,mem_rdata[15:8]});
end

endmodule : mem_rdatabzext