module lru_replace
(
	input [2:0] lru_out,
	output logic [1:0] wb_way_sel
);

always_comb
begin
	if(lru_out[0])
	begin
		if(lru_out[1])
		begin
			wb_way_sel = 2'b00;
		end
		else
		begin
			wb_way_sel = 2'b01;
		end
	end
	else
	begin
		if(lru_out[2])
		begin
			wb_way_sel = 2'b10;
		end
		else
		begin
			wb_way_sel = 2'b11;
		end
	end
		
end
		
endmodule : lru_replace