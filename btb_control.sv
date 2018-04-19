import lc3b_types::*;

module btb_control
(
	input wb_enable,
	input pc_hit,
	input wb_hit,
	input wb_comp0_out,
	input wb_comp1_out,
	input wb_comp2_out,
	input wb_comp3_out,
	input [2:0] lru_out,
	output logic way0_write,
	output logic way1_write,
	output logic way2_write,
	output logic way3_write,
	output logic lru_load
);

always_comb
begin
	//default logics
	way0_write = 0;
	way1_write = 0;
	way2_write = 0;
	way3_write = 0;
	lru_load = 0;
	
	if (wb_enable)
	begin
	lru_load = 1;
			if(!wb_hit) //when write back miss
			begin
				if(lru_out[0])
				begin
					if(lru_out[1])
					begin
						way0_write = 1;
					end
					else
					begin
						way1_write = 1;
					end
				end
				else
				begin
					if(lru_out[2])
					begin
						way2_write = 1;
					end
					else
					begin
						way3_write = 1;
					end
				end
			end
			
			else //wb_hit
			begin
				way0_write = wb_comp0_out;
				way1_write = wb_comp1_out;
				way2_write = wb_comp2_out;
				way3_write = wb_comp3_out;
			end
	end
					
end

endmodule : btb_control