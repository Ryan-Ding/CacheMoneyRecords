import lc3b_types::*;

module btb_lru_state
(
    input [2:0] lru_out,
	 input [1:0] wb_way_hit,
    output logic [2:0] lru_in
);

assign lru_in[0] = wb_way_hit[1];

always_comb
begin
	if(wb_way_hit[1])
		begin
			lru_in[2] = wb_way_hit[0];
			lru_in[1] = lru_out[1];
		end
	else
		begin
			lru_in[1] = wb_way_hit[0];
			lru_in[2] = lru_out[2];
		end
end

endmodule : btb_lru_state
