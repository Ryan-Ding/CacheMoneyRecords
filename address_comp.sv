import lc3b_types::*;

module address_comp
(
	input lc3b_word icache_address,
	input lc3b_word dcache_address,
	input lc3b_word pmem_address,
	output logic l1datamux_sel

);

always_comb
begin
	l1datamux_sel = 1'b0;
	if ((icache_address == pmem_address) | (dcache_address == pmem_address))
		l1datamux_sel = 1'b1;
end

endmodule : address_comp